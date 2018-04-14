params ["_group", "_area", "_isboat"];

private _active_city = _group getVariable ["city", objNull];
private _end_city = _group getVariable ["end_city", leader _group];
private _noaccess = _group getVariable ["noaccess", []];

private _players = if (isMultiplayer) then {playableUnits} else {switchableUnits};

//Remove if too far from player
if ({_x distance _active_city < (_area/2) || _x distance leader _group < (_area/2)} count _players isEqualTo 0) exitWith {
    vehicle leader _group setFuel 0;
};

//Sometimes the waypoints is completed but too far due to obstacle (water for island etc)
private _tmp_area = _area;
if ((leader _group) distance _end_city > 300) then {
    _noaccess pushBack _end_city;
    _tmp_area = _area - ((leader _group) distance _end_city)*0.3*count _noaccess;
    if (btc_debug) then {
        systemChat format ["Patrol ID: %1 , count %2, area %3", _group getVariable "btc_patrol_id", count _noaccess, _tmp_area];
    };
} else {
    _tmp_area = _area;
    _noaccess = [];
};

//Find a useful end city from the start city depending of vehicle type
private _useful = objNull;
if (_isboat) then {
    _useful = btc_city_all select {_x getVariable ["hasbeach", false]};
} else {
    _useful = btc_city_all select {_x getVariable ["type", ""] != "NameMarine"};
};
private _cities =  _useful select {(_x distance _active_city < _tmp_area) && !(_x in _noaccess)};

//Check if end city has been found, if not take the closer city
if (_cities isEqualTo []) then {
    _cities = [[[_active_city, leader _group] select (_active_city in _noaccess), _useful, false] call btc_fnc_find_closecity];
};
private _end_city = selectRandom _cities;
_group setVariable ["end_city", _end_city];
_group setVariable ["noaccess", _noaccess];
private _pos = getPos _end_city;

if (_isboat) then {
    ((selectBestPlaces [_pos, (_active_city getVariable ["RadiusX", 0]) + (_active_city getVariable ["RadiusY", 0]), "sea", 10, 1]) select 0 select 0) params ["_x", "_y"];
    _pos = [_x, _y, 0];
};

//Add Waypoints

while {!((waypoints _group) isEqualTo [])} do {deleteWaypoint ((waypoints _group) select 0);};

if ((vehicle leader _group) isKindOf "Air" || (vehicle leader _group) isKindOf "LandVehicle") then {
    (vehicle leader _group) setFuel 1;
};
_group setBehaviour "SAFE";
private _wp = _group addWaypoint [_pos, 0];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 20;
_wp setWaypointCombatMode "RED";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointFormation "STAG COLUMN";

if !((vehicle leader _group) isKindOf "Air") then {
    for "_i" from 0 to (2 + (floor (random 3))) do {
        private _newPos = [(_pos select 0) + (random 150 - random 150), (_pos select 1) + (random 150 - random 150), 0];

        _wp = _group addWaypoint [_newPos, 0];
        _wp setWaypointType "MOVE";
        _wp setWaypointCompletionRadius 20;
        _wp setWaypointCombatMode "RED";
    };
    private _wp_1 = _group addWaypoint [_pos, 0];
    _wp_1 setWaypointType "MOVE";
    _wp_1 setWaypointCompletionRadius 20;
    _wp_1 setWaypointStatements ["true", format ["_spawn = [group this, %1, %2] spawn btc_fnc_mil_patrol_addWP;", _area, _isboat]];
} else {
    _wp setWaypointStatements ["true", format ["_spawn = [group this, %1, %2] spawn btc_fnc_mil_patrol_addWP;", _area, _isboat]];
};

if (btc_debug) then {
    if (!isNil {_group getVariable "btc_patrol_id"}) then {
        deleteMarker format ["Patrol_fant_%1", _group getVariable "btc_patrol_id"];

        private _marker = createMarker [format ["Patrol_fant_%1", _group getVariable "btc_patrol_id"] , [(_pos select 0) + random 30, (_pos select 1) + random 30, 0]];
        _marker setMarkerType "mil_dot";
        _marker setMarkerText format ["P %1", _group getVariable "btc_patrol_id"];
        _marker setMarkerColor "ColorGreen";
        _marker setMarkerSize [0.5, 0.5];
        diag_log text format ["ID: %1 (%3) POS: %2", _group getVariable "btc_patrol_id", _pos, typeOf vehicle leader _group];
    };
};
