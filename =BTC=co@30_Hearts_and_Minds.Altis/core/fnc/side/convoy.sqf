
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_convoy

Description:
    Fill me when you edit me !

Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_convoy;
    (end)

Author:
    Vdauphin

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
[_marker1, "str_a3_campaign_b_m06_marker01"] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker1]; //Convoy start
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
    private _veh = [_group, _pos1, selectRandom _veh_types, [_road] call btc_fnc_road_direction] call btc_fnc_mil_createVehicle;

    _vehs pushBack _veh;

    _road = (roadsConnectedTo _road) select 0;
    _pos1 = getPos _road;
};

[_group, _pos2, 0, "MOVE", "SAFE", "RED", "LIMITED", "COLUMN", "btc_side_failed = true", [0, 0, 0], _radius_x/2] call CBA_fnc_addWaypoint;

[12] remoteExec ["btc_fnc_show_hint", -2];

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || (_vehs select {canMove _x} isEqualTo []) || (_group isEqualTo grpNull))};

btc_side_assigned = false;
publicVariable "btc_side_assigned";
if (btc_side_aborted) exitWith {
    12 remoteExec ["btc_fnc_task_fail", 0];
    [_markers, _vehs, [_group]] call btc_fnc_delete;
};

if (btc_side_failed) exitWith {
    12 remoteExec ["btc_fnc_task_fail", 0];
    _group setVariable ["no_cache", false];
    {
        private _group = createGroup btc_enemy_side;
        (crew _x) joinSilent _group;
        _group call btc_fnc_data_add_group;
    } forEach _vehs;
    [_markers, [], []] call btc_fnc_delete;
};

50 call btc_fnc_rep_change;

12 remoteExec ["btc_fnc_task_set_done", 0];

[_markers, _vehs, [_group]] call btc_fnc_delete;
