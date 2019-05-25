
/* ----------------------------------------------------------------------------
Function: btc_fnc_task_create

Description:
    Fill me when you edit me !

Parameters:
    _task_id - [String]
    _destination - []
    _location - []

Returns:
    jipID - return the join in process

Examples:
    (begin example)
        [0, "btc_dft"] call btc_fnc_task_create;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_task_ids", "btc_dft", ["", []]],
    ["_description", 0, [0]],
    ["_destination", objNull, [objNull, []]],
    ["_location", "", ["", []]],
    ["_showNotification", true, [true]]
];

[btc_player_side, _task_ids] call BIS_fnc_taskCreate;
[_task_ids, btc_player_side, _description, _destination, 2, _showNotification, _location] remoteExecCall ["btc_fnc_task_setDescription", [0, -2] select isDedicated, true];