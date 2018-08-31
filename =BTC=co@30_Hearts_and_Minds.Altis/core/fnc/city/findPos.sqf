
/* ----------------------------------------------------------------------------
Function: btc_fnc_city_findPos

Description:
    Fill me when you edit me !

Parameters:
    _city - [Number]
    _area - [Array]
    _type_divers - [Array]
    _type_units - [Booleen]
    _p_sea - []

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_city_findPos;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_city", objNull, [objNull, []]],
    ["_area", 300, [0]],
    ["_type_divers", btc_type_divers, [[]]],
    ["_type_units", btc_type_units, [[]]],
    ["_p_sea", btc_p_sea, [true]]
];

if (_city isEqualType objNull) then {
    _city = position _city;
};

private _rpos = [_city, _area, _p_sea] call btc_fnc_randomize_pos;

private _unit_type = "";
private _pos_iswater = surfaceIsWater _rpos;
if (_pos_iswater) then {
    _unit_type = selectRandom _type_divers;
} else {
    _unit_type = selectRandom _type_units;
    private _newpos = _rpos findEmptyPosition [0, 40, _unit_type];
    if !(_newpos isEqualTo []) then {
        _rpos = _newpos;
    };
    _rpos = [_rpos] call btc_fnc_findPosOutsideRock;
};

[_rpos, _pos_iswater]
