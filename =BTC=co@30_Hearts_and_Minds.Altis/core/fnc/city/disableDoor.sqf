
/* ----------------------------------------------------------------------------
Function: btc_fnc_city_disableDoor

Description:
    Disable door in a city.

Parameters:
    _city - City. [Array]

Returns:

Examples:
    (begin example)
        [player] call btc_fnc_city_disableDoor;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_city", objNull, [objNull]]
];

{
    for "_i" from 0 to getNumber (configOf _x >> "numberOfDoors") do {
        _x setVariable [format ["bis_disabled_Door_%1", _i], 1, true];
    };
} forEach (_city getVariable ["btc_city_houses", []]);
