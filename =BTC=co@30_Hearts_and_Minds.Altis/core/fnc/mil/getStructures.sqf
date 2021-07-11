
/* ----------------------------------------------------------------------------
Function: btc_mil_fnc_getStructures

Description:
    Fill me when you edit me !

Parameters:
    _pos - [Array]
    _radius - [Number]

Returns:

Examples:
    (begin example)
        _result = [] call btc_mil_fnc_getStructures;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_pos", [0, 0, 0], [[]]],
    ["_radius", 100, [0]]
];

private _structures = (nearestTerrainObjects [_pos, ["House", "BUNKER", "FORTRESS"], _radius]) select {getText(configOf _x >> "editorSubcategory") isEqualTo "EdSubcat_Military"};

private _useful = _structures select {(
    (_x buildingPos -1) isNotEqualTo [] &&
    {damage _x isEqualTo 0}
)};

_useful
