params ["_cache", "", "_damage", "", "_ammo"];

private _explosive = (getNumber(configFile >> "cfgAmmo" >> _ammo >> "explosive") > 0);

if (isNil {_cache getVariable "btc_hd_cache"} && {_explosive} && {_damage > 0.6}) then {
    _cache setVariable ["btc_hd_cache", true];
    {
        detach _x;
        deleteVehicle _x;
    } forEach attachedObjects _cache;

    //Effects
    private _pos = getposATL btc_cache_obj;
    "Bo_GBU12_LGB_MI10" createVehicle _pos;
    [_pos] spawn {
        params ["_pos"];

        sleep 2;
        "M_PG_AT" createVehicle _pos;
        sleep 2;
        "M_Titan_AT" createVehicle _pos;
    };
    [_pos] call btc_fnc_deaf_earringing;
    deleteVehicle btc_cache_obj;

    private _marker = createMarker [format ["btc_cache_%1", btc_cache_n], btc_cache_pos];
    _marker setMarkerType "hd_destroy";
    [_marker, "STR_BTC_HAM_O_EH_HDCACHE_MRK", btc_cache_n] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker]; //Cached %1 destroyed

    // Vehicle needs assistance
    _marker setMarkerSize [1, 1];
    _marker setMarkerColor "ColorRed";

    if (btc_debug_log) then    {
        [format ["CACHE DESTROYED: ID %1 POS %2", btc_cache_n, btc_cache_pos], __FILE__, [false]] call btc_fnc_debug_message;
    };

    btc_rep_bonus_cache spawn btc_fnc_rep_change;

    btc_cache_pos = [];
    btc_cache_n = btc_cache_n + 1;
    btc_cache_obj = objNull;
    btc_cache_info = btc_info_cache_def;
    {deleteMarker _x} forEach btc_cache_markers;
    btc_cache_markers = [];

    //Notification
    [0] remoteExec ["btc_fnc_show_hint", 0];

    [] spawn {[] call btc_fnc_cache_find_pos;};
} else {
    0
};
