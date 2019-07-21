
/* ----------------------------------------------------------------------------
Function: btc_fnc_patrol_disabled

Description:
    Delete vehicle disabled due to a high impact.

Parameters:
    _veh - Vehicle. [Object]

Returns:

Examples:
    (begin example)
        [veh] call btc_fnc_patrol_disabled;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_veh", objNull, [objNull]],
    ["_selection", "wheel_1_1_steering", [""]],
    ["_damage", 0.2, [0]]
];

if (_damage > 0.1) then {
    [_veh, "HandleDamage", "btc_fnc_patrol_disabled", false] call btc_fnc_eh_removePersistOnLocalityChange;
    [_veh] call btc_fnc_patrol_eh;
};

_damage
