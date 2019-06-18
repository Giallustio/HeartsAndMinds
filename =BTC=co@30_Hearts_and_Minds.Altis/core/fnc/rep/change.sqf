
/* ----------------------------------------------------------------------------
Function: btc_fnc_rep_change

Description:
    Change reputation level.

Parameters:
    _reputation - Number to add or substrat to the reputation level. [Number]

Returns:

Examples:
    (begin example)
        [-10] call btc_fnc_rep_change;
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
