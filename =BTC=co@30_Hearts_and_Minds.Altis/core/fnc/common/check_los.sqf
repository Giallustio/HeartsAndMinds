params ["_unit", "_target"];

(eyedirection _unit) params ["_point1", "_point2"];
private _atan = _point1 atan2 _point2;
private _dirTo = _target getDir _unit;
private _ang = abs (_dirTo - _atan);
private _can_see = (_ang > 120) && (_ang < 240);

if (_can_see) then {
    private _eyeu = eyePos _unit;
    private _eyet = eyePos _target;
    private _terr = terrainintersectasl [_eyeu, _eyet];
    private _int = lineintersects [_eyeu, _eyet];
    private _can_see = !(_int || _terr);
};
_can_see
