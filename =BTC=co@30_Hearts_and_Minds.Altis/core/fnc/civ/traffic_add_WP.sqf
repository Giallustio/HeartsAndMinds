
private ["_group","_active_city","_area","_players","_cities","_pos","_isboat","_dirTo","_ang","_dirto_useful","_useful","_end_city","_noaccess","_tmp_area"];

_group = _this select 0;
_active_city = _group getVariable ["city",objNull];
_end_city = _group getVariable ["end_city",leader _group];
_area = _this select 1;
_isboat = _this select 2;
_noaccess = _group getVariable ["noaccess",[]];

_players = if (isMultiplayer) then {playableUnits} else {switchableUnits};

//Remove if too far from player
if ({_x distance _active_city < (_area/2) || _x distance leader _group < (_area/2)} count _players isEqualTo 0) exitWith {
	if (btc_debug_log) then	{
		diag_log format ["TRAFFIC REMOVE ID: %1 (%3) POS: %2",_group getVariable "btc_traffic_id",getpos leader _group,typeof vehicle leader _group];
	};
	vehicle leader _group setFuel 0;
};

//Sometimes the waypoints is completed but too far due to obstacle (water for island etc)
if ((leader _group) distance _end_city > 300) then {
	_noaccess pushBack _end_city;
	_tmp_area = _area - ((leader _group) distance _end_city) * 0.3 * count _noaccess;
	if (btc_debug) then {systemChat format ["TRAFFIC ID: %1 , count %2, tmp_area %3", _group getVariable "btc_traffic_id", count _noaccess, _tmp_area];};
} else {
	_tmp_area = _area;
	_noaccess = [];
};

//Find a useful end city from the start city depending of vehicle type
if (_isboat) then {
	_useful = btc_city_all select {_x getVariable ["hasbeach",false]};
} else {
	_useful = btc_city_all select {_x getVariable ["type",""] != "NameMarine"};
};
_cities =  _useful select {(_x distance _active_city < _tmp_area) && !(_x in _noaccess)};
//Choose a city to have the _active_city (where the player is) between the traffic (eg. leader _group) and the _end_city :  leader _group  ----> _active_city  ----> _end_city
_dirTo = (leader _group) getdir _active_city;
_cities = _cities select {_ang = _active_city getdir _x; (abs(_ang - _dirTo) min (360 - abs(_ang - _dirTo)) < 45);};

//Check if _end_city has been found, if not take the closer city which is _useful
if (_cities isEqualTo []) then {
	_cities = [[[_active_city, leader _group] select (_active_city in _noaccess),_useful,false] call btc_fnc_find_closecity];
};
_end_city = selectRandom _cities;
_group setVariable ["end_city",_end_city];
_group setVariable ["noaccess",_noaccess];
_pos = getPos _end_city;

if (_isboat) then {
	_pos = (selectBestPlaces [_pos,(_active_city getVariable ["RadiusX",0]) + (_active_city getVariable ["RadiusY",0]), "sea",10,1]) select 0 select 0;
	_pos = [_pos select 0, _pos select 1, 0];
};

//Add Waypoints
private ["_wp","_wp_1"];

while {(count (waypoints _group)) > 0} do {
	deleteWaypoint ((waypoints _group) select 0);
};

if ((vehicle leader _group) isKindOf "Air" || (vehicle leader _group) isKindOf "LandVehicle") then {(vehicle leader _group) setFuel 1;};
_group setBehaviour "SAFE";
_wp = _group addWaypoint [_pos, 0];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 30;
_wp setWaypointStatements ["true", format ["_spawn = [group this,%1,%2] spawn btc_fnc_civ_traffic_add_WP;",_area,_isboat]];

if (btc_debug) then {
	if (!isNil {_group getVariable "btc_traffic_id"}) then {
		private "_marker";
		deleteMarker format ["btc_traffic_%1", _group getVariable "btc_traffic_id"];
		_marker = createmarker [format ["btc_traffic_%1", _group getVariable "btc_traffic_id"] , [(_pos select 0) + random 30,(_pos select 1) + random 30,0]];
		format ["btc_traffic_%1", _group getVariable "btc_traffic_id"] setmarkertype "mil_dot";
		format ["btc_traffic_%1", _group getVariable "btc_traffic_id"] setMarkerText format ["P %1", _group getVariable "btc_traffic_id"];
		format ["btc_traffic_%1", _group getVariable "btc_traffic_id"] setmarkerColor "ColorOrange";
		format ["btc_traffic_%1", _group getVariable "btc_traffic_id"] setMarkerSize [0.5, 0.5];
		diag_log text format ["TRAFFIC ID: %1 (%3) POS: %2",_group getVariable "btc_traffic_id",_pos,typeof vehicle leader _group];
	};
};