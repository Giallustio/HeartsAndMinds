
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

if (btc_debug || btc_debug_log) then {
    [format ["GLOBAL %1 - CHANGE %2", btc_global_reputation, _reputation], __FILE__, [btc_debug, btc_debug_log]] call btc_fnc_debug_message;
};

btc_global_reputation = btc_global_reputation + _reputation;

if (btc_p_rep_notify) then {
    if (btc_rep_delayed isEqualTo 0) then {
        [{abs(btc_rep_delayed) > 3}, {
            btc_rep_delayed call btc_fnc_rep_notify;
        }, [], 10 * 60, {
            btc_rep_delayed call btc_fnc_rep_notify;
        }] call CBA_fnc_waitUntilAndExecute;
    };
    btc_rep_delayed = btc_rep_delayed + _reputation;
};

true
