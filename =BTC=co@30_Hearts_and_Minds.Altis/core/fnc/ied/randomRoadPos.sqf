
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_randomRoadPos

Description:
    Find a position on a road based on the road width.
    The selection of the position is random (left, right or center).

Parameters:
    _road - Road segment. [Object]

Returns:
    Array:
        _this select 0: Position. [Array]
        _this select 1: Directon. [Number]

Examples:
    (begin example)
        _result = [(player nearRoads 20)#0] call btc_fnc_ied_randomRoadPos;
        player setPos _result#0;
        player setDir _result#1;
    (end)

Author:
    kuemmel

---------------------------------------------------------------------------- */
params [
    ["_road", objNull, [objNull]]
];
private _roadDir = _road call btc_fnc_road_direction;
private _roadRadius = ((0 boundingBoxReal _road) select 2) * 0.4;

private _centerPoint = createSimpleObject ["CBA_NamespaceDummy", (getPosWorld _road)];
_centerPoint setDir _roadDir;

private _result = selectRandom [
    [(_centerPoint modelToWorld [_roadRadius, 0, 0]), _roadDir],
    [(_centerPoint modelToWorld [-_roadRadius, 0, 0]), _roadDir],
    [_centerPoint modelToWorld [_roadRadius - random(2 * (_roadRadius * 0.9)), 0, 0], random 360]
];

deleteVehicle _centerPoint;

_result
