
private ["_group","_active_city","_end_city","_area","_players","_isboat","_cities","_pos","_noaccess","_useful","_tmp_area"];

_group = _this select 0;
_active_city = _group getVariable ["city",objNull];
_end_city = _group getVariable ["end_city",leader _group];
_area = _this select 1;
_isboat = _this select 2;
_noaccess = _group getVariable ["noaccess",[]];

_players = if (isMultiplayer) then {playableUnits} else {switchableUnits};

//Remove if too far from player
if ({_x distance _active_city < (_area/2) || _x distance leader _group < (_area/2)} count _players isEqualTo 0) exitWith {
	vehicle leader _group setFuel 0;
};

//Sometimes the waypoints is completed but too far due to obstacle (water for island etc)
if ((leader _group) distance _end_city > 300) then {
	_noaccess pushBack _end_city;
	_tmp_area = _area - ((leader _group) distance _end_city)*0.3*count _noaccess;
	if (btc_debug) then {systemChat format ["Patrol ID: %1 , count %2, area %3", _group getVariable "btc_patrol_id", count _noaccess, _tmp_area];};
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

//Check if end city has been found, if not take the closer city
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

while {(count (waypoints _group)) > 0} do {deleteWaypoint ((waypoints _group) select 0);};

if ((vehicle leader _group) isKindOf "Air" || (vehicle leader _group) isKindOf "LandVehicle") then {(vehicle leader _group) setFuel 1;};
_group setBehaviour "SAFE";
_wp = _group addWaypoint [_pos, 0];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 20;
_wp setWaypointCombatMode "RED";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointFormation "STAG COLUMN";

if !((vehicle leader _group) isKindOf "Air") then {
	for "_i" from 0 to (2 + (floor (random 3))) do {
		private ["_wp", "_newPos"];

		_newPos = [(_pos select 0) + (random 150 - random 150),(_pos select 1) + (random 150 - random 150),0];

		_wp = _group addWaypoint [_newPos, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointCompletionRadius 20;
		_wp setWaypointCombatMode "RED";
	};
	_wp_1 = _group addWaypoint [_pos, 0];
	_wp_1 setWaypointType "MOVE";
	_wp_1 setWaypointCompletionRadius 20;
	_wp_1 setWaypointStatements ["true", format ["_spawn = [group this,%1,%2] spawn btc_fnc_mil_patrol_addWP;",_area,_isboat]];
} else {_wp setWaypointStatements ["true", format ["_spawn = [group this,%1,%2] spawn btc_fnc_mil_patrol_addWP;",_area,_isboat]];};
if (btc_debug) then {
	if (!isNil {_group getVariable "btc_patrol_id"}) then {
		private ["_marker"];
		deleteMarker format ["Patrol_fant_%1", _group getVariable "btc_patrol_id"];
		_marker = createmarker [format ["Patrol_fant_%1", _group getVariable "btc_patrol_id"] , [(_pos select 0) + random 30,(_pos select 1) + random 30,0]];
		format ["Patrol_fant_%1", _group getVariable "btc_patrol_id"] setmarkertype "mil_dot";
		format ["Patrol_fant_%1", _group getVariable "btc_patrol_id"]  setMarkerText format ["P %1", _group getVariable "btc_patrol_id"];
		format ["Patrol_fant_%1", _group getVariable "btc_patrol_id"]  setmarkerColor "ColorGreen";
		format ["Patrol_fant_%1", _group getVariable "btc_patrol_id"]  setMarkerSize [0.5, 0.5];
		diag_log text format ["ID: %1 (%3) POS: %2",_group getVariable "btc_patrol_id",_pos,typeof vehicle leader _group];
	};
};