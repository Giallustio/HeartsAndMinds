
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_get_corner_points

Description:
    Fill me when you edit me !

Parameters:
    _vehicle - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_log_get_corner_points;
    (end)

Author:
    sethduda

---------------------------------------------------------------------------- */

params [
    ["_vehicle", objNull, [objNull]]
];

// Correct width and length factor for air
private _widthFactor = 0.75;
private _lengthFactor = 0.75;
if (_vehicle isKindOf "Air") then {
    _widthFactor = 0.3;
};
if (_vehicle isKindOf "Helicopter") then {
    _widthFactor = 0.2;
    _lengthFactor = 0.45;
};

(getCenterOfMass _vehicle) params ["_centerOfMass_x", "_centerOfMass_y", "_centerOfMass_z"];
(boundingBoxReal _vehicle) params ["_p1", "_p2"];
([0, 1] apply {abs ((_p2 select _x) - (_p1 select _x))}) params ["_maxWidth", "_maxLength"];

private _widthOffset = ((_maxWidth / 2) - abs _centerOfMass_x) * _widthFactor;
private _lengthOffset = ((_maxLength / 2) - abs _centerOfMass_y) * _lengthFactor;
private _rearCorner = [_centerOfMass_x + _widthOffset, _centerOfMass_y - _lengthOffset, _centerOfMass_z];
private _rearCorner2 = [_centerOfMass_x - _widthOffset, _centerOfMass_y - _lengthOffset, _centerOfMass_z];
private _frontCorner = [_centerOfMass_x + _widthOffset, _centerOfMass_y + _lengthOffset, _centerOfMass_z];
private _frontCorner2 = [_centerOfMass_x - _widthOffset, _centerOfMass_y + _lengthOffset, _centerOfMass_z];

[_rearCorner, _rearCorner2, _frontCorner, _frontCorner2];
