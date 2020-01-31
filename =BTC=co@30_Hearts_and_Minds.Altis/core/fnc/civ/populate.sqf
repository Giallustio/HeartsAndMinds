
/* ----------------------------------------------------------------------------
Function: btc_fnc_civ_populate

Description:
    Populate a city in an area with a defined number of civilians.

Parameters:
    _city - City to populate. [Object]
    _area - Area to populate around a city. [Number]
    _n - Number of civilians to generate. [Number]

Returns:

Examples:
    (begin example)
        [_city, 200, 3] call btc_fnc_civ_populate;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_city", objNull, [objNull]],
    ["_area", 0, [0]],
    ["_n", 0, [0]]
];

private _pos = position _city;
private _houses = [];

for [{_i = 25}, {_i < _area}, {_i = _i + 50}] do {
    private _hs = [[(_pos select 0) + _i, (_pos select 1) + _i, 0], 50] call btc_fnc_getHouses;
    _houses append _hs;
    _hs = [[(_pos select 0) + _i, (_pos select 1) - _i, 0], 50] call btc_fnc_getHouses;
    _houses append _hs;
    _hs = [[(_pos select 0) - _i, (_pos select 1) - _i, 0], 50] call btc_fnc_getHouses;
    _houses append _hs;
    _hs = [[(_pos select 0) - _i, (_pos select 1) + _i, 0], 50] call btc_fnc_getHouses;
    _houses append _hs;
};

if (_houses isEqualTo []) exitWith {};

for "_i" from 1 to _n do {
    if (_houses isEqualTo []) exitWith {};

    private _house = selectRandom _houses;
    private _unit_type = selectRandom btc_civ_type_units;

    private _group = createGroup civilian;
    _group createUnit [_unit_type, _house buildingPos 0, [], 0, "NONE"];
    _group setVariable ["btc_data_inhouse", [_house buildingPos 0]];
    [_group] call btc_fnc_civ_addWP;
    [_group] call btc_fnc_civ_unit_create;
    _houses = _houses - [_house];
};
