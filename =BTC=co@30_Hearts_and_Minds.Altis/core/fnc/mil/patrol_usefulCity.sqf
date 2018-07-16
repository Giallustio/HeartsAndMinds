params [
    ["_cities", [], [[]]],
    ["_area", btc_patrol_area, [0]],
    ["_isBoat", false, [false]]
];
_cities params [
    ["_start_city", objNull, [objNull]],
    ["_active_city", objNull, [objNull]]
];

//Find a useful end city from the start city depending of vehicle type
private _useful = [];
if (_isBoat) then {
    _useful = btc_city_all select {_x getVariable ["hasbeach", false]};
} else {
    _useful = btc_city_all select {_x getVariable ["type", ""] != "NameMarine"};
};
private _cities = _useful inAreaArray [getPosWorld _active_city, _area, _area];
private _cities = _cities - (_start_city getVariable ["btc_cities_inaccessible", []]);

//Check if end city has been found, if not take the closer city
if (_cities isEqualTo []) then {
    _cities = [[_active_city, _useful, false] call btc_fnc_find_closecity];
};

private _end_city = selectRandom _cities;
private _pos = getPos _end_city;
if (_isBoat) then {
    ((selectBestPlaces [_pos, (_end_city getVariable ["RadiusX", 0]) + (_end_city getVariable ["RadiusY", 0]), "sea", 10, 1]) select 0 select 0) params ["_x", "_y"];
    _pos = [_x, _y, 0];
};

[_end_city, _pos]
