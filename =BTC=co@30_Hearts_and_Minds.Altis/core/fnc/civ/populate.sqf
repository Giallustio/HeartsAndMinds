
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
    ["_area", 50, [0]],
    ["_n", 0, [0]]
];

private _pos = position _city;
private _houses = [_pos, _area] call btc_fnc_getHouses;

if (_houses isEqualTo []) exitWith {};

for "_i" from 1 to _n do {
    if (_houses isEqualTo []) exitWith {};

    private _house = selectRandom _houses;

    private _pos = _house buildingPos 0;
    private _group = createGroup civilian;
    _group setVariable ["btc_data_inhouse", [_pos]];
    [_group, _pos] call btc_fnc_civ_addWP;
    [_group, selectRandom btc_civ_type_units, _pos] call btc_fnc_delay_createUnit;

    [{
        _this call btc_fnc_civ_unit_create;
    }, [_group], btc_delay_createUnit] call CBA_fnc_waitAndExecute;

    _houses = _houses - [_house];
};
