
/* ----------------------------------------------------------------------------
Function: btc_fnc_mil_create_staticOnRoof

Description:
    Create static on roof.

Parameters:
    _house - House to find the roof. [Group]
    _n - Number of static to generate. [Number]

Returns:

Examples:
    (begin example)
        _result = [[position player, 30] call btc_fnc_getHouses, 3] call btc_fnc_mil_create_staticOnRoof;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_houses", [], [[]]],
    ["_n", 0, [0]]
];

private _j = 1;
for "_i" from 1 to _n do {
    if (_houses isEqualTo []) exitWith {};

    private _house = _houses deleteAt 0;
    ([_house] call btc_fnc_roof) params ["_spawnPos", "_surfaceNormal"];

    if (acos (_surfaceNormal vectorCos [0, 0, 1]) < 30) then {
        [ASLToATL _spawnPos, btc_type_mg + btc_type_gl, (_house getDir _spawnPos) + (random [-15, 0, 15]), _surfaceNormal] call btc_fnc_mil_create_static;
        _j = _i;
    } else {
        _i = _j;
    };
};
