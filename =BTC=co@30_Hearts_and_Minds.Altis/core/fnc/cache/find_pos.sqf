private _house = objNull;
private _useful = btc_city_all select {(_x getVariable ["occupied", false] && {_x getVariable ["type", ""] != "NameLocal"} && {_x getVariable ["type", ""] != "Hill"} && {_x getVariable ["type", ""] != "NameMarine"})};

if (count _useful == 0) then {_useful = btc_city_all;};

private _id = floor random count _useful;
private _city = _useful select _id;

if (_city getVariable ["type", ""] == "NameLocal" || _city getVariable ["type", ""] == "Hill" || _city getVariable ["type", ""] == "NameMarine") exitWith {[] call btc_fnc_cache_find_pos;};

btc_cache_cities set [_id, 0];
btc_cache_cities = btc_cache_cities - [0];

private _xx = _city getVariable ["RadiusX", 500];
private _y = _city getVariable ["RadiusY", 500];
private _pos = [getPos _city, (_xx + _y)] call btc_fnc_randomize_pos;
private _houses = [_pos, 50] call btc_fnc_getHouses;

if (count _houses == 0) then {
    [] call btc_fnc_cache_find_pos;
} else {
    _house = selectRandom _houses;
    _house spawn btc_fnc_cache_spawn;
};
