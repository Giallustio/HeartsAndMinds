
/* ----------------------------------------------------------------------------
Function: btc_fnc_cache_hd_cache

Description:
    Destroy an ammo cache only when an explposive with damage > 0.6 is used.

Parameters:
    _cache - Object to destroy. [Object]
    _part - Not use. [String]
    _damage - Amount of damage get by the object. [Number]
    _injurer - Not use. [Object]
    _ammo - Type of ammo use to make damage. [String]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_cache_hd_cache;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_cache", objNull, [objNull]],
    ["_part", "", [""]],
    ["_damage", 0, [0]],
    ["_injurer", objNull, [objNull]],
    ["_ammo", "", [""]]
];

private _explosive = (getNumber(configFile >> "cfgAmmo" >> _ammo >> "explosive") > 0);

if (isNil {_cache getVariable "btc_hd_cache"} && {_explosive} && {_damage > 0.6}) then {
    _cache setVariable ["btc_hd_cache", true];

    //Effects
    private _pos = getPosATL btc_cache_obj;
    "Bo_GBU12_LGB_MI10" createVehicle _pos;
    [_pos] spawn {
        params ["_pos"];

        sleep 2;
        "M_PG_AT" createVehicle _pos;
        sleep 2;
        "M_Titan_AT" createVehicle _pos;
    };
    [_pos] call btc_fnc_deaf_earringing;
    [attachedObjects _cache, btc_cache_obj, btc_cache_markers] call CBA_fnc_deleteEntity;

    private _marker = createMarker [format ["btc_cache_%1", btc_cache_n], btc_cache_pos];
    _marker setMarkerType "hd_destroy";
    [_marker, "STR_BTC_HAM_O_EH_HDCACHE_MRK", btc_cache_n] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker]; //Cached %1 destroyed

    _marker setMarkerSize [1, 1];
    _marker setMarkerColor "ColorRed";

    if (btc_debug_log) then    {
        [format ["DESTROYED: ID %1 POS %2", btc_cache_n, btc_cache_pos], __FILE__, [false]] call btc_fnc_debug_message;
    };

    btc_rep_bonus_cache call btc_fnc_rep_change;

    btc_cache_pos = [];
    btc_cache_n = btc_cache_n + 1;
    btc_cache_obj = objNull;
    btc_cache_info = btc_info_cache_def;
    btc_cache_markers = [];

    //Notification
    [0] remoteExec ["btc_fnc_show_hint", 0];

    [] spawn {[] call btc_fnc_cache_find_pos;};
} else {
    0
};
