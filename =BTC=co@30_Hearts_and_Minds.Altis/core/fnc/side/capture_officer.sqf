
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_capture_officer

Description:
    Thanks DAP for inspiration.

Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_capture_officer;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

//// Choose two Cities \\\\
private _usefuls = btc_city_all select {!((_x getVariable ["type", ""]) in ["NameLocal", "Hill", "NameMarine"]) && !(_x getVariable ["occupied", false])};
if (_usefuls isEqualTo []) then {_usefuls = + btc_city_all;};
private _city2 = selectRandom _usefuls;

private _area = (getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize"))/4;
private _cities = btc_city_all select {_x distance _city2 > _area};
_usefuls = _cities select {!((_x getVariable ["type", ""]) in ["NameLocal", "Hill", "NameMarine"]) && (_x getVariable ["occupied", false])};
if (_usefuls isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};
private _city1 = selectRandom _usefuls;

//// Find roads \\\\
private _radius_x = _city1 getVariable ["RadiusX",0];
private _roads = _city1 nearRoads (_radius_x * 2);
_roads = _roads select {(_x distance _city1 > _radius_x) && isOnRoad _x};
if (_roads isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};
private _road = selectRandom _roads;
private _pos1 = getPos _road;
private _pos2 = getPos _city2;

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;
publicVariable "btc_side_assigned";

btc_side_jip_data = [14, _pos2, _city2 getVariable "name"];
btc_side_jip_data remoteExec ["btc_fnc_task_create", 0];

//// Create markers \\\\
private _marker1 = createMarker [format ["sm_2_%1", getPos _city1], getPos _city1];
_marker1 setMarkerType "hd_flag";
[_marker1, "str_a3_campaign_b_m06_marker01"] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker1]; //Convoy Start
_marker1 setMarkerSize [0.6, 0.6];

private _marker2 = createMarker [format ["sm_2_%1", _pos2], _pos2];
_marker2 setMarkerType "hd_flag";
[_marker2, "STR_BTC_HAM_SIDE_CONVOY_MRKEND"] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker2]; //Convoy End
_marker2 setMarkerSize [0.6, 0.6];

private _area = createMarker [format ["sm_%1", _pos2], _pos2];
_area setMarkerShape "ELLIPSE";
_area setMarkerBrush "SolidBorder";
_area setMarkerSize [_radius_x/1.5, _radius_x/1.5];
_area setMarkerAlpha 0.3;
_area setmarkercolor "colorBlue";

private _markers = [_marker1, _marker2, _area];

//// Create convoy \\\\
private _group = createGroup btc_enemy_side;
_group setVariable ["no_cache", true];

private _vehs = [];
private _veh_types = btc_civ_type_veh select {!(_x isKindOf "air")};
for "_i" from 0 to (1 + round random 1) do {
    private _veh = [_group, _pos1, selectRandom _veh_types, [_road] call btc_fnc_road_direction] call btc_fnc_mil_createVehicle;

    _vehs pushBack _veh;

    _road = (roadsConnectedTo _road) select 0;
    _pos1 = getPos _road;
};

private _captive = selectRandom units _group;
removeAllWeapons _captive;
_group selectLeader _captive;

[_group, _pos2, 0, "MOVE", "SAFE", "RED", "LIMITED", "COLUMN", "btc_side_failed = true", [0, 0, 0], _radius_x/1.5] call CBA_fnc_addWaypoint;

//// Create trigger \\\\
_trigger = createTrigger ["EmptyDetector", getPos _city1];
_trigger setVariable ["captive", _captive];
_trigger setTriggerArea [15, 15, 0, false];
_trigger setTriggerActivation [str btc_player_side, "PRESENT", true];
_trigger setTriggerStatements ["this", "_captive = thisTrigger getVariable 'captive'; doStop _captive; [_captive, true] call ace_captives_fnc_setSurrendered;", ""];
_trigger attachTo [_captive, [0, 0, 0]];

[12] remoteExec ["btc_fnc_show_hint", -2];

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || !(alive _captive) || (_captive inArea [getPosWorld btc_create_object_point, 100, 100, 0, false]))};

btc_side_assigned = false;
publicVariable "btc_side_assigned";
if (btc_side_aborted || !(Alive _captive)) exitWith {
    14 remoteExec ["btc_fnc_task_fail", 0];
    [_markers, _vehs + [_trigger], [_group]] call btc_fnc_delete;
};

if (btc_side_failed) exitWith {
    14 remoteExec ["btc_fnc_task_fail", 0];
    _group setVariable ["no_cache", false];
    {
        _group = createGroup btc_enemy_side;
        (crew _x) joinSilent _group;
        _group call btc_fnc_data_add_group;
    } forEach _vehs;
    [_markers, [_trigger], []] call btc_fnc_delete;
};

50 call btc_fnc_rep_change;

14 remoteExec ["btc_fnc_task_set_done", 0];

[_markers, _vehs + [_trigger, _captive], [_group]] call btc_fnc_delete;
