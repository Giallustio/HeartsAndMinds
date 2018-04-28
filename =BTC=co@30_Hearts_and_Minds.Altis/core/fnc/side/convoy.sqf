//// Choose two Cities \\\\
private _usefuls = btc_city_all select {!((_x getVariable ["type", ""]) in ["NameLocal", "Hill", "NameMarine"]) && !(_x getVariable ["occupied", false])};
if (_usefuls isEqualTo []) then {_usefuls = + btc_city_all;};
private _city2 = selectRandom _usefuls;

private _area = (getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize"))/4;
private _cities = btc_city_all select {(_x distance _city2 > _area)};
_usefuls = _cities select {!((_x getVariable ["type", ""]) in ["NameLocal", "Hill", "NameMarine"]) && (_x getVariable ["occupied", false])};
if (_usefuls isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};
private _city1 = selectRandom _usefuls;

//// Find Road \\\\
private _radius_x = _city1 getVariable ["RadiusX", 0];
private _roads = _city1 nearRoads (_radius_x * 2);
_roads = _roads select {(_x distance _city1 > _radius_x ) && isOnRoad _x};
 if (_roads isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};
private _road = selectRandom _roads;
private _pos1 = getPos _road;
private _pos2 = getPos _city2;

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;
publicVariable "btc_side_assigned";

btc_side_jip_data = [12, _pos1, _city1 getVariable "name"];
btc_side_jip_data remoteExec ["btc_fnc_task_create", 0];

//// Create markers \\\\
private _marker1 = createMarker [format ["sm_2_%1", _pos1], _pos1];
_marker1 setMarkerType "hd_flag";
[_marker1, "STR_BTC_HAM_SIDE_CONVOY_MRKSTART"] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker1]; //Convoy start
_marker1 setMarkerSize [0.6, 0.6];

private _marker2 = createMarker [format ["sm_2_%1", _pos2], _pos2];
_marker2 setMarkerType "hd_flag";
[_marker2, "STR_BTC_HAM_SIDE_CONVOY_MRKEND"] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker2]; //Convoy end
_marker2 setMarkerSize [0.6, 0.6];

private _area = createMarker [format ["sm_%1", _pos2], _pos2];
_area setMarkerShape "ELLIPSE";
_area setMarkerBrush "SolidBorder";
_area setMarkerSize [_radius_x/2, _radius_x/2];
_area setMarkerAlpha 0.3;
_area setmarkercolor "colorBlue";

private _markers = [_marker1, _marker2, _area];

//// Create convoy \\\\
private _group = createGroup btc_enemy_side;
_group setVariable ["no_cache", true];

private _vehs = [];
private _veh_types = btc_type_motorized select {!(_x isKindOf "air")};
for "_i" from 0 to (2 + round random 2) do {
    private _veh_type = selectRandom _veh_types;
    private _crewmen = btc_type_crewmen;
    private _veh = createVehicle [_veh_type, _pos1, [], 0, "FLY"];
    _veh setDir ([_road] call btc_fnc_road_direction);
    _vehs pushBack _veh;

    [_veh, _group, false, "", _crewmen] call BIS_fnc_spawnCrew;
    private _cargo = (_veh emptyPositions "cargo") - 1;
    if (_cargo > 0) then {
        for "_i" from 0 to _cargo do {
            private _unit_type = selectRandom btc_type_units;
            _unit_type createUnit [_pos1, _group, "this moveinCargo _veh;this assignAsCargo _veh;"];
        };
    };
    _road = (roadsConnectedTo _road) select 0;
    _pos1 = getPos _road;
};

units _group joinSilent _group;
{_x call btc_fnc_mil_unit_create} forEach units _group;

_group setBehaviour "SAFE";
_wp = _group addWaypoint [_pos2, 0];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius _radius_x/2;
_wp setWaypointCombatMode "RED";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointFormation "COLUMN";
_wp setWaypointStatements ["true", "btc_side_failed = true"];

[12] remoteExec ["btc_fnc_show_hint", -2];

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || ({ canMove _x } count _vehs isEqualTo 0) || (_group isEqualTo grpNull))};

btc_side_assigned = false;
publicVariable "btc_side_assigned";
if (btc_side_aborted) exitWith {
    12 remoteExec ["btc_fnc_task_fail", 0];
    [_markers, _vehs, [], [_group]] call btc_fnc_delete;
};

if (btc_side_failed) exitWith {
    12 remoteExec ["btc_fnc_task_fail", 0];
    _group setVariable ["no_cache", false];
    {
        private _group = createGroup btc_enemy_side;
        (crew _x) joinSilent _group;
        _group call btc_fnc_data_add_group;
    } forEach _vehs;
    [_markers, [], [], []] call btc_fnc_delete;
};

50 call btc_fnc_rep_change;

12 remoteExec ["btc_fnc_task_set_done", 0];

[_markers, _vehs, [], [_group]] call btc_fnc_delete;
