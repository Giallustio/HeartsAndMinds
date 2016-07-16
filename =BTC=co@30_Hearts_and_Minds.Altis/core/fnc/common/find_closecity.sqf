
private ["_closest","_in_range","_distance"];

_obj = _this select 0;

_distance = 999999;
{
	if (_x distance _obj < _distance && {!(_x getVariable ["occupied",false])}) then {
		_closest = _x;
		_distance = _x distance _obj;
	};
} foreach btc_city_all;

_closest;