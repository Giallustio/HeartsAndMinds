
/* ----------------------------------------------------------------------------
Function: btc_fnc_task_create

Description:
    Create the task server side and add description to each client and JIP client.

Parameters:
    _task_ids - ID of the task. [String]
    _description - Nuber of the corresponding description. [Number]
    _destination - Destination of the task. [Object or Array]
    _location - Custom information to fill the task description. [String or Array]
    _isCurrent - Set task as current. [Boolean]
    _showNotification - Show notification. [Boolean]

Returns:
    _jipID - return the join in process ID. [String]

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
    ["_isCurrent", false, [false]],
    ["_showNotification", true, [true]]
];

[btc_player_side, _task_ids] call BIS_fnc_taskCreate;
[_task_ids, btc_player_side, _description, _destination, 2, _showNotification, _location] remoteExecCall ["btc_fnc_task_setDescription", [0, -2] select isDedicated, true];

if (_isCurrent) then {
    private _task_id = if (_task_ids isEqualType []) then {
        _task_ids select 0
    } else {
        _task_ids
    };
    _task_id call BIS_fnc_taskSetCurrent;
};