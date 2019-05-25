
/* ----------------------------------------------------------------------------
Function: btc_fnc_task_abort

Description:
    Abort a side mission.

Parameters:
    _task_id - [String]
    _destination - []
    _location - []

Returns:

Examples:
    (begin example)
        ["btc_dft"] call btc_fnc_task_abort;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_task_id", "btc_dft", [""]]
];

if (_task_id isEqualTo "") exitWith {
    "No side mission assigned" call CBA_fnc_notify;
};

if (_task_id in ["btc_m", "btc_dty", "btc_dft"]) exitWith {
    "Isn't a side mission, can't abort" call CBA_fnc_notify;
};

[_task_id, "CANCELED"] remoteExecCall ["BIS_fnc_taskSetState", 2];
