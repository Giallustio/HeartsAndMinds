
/* ----------------------------------------------------------------------------
Function: btc_fnc_patrol_eh_remove

Description:
    Fill me when you edit me !

Parameters:
    _veh - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_patrol_eh_remove;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_veh", objNull, [objNull]]
];

[_veh, "Fuel", "btc_fnc_patrol_eh"] call btc_fnc_eh_removePersistOnLocalityChange;
[_veh, "GetOut", "btc_fnc_patrol_eh"] call btc_fnc_eh_removePersistOnLocalityChange;
[_veh, "HandleDamage", "btc_fnc_patrol_disabled"] remoteExecCall ["btc_fnc_eh_removePersistOnLocalityChange", _veh];
[_veh, "HandleDamage", "btc_fnc_rep_hd"] remoteExecCall ["btc_fnc_eh_removePersistOnLocalityChange", _veh];
