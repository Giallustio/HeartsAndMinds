
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

if (local _veh) then {
    [_veh, "Fuel", "btc_fnc_patrol_eh"] call btc_fnc_eh_removePersistantOnLocalityChange;
    [_veh, "GetOut", "btc_fnc_patrol_eh"] call btc_fnc_eh_removePersistantOnLocalityChange;
    [_veh, "HandleDamage", "btc_fnc_rep_hd"] call btc_fnc_eh_removePersistantOnLocalityChange;
} else {
    _veh remoteExecCall ["btc_fnc_patrol_eh_remove", _veh];
};
