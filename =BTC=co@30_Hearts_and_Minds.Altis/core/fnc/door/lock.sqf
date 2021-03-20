
/* ----------------------------------------------------------------------------
Function: btc_fnc_door_lock

Description:
    Disable door in a city.

Parameters:
    _city - City. [Array]

Returns:

Examples:
    (begin example)
        [player] call btc_fnc_door_lock;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_city", objNull, [objNull]]
];

private _houses = +(_city getVariable ["btc_city_houses", []]);
private _n = count _houses;
private _i = 1;

while {
    _i <= _n &&
    {_houses isNotEqualTo []}
} do {
    private _house = _houses deleteAt 0;
    private _numberOfDoors = getNumber (configOf _house >> "numberOfDoors");

    if (_numberOfDoors isNotEqualTo 0) then {
        for "_door" from 1 to _numberOfDoors do {
            _house setVariable [format ["bis_disabled_Door_%1", _door], 1, true];
        };
        _i = _i + 1;
    };
};

{
    if (_x getVariable ["bis_disabled_Door_1", 0] isEqualTo 1) then {
        for "_door" from 1 to getNumber (configOf _x >> "numberOfDoors") do {
            _x setVariable [format ["bis_disabled_Door_%1", _door], nil, true];
        };
    };
} forEach _houses;
