
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_effects

Description:
    Fill me when you edit me !

Parameters:
    _pos - [Array]
    _caller - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_ied_effects;
    (end)

Author:
    1kuemmel1

---------------------------------------------------------------------------- */

params [
    ["_pos", [0, 0, 0], [[]]],
    ["_caller", player, [objNull]]
];

[_pos, _caller] spawn btc_fnc_ied_effect_blurEffect;
[_pos] spawn btc_fnc_ied_effect_smoke;
[_pos] spawn btc_fnc_ied_effect_rocks;
[_pos] spawn btc_fnc_ied_effect_shock_wave;
