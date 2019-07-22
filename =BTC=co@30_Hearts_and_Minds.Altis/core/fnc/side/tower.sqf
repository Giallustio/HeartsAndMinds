
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_tower

Description:
    Fill me when you edit me !

Parameters:
    _x - []
    _y - []
    _z - []

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_tower;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

private _useful = btc_city_all select {_x getVariable ["occupied", false] && !((_x getVariable ["type", ""]) in ["NameLocal", "Hill", "NameMarine"])};
if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};

private _city = selectRandom _useful;
private _pos = [getPos _city, 100] call btc_fnc_randomize_pos;
private _roads = _pos nearRoads 100;
_roads = _roads select {isOnRoad _x};
if (_roads isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};

private _road = selectRandom _roads;
_pos = getPos _road;

private _direction = [_road] call btc_fnc_road_direction;

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;
publicVariable "btc_side_assigned";

btc_side_jip_data = [7, _pos, _city getVariable "name"];
btc_side_jip_data remoteExec ["btc_fnc_task_create", 0];

_city setVariable ["spawn_more", true];

private _area = createMarker [format ["sm_%1", _pos], _pos];
_area setMarkerShape "ELLIPSE";
_area setMarkerBrush "SolidBorder";
_area setMarkerSize [30, 30];
_area setMarkerAlpha 0.3;
_area setmarkercolor "colorBlue";

private _marker = createMarker [format ["sm_2_%1", _pos], _pos];
_marker setMarkerType "hd_flag";
[_marker, "str_a3_exp_m01_respawntower"] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker]; //Radio Tower
_marker setMarkerSize [0.6, 0.6];

//// Randomise composition \\\\
private _tower_type = selectRandom btc_type_tower;
private _power_type = selectRandom btc_type_power;
private _cord_type = selectRandom btc_type_cord;
private _btc_composition_tower = [
    [_tower_type,0,[0,0,0]],
    [_cord_type,63,[-1.30664,0.939453,0]],
    [_power_type,24,[-4.56885,-0.231445,0]]
];

//// Create tower with static at _pos \\\\
private _statics = btc_type_gl + btc_type_mg;
[_pos getPos [5, _direction], _statics, _direction] call btc_fnc_mil_create_static;
[_pos getPos [- 5, _direction], _statics, _direction + 180] call btc_fnc_mil_create_static;

private _btc_composition = [_pos, _direction, _btc_composition_tower] call btc_fnc_create_composition;
private _tower = _btc_composition select ((_btc_composition apply {typeOf _x}) find _tower_type);

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || !Alive _tower )};

btc_side_assigned = false;
publicVariable "btc_side_assigned";
[[_area, _marker], _btc_composition, []] call btc_fnc_delete;

if (btc_side_aborted || btc_side_failed ) exitWith {
    7 remoteExec ["btc_fnc_task_fail", 0];
};

80 call btc_fnc_rep_change;

7 remoteExec ["btc_fnc_task_set_done", 0];
