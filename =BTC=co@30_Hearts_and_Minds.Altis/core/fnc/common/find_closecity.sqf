
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
_btc_city_all_distance select 0 select 1;