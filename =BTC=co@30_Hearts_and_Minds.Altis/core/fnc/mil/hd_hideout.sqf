
/* ----------------------------------------------------------------------------
Function: btc_fnc_mil_hd_hideout

Description:
    Fill me when you edit me !

Parameters:
    _hideout - [Object]
    _selection - [String]
    _damage - [Number]
    _source - [Object]
    _ammo - [String]
    _hitIndex - [Number]
    _instigator - [Object]
    _hitPoint - [String]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_mil_hd_hideout;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_hideout", objNull, [objNull]],
    ["_selection", "", [""]],
    ["_damage", 0, [0]],
    ["_source", objNull, [objNull]],
    ["_ammo", "", [""]],
    ["_hitIndex", 0, [0]],
    ["_instigator", objNull, [objNull]],
    ["_hitPoint", "", [""]]
];
params ["_hideout", "_selection", "_damage", "_source", "_ammo", "_hitIndex", "_instigator", "_hitPoint"];

private _explosive = getNumber(configFile >> "cfgAmmo" >> _ammo >> "explosive") > 0;

if (_explosive && {_damage > 0.6}) then {
    private _id = _hideout getVariable "id";

    for "_i" from 0 to (count btc_hideouts - 1) do {
        if ((btc_hideouts select _i) getVariable "id" isEqualTo _id) then {
            btc_hideouts set [_i, 0];
        };
    };
    btc_hideouts = btc_hideouts - [0];

    btc_rep_bonus_hideout spawn btc_fnc_rep_change;

    private _marker = createMarker [format ["btc_hideout_%1_destroyed", _id], getPos _hideout];
    _marker setMarkerType "hd_destroy";
    [_marker, "STR_BTC_HAM_O_EH_HDHIDEOUT_MRK", _id] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker];
    _marker setMarkerSize [1, 1];
    _marker setMarkerColor "ColorRed";

    private _city = _hideout getVariable ["assigned_to", _hideout];
    _city setVariable ["has_ho", false];

    deleteVehicle (nearestObject [getPos _hideout, "Flag_Red_F"]);
    _hideout setDamage 1;

    private _array = _hideout getVariable ["markers", []];

    {deleteMarker _x} forEach _array;

    if (btc_hq isEqualTo _hideout) then {btc_hq = objNull};
    if (btc_hideouts isEqualTo []) then {[] spawn btc_fnc_final_phase;};

    //Notification
    [2, count btc_hideouts] remoteExec ["btc_fnc_show_hint", 0];
    if (btc_debug_log) then {
        [format ["_this = %1 ; POS %2 ID %3", _this, getPos _hideout, _id], __FILE__, [false]] call btc_fnc_debug_message;
    };
} else {
    0
};
