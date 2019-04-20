
/* ----------------------------------------------------------------------------
Function: btc_fnc_cache_nearestTerrainObjects

Description:
    .

Parameters:
	_position - Position to search around. [Array]
	_distance - Distance of research. [Number]

Returns:
    _nearest_building - Classe name of the nearest building. [String]
	_classnames - Classename of nearest terrain objects with editor preview. [Array]

Examples:
    (begin example)
        _result = [] call btc_fnc_cache_nearestTerrainObjects;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_position", btc_cache_obj, [objNull, []]],
    ["_distance", 10, [0]]
];

private _nearest_building = typeOf nearestBuilding _position;

private _classnames = [nearestTerrainObjects [_position, [], _distance, false]] call btc_fnc_typeOf;
_classnames select {isText (configfile >> "CfgVehicles" >> _x >> "editorPreview")};
_classnames pushBackUnique _nearest_building;

[_nearest_building, _classnames]
