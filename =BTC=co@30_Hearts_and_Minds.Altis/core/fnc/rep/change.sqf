
/* ----------------------------------------------------------------------------
Function: btc_fnc_rep_change

Description:
    Fill me when you edit me !

Parameters:
    _reputation - [Number]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_rep_change;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_reputation", 0, [0]]
];

if (btc_debug_log) then {
    [format ["GLOBAL %1 - CHANGE %2", btc_global_reputation, _reputation], __FILE__, [false]] call btc_fnc_debug_message;
};
btc_global_reputation = btc_global_reputation + _reputation;

true
