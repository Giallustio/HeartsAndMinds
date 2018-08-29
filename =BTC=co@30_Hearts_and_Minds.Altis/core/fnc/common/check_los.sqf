
/* ----------------------------------------------------------------------------
Function: btc_fnc_common_check_los

Description:
    Fill me when you edit me !

Parameters:
    _unit - [Object]
    _target - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_common_check_los;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]],
    ["_target", objNull, [objNull]]
];

(eyeDirection _unit) params ["_point1", "_point2"];
private _atan = _point1 atan2 _point2;
private _dirTo = _target getDir _unit;
private _ang = abs (_dirTo - _atan);
private _can_see = (_ang > 120) && (_ang < 240);

if (_can_see) then {
    private _eyeu = eyePos _unit;
    private _eyet = eyePos _target;
    private _terr = terrainIntersectASL [_eyeu, _eyet];
    private _int = lineIntersects [_eyeu, _eyet];
    private _can_see = !(_int || _terr);
};
_can_see
