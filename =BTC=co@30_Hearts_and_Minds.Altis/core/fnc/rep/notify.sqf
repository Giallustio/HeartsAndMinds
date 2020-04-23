
/* ----------------------------------------------------------------------------
Function: btc_fnc_rep_notify

Description:
    Show reputation change with a picture and color nuance.

Parameters:
    _reputation - Reputation number. [Number]

Returns:

Examples:
    (begin example)
        [-10] call btc_fnc_rep_notify;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_reputation", btc_rep_delayed, [0]]
];

private _hint = [];
if (_reputation >= 0) then {
    _hint pushBack 20;
    private _minRep = _reputation min 100;
    _hint pushBack [1 - _minRep / 100, 1, 1 - _minRep / 100];
} else {
    _hint pushBack 21;
    private _minRep = _reputation max -25;
    _hint pushBack [1, 1 + _minRep / 25, 1 + _minRep / 25];
};
_hint remoteExecCall ["btc_fnc_show_hint", [0, -2] select isDedicated];

btc_rep_delayed = 0;
