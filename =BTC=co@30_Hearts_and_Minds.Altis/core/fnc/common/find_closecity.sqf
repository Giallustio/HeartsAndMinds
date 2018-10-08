
/* ----------------------------------------------------------------------------
Function: btc_fnc_find_closecity

Description:
    Fill me when you edit me !

Parameters:
    _obj - [Object]
    _array - [Array]
    _isOccupied - [Boolean]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_find_closecity;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_obj", objNull, [objNull]],
    ["_array", [], [[]]],
    ["_isOccupied", true, [true]]
];

private _city_all_distance = [];
if (_isOccupied) then {
    _city_all_distance = _array select {!(_x getVariable ["occupied", false])};
} else {
    _city_all_distance = _array;
};
if (_city_all_distance isEqualTo []) exitWith {[]};

_city_all_distance = _city_all_distance apply {[_x distance _obj, _x]};
_city_all_distance sort true;
_city_all_distance select 0 select 1;
