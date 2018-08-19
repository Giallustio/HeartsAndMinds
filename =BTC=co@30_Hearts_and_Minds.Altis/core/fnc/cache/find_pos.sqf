
private ["_useful","_house","_id","_city","_xx","_y","_pos","_houses","_house"];

_house = objNull;
_useful = btc_city_all select {(_x getVariable ["occupied",false] && {_x getVariable ["type",""] != "NameLocal"} && {_x getVariable ["type",""] != "Hill"} && {_x getVariable ["type",""] != "NameMarine"})};

if (count _useful == 0) then {_useful = btc_city_all;};

_id = floor random count _useful;
_city = _useful select _id;
if (_city getVariable ["type",""] == "NameLocal" || _city getVariable ["type",""] == "Hill" || _city getVariable ["type",""] == "NameMarine") exitWith {[] call btc_fnc_cache_find_pos;};
btc_cache_cities set [_id,0];
btc_cache_cities = btc_cache_cities - [0];
/*
_xx = _city getVariable ["RadiusX",500];
_y = _city getVariable ["RadiusY",500];
_houses = [_city,(_xx + _y)/2] call btc_fnc_getHouses;
*/

_xx = _city getVariable ["RadiusX",500];
_y = _city getVariable ["RadiusY",500];
_pos = [getPos _city, (_xx + _y)] call btc_fnc_randomize_pos;
_houses = [_pos,50] call btc_fnc_getHouses;

if (count _houses == 0) then {
    [] call btc_fnc_cache_find_pos;
} else {
    //private ["_isAct","_cache"];
    _house = selectRandom _houses;
    _house spawn btc_fnc_cache_spawn;
};