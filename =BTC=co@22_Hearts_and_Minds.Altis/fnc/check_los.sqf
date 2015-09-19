_unit = _this select 0;
_target = _this select 1;

_can_see = false;

_dir = eyedirection _a;
_atan = ((_dir select 0) atan2 (_dir select 1)); 
_dirTo = ([_target, _unit] call bis_fnc_dirto);
_ang = abs (_dirTo - _atan);
if ((_ang > 120) && (_ang < 240)) then {_can_see = true;};
if (_can_see) then
{
	_eyeu = eyepos _unit;
	_eyet = eyepos _target;
	_terr = terrainintersectasl [_eyeu, _eyet]; 
	_int = lineintersects [_eyeu, _eyet];
	if (_lint || _tint) then {_can_see = false;};
};
_can_see