
/* ----------------------------------------------------------------------------
Function: btc_fnc_task_setState

Description:
    Set state to multiple task.

Parameters:
    _tasks - Array of task to change state. [Array]
    _state - State to apply. [String]

Returns:
    IsSet - if the state has changed array. [Boolean]

Examples:
    (begin example)
        [["btc_dft"], "CANCELED"] call btc_fnc_task_setState;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_tasks", [], [[]]],
    ["_state", "CANCELED", [""]]
];

_tasks apply {
    if !(_x call BIS_fnc_taskCompleted) then {
        [_x, _state] call BIS_fnc_taskSetState
    } else {
        false
    };
}