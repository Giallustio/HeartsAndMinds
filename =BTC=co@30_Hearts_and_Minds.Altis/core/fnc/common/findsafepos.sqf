
/* ----------------------------------------------------------------------------
Function: btc_fnc_common_findsafepos

Description:
    Fill me when you edit me !

Parameters:
    _check_pos - [Array]
    _mindist - [Number]
    _random_area - [Number]
    _objdist - [Number]
    _allow_water - []

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_common_findsafepos;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_check_pos", [0, 0, 0], [[]]],
    ["_mindist", 0, [0]],
    ["_random_area", 100, [0]],
    ["_objdist", 0, [0]],
    ["_allow_water", false, [false, 0]]
];

private _return_pos = [];
for "_i" from 0 to 4 do {
    _return_pos = [_check_pos, _mindist, _random_area, _objdist, [0, 1] select _allow_water, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    if (count _return_pos isEqualTo 2) exitWith {
        _return_pos = [_return_pos select 0, _return_pos select 1, 0];
    };

    _random_area = _random_area * 1.5;
};
_return_pos
