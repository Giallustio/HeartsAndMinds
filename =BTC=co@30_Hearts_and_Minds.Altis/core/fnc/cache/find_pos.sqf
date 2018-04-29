
private _useful = btc_city_all select {(_x getVariable ["occupied", false] && {_x getVariable ["type", ""] != "NameLocal"} && {_x getVariable ["type", ""] != "Hill"} && {_x getVariable ["type", ""] != "NameMarine"})};

if (_useful isEqualTo []) then {_useful = btc_city_all;};

private _id = floor random count _useful;
private _city = _useful select _id;

if (_city getVariable ["type", ""] isEqualTo "NameLocal" || _city getVariable ["type", ""] isEqualTo "Hill" || _city getVariable ["type", ""] isEqualTo "NameMarine") exitWith {
    [] call btc_fnc_cache_find_pos;
};

btc_cache_cities set [_id, 0];
btc_cache_cities = btc_cache_cities - [0];

private _xx = _city getVariable ["RadiusX", 500];
private _yy = _city getVariable ["RadiusY", 500];
private _pos = [getPos _city, _xx + _yy] call btc_fnc_randomize_pos;
private _houses = [_pos, 50] call btc_fnc_getHouses;

if (_houses isEqualTo []) then {
    [] call btc_fnc_cache_find_pos;
} else {
    private _house = selectRandom _houses;
    _house spawn btc_fnc_cache_spawn;
};
