
/* ----------------------------------------------------------------------------
Function: btc_fnc_patrol_eh

Description:
    Remove events and delete entity.

Parameters:
    _veh - Object to delete. [Object, Group]

Returns:

Examples:
    (begin example)
        [cursorTarget] call btc_fnc_patrol_eh;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_veh", objNull, [objNull, grpNull]]
];

if (btc_debug_log) then {
    [format ["%1", _veh], __FILE__, [false]] call btc_fnc_debug_message;
};

if (_veh isEqualType objNull) then {
    if (btc_debug) then {
        deleteMarker format ["Patrol_fant_%1", (_veh getVariable ["btc_crews", grpNull]) getVariable ["btc_patrol_id", 0]];
    };

    _veh call btc_fnc_patrol_eh_remove;
    [[], [_veh], [_veh getVariable ["btc_crews", grpNull]]] call btc_fnc_delete;
} else {
    (assignedVehicle leader _veh) call btc_fnc_patrol_eh_remove;
    [[], [assignedVehicle leader _veh], [_veh]] call btc_fnc_delete;
};
