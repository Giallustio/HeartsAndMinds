
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_pos_roadside

Description:
    Find positions along the roadside based on the road width.
    The selection of the position is random (left or right).

Parameters:
    road - road segment / object

Returns:
    Array:
        _this select 0: Pos
        _this select 1: Directon

Examples:
    (begin example)
        _result = _obj call btc_fnc_ied_pos_roadside;
    (end)

Author:
    kuemmel

---------------------------------------------------------------------------- */
params [
    ["_road", objNull]
];
private _roadDir = _road getRelDir ((roadsConnectedTo _road) select 0);
private _bBD = (boundingBoxReal _road) select 2;

private _centerPoint = createSimpleObject ["CBA_NamespaceDummy", (getPosWorld _road)];
_centerPoint setDir _roadDir;

private _posArr = selectRandom [
    (_centerPoint modelToWorld [(_bBD*0.4),0,0]),
    (_centerPoint modelToWorld [-(_bBD*0.4),0,0])
];

deleteVehicle _centerPoint;

[[_posArr select 0, _posArr select 1, 0], _roadDir]
