
private ["_obj","_height","_fall","_xx","_yy"];

_obj    = _this select 0;
_xx = getPos _obj select 0;
_yy = getPos _obj select 1;
_height = (getPos _obj) select 2;
_fall   = 0.09;
while {((getPos _obj) select 2) > 0.1} do
{
	_fall = (_fall * 1.1);
	_obj setPos [_xx, _yy, _height];
	_height = _height - _fall;
	//hint format ["%1 - %2", (getPos _obj) select 2,_height];
	sleep 0.01;
};
_obj setPos [_xx, _yy, 0];