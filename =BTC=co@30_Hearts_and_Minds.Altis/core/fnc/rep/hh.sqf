
/* ----------------------------------------------------------------------------
Function: btc_fnc_rep_hh

Description:
    Fill me when you edit me !

Parameters:
    _healer - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_rep_hh;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_healer", objNull, [objNull]]
];

if (isPlayer _healer) then {
    btc_rep_bonus_civ_hh spawn btc_fnc_rep_change;

    if (btc_debug_log) then {
        [format ["GREP %1 THIS = %2", btc_global_reputation, _this], __FILE__, [false]] call btc_fnc_debug_message;
    };
};
