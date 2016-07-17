
private ["_obj","_btc_city_all_distance","_array"];

_obj = _this select 0;
_array = _this select 1;

if (_this select 2) then {
	_btc_city_all_distance = _array select {!(_x getVariable ["occupied",false])};
} else {
	_btc_city_all_distance = _array;
};

_btc_city_all_distance = _btc_city_all_distance apply {[ _x distance _obj, _x]};
_btc_city_all_distance sort true;
/*{
	if (_x distance _obj < _distance && {!(_x getVariable ["occupied",false])}) then {
		_closest = _x;
		_distance = _x distance _obj;
	};
} foreach btc_city_all;*/
_btc_city_all_distance select 0 select 1;