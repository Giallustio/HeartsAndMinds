
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_hitch_points

Description:
    Fill me when you edit me !

Parameters:
    _vehicle - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_log_hitch_points;
    (end)

Author:
    sethduda

---------------------------------------------------------------------------- */

params [
    ["_vehicle", objNull, [objNull]]
];

([_vehicle] call btc_fnc_log_get_corner_points) params [
    "_rearCorner",
    "_rearCorner2",
    "_frontCorner",
    "_frontCorner2"
];
private _rearHitchPoint = ((_rearCorner vectorDiff _rearCorner2) vectorMultiply 0.5) vectorAdd  _rearCorner2;
private _frontHitchPoint = ((_frontCorner vectorDiff _frontCorner2) vectorMultiply 0.5) vectorAdd  _frontCorner2;

[_frontHitchPoint, _rearHitchPoint];
