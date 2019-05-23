
/* ----------------------------------------------------------------------------
Function: btc_fnc_task_setDescription

Description:
    Fill me when you edit me !

Parameters:
    _task_id - [String]
    _destination - []
    _location - []

Returns:

Examples:
    (begin example)
        [0, "btc_dft"] call btc_fnc_task_setDescription;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_task_ids", [], [[]]],
    ["_side", west, [west]],
    ["_description", [], [[], ""]],
    ["_destination", [], [objNull, []]],
    ["_priority", 2, [0]],
    ["_isGlobal", false, [true]],
    ["_type", "", [""]]
];

private _task_id = (_task_ids select (count _task_ids - 1));
[
    _task_ids, _side, _description, _destination,
        _task_id call BIS_fnc_taskState,
    _priority, false, _isGlobal, _type
] call BIS_fnc_setTask;

[
    {!isNull player && {scriptDone btc_intro_done}},
    {
        params ["_task_id"];

        if !(_task_id call BIS_fnc_taskCompleted) then {
            _task_id call BIS_fnc_taskHint;
        };
    },
    _task_id
] call CBA_fnc_waitUntilAndExecute;
