params ["_group", "_area", "_isboat"];

private _active_city = _group getVariable ["city", objNull];
private _end_city = _group getVariable ["end_city", leader _group];
private _noaccess = _group getVariable ["noaccess", []];

private _players = if (isMultiplayer) then {playableUnits} else {switchableUnits};

if (btc_debug) then {
    if (!isNil {_group getVariable "btc_patrol_id"}) then {
        deleteMarker format ["Patrol_fant_%1", _group getVariable "btc_patrol_id"];
    };
};

//Remove if too far from player
if ({_x distance _active_city < (_area/2) || _x distance leader _group < (_area/2)} count _players isEqualTo 0) exitWith {
    [_group] call btc_fnc_mil_patrol_eh;
};

//Sometimes the waypoints is completed but too far due to obstacle (water for island etc)
private _tmp_area = _area;
if ((leader _group) distance _end_city > 300) then {
    _noaccess pushBack _end_city;
    _tmp_area = _area - ((leader _group) distance _end_city)*0.3*count _noaccess;
    if (btc_debug) then {
        [format ["ID: %1 , count %2, area %3", _group getVariable "btc_patrol_id", count _noaccess, _tmp_area], __FILE__, [btc_debug, false]] call btc_fnc_debug_message;
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
[_group] call CBA_fnc_clearWaypoints;

if ((vehicle leader _group) isKindOf "Air" || (vehicle leader _group) isKindOf "LandVehicle") then {
    (vehicle leader _group) setFuel 1;
};
_group setBehaviour "SAFE";

if !((vehicle leader _group) isKindOf "Air") then {
    [_group, _pos, 0, "MOVE", "UNCHANGED", "RED", "LIMITED", "STAG COLUMN", "", [0, 0, 0], 20] call CBA_fnc_addWaypoint;
    for "_i" from 0 to (2 + (floor (random 3))) do {
        private _newPos = [_pos, 150] call CBA_fnc_randPos;

        [_group, _newPos, 0, "MOVE", "UNCHANGED", "RED", "UNCHANGED", "NO CHANGE", "", [0, 0, 0], 20] call CBA_fnc_addWaypoint;
    };
    [_group, _pos, 0, "MOVE", "UNCHANGED", "NO CHANGE", "UNCHANGED", "NO CHANGE", format ["_spawn = [group this, %1, %2] spawn btc_fnc_mil_patrol_addWP;", _area, _isboat], [0, 0, 0], 20] call CBA_fnc_addWaypoint;
} else {
    [_group, _pos, 0, "MOVE", "UNCHANGED", "RED", "LIMITED", "STAG COLUMN", format ["_spawn = [group this, %1, %2] spawn btc_fnc_mil_patrol_addWP;", _area, _isboat], [0, 0, 0], 20] call CBA_fnc_addWaypoint;
};

if (btc_debug) then {
    if (!isNil {_group getVariable "btc_patrol_id"}) then {
        private _marker = createMarker [format ["Patrol_fant_%1", _group getVariable "btc_patrol_id"] , [(_pos select 0) + random 30, (_pos select 1) + random 30, 0]];
        _marker setMarkerType "mil_dot";
        _marker setMarkerText format ["P %1", _group getVariable "btc_patrol_id"];
        _marker setMarkerColor "ColorRed";
        _marker setMarkerSize [0.5, 0.5];
    };
};
if (btc_debug_log) then {
    if (!isNil {_group getVariable "btc_patrol_id"}) then {
        [format ["ID: %1 (%3) POS: %2", _group getVariable "btc_patrol_id", _pos, typeOf vehicle leader _group], __FILE__, [false]] call btc_fnc_debug_message;
    };
};
