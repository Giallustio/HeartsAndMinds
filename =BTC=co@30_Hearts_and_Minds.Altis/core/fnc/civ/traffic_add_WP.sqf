params ["_group", "_area", "_isboat"];

private _active_city = _group getVariable ["city", objNull];
private _end_city = _group getVariable ["end_city", leader _group];
private _noaccess = _group getVariable ["noaccess", []];

private _players = [switchableUnits, playableUnits] select isMultiplayer;

//Remove if too far from player
if (_players inAreaArray [getPosWorld _active_city, _area/2, _area/2] isEqualTo [] && {_players inAreaArray [getPosWorld leader _group, _area/2, _area/2] isEqualTo []}) exitWith {
    if (btc_debug_log) then    {
        [format ["REMOVE ID: %1 (%3) POS: %2", _group getVariable "btc_traffic_id", getPos leader _group, typeOf vehicle leader _group], __FILE__, [false]] call btc_fnc_debug_message;
    };
    vehicle leader _group setFuel 0;
};

private _tmp_area = 0;

//Sometimes the waypoints is completed but too far due to obstacle (water for island etc)
if ((leader _group) distance _end_city > 300) then {
    _noaccess pushBack _end_city;
    _tmp_area = _area - ((leader _group) distance _end_city) * 0.3 * count _noaccess;
    if (btc_debug) then {
        [format ["ID: %1 , count %2, tmp_area %3", _group getVariable "btc_traffic_id", count _noaccess, _tmp_area], __FILE__, [btc_debug, false]] call btc_fnc_debug_message;
    };
} else {
    _tmp_area = _area;
    _noaccess = [];
};

private _useful = [];

//Find a useful end city from the start city depending of vehicle type
if (_isboat) then {
    _useful = btc_city_all select {_x getVariable ["hasbeach", false]};
} else {
    _useful = btc_city_all select {_x getVariable ["type", ""] != "NameMarine"};
};

private _cities = _useful inAreaArray [getPosWorld _active_city, _tmp_area, _tmp_area];
_cities = _cities select {!(_x in _noaccess)};
//Choose a city to have the _active_city (where the player is) between the traffic (eg. leader _group) and the _end_city :  leader _group  ----> _active_city  ----> _end_city
private _dirTo = (leader _group) getDir _active_city;
_cities = _cities select {
    private _ang = _active_city getDir _x;
    (abs(_ang - _dirTo) min (360 - abs(_ang - _dirTo)) < 45);
};

//Check if _end_city has been found, if not take the closer city which is _useful
if (_cities isEqualTo []) then {
    _cities = [[[_active_city, leader _group] select (_active_city in _noaccess), _useful, false] call btc_fnc_find_closecity];
};
_end_city = selectRandom _cities;
_group setVariable ["end_city", _end_city];
_group setVariable ["noaccess", _noaccess];

private _pos = getPos _end_city;

if (_isboat) then {
    _pos = (selectBestPlaces [_pos, (_active_city getVariable ["RadiusX", 0]) + (_active_city getVariable ["RadiusY", 0]), "sea", 10, 1]) select 0 select 0;
    _pos = [_pos select 0, _pos select 1, 0];
};

//Add Waypoints
[_group] call CBA_fnc_clearWaypoints;

if ((vehicle leader _group) isKindOf "Air" || (vehicle leader _group) isKindOf "LandVehicle") then {
    (vehicle leader _group) setFuel 1;
};
_group setBehaviour "SAFE";

[_group, _pos, 0, "MOVE", "UNCHANGED", "NO CHANGE", "UNCHANGED", "NO CHANGE", format ["_spawn = [group this, %1, %2] spawn btc_fnc_civ_traffic_add_WP;", _area, _isboat], [0, 0, 0], 30] call CBA_fnc_addWaypoint;

if (btc_debug) then {
    if (!isNil {_group getVariable "btc_traffic_id"}) then {
        deleteMarker format ["btc_traffic_%1", _group getVariable "btc_traffic_id"];

        private _marker = createMarker [format ["btc_traffic_%1", _group getVariable "btc_traffic_id"], [(_pos select 0) + random 30, (_pos select 1) + random 30, 0]];
        _marker setMarkerType "mil_dot";
        _marker setMarkerText format ["P %1", _group getVariable "btc_traffic_id"];
        _marker setMarkerColor "ColorWhite";
        _marker setMarkerSize [0.5, 0.5];
    };
};
if (btc_debug_log) then {
    if (!isNil {_group getVariable "btc_traffic_id"}) then {
        [format ["ID: %1 (%3) POS: %2", _group getVariable "btc_traffic_id", _pos, typeOf vehicle leader _group], __FILE__, [false]] call btc_fnc_debug_message;
    };
};
