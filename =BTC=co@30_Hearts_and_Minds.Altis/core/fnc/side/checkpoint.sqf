
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_checkpoint

Description:
    Fill me when you edit me !

Parameters:
    _x - []
    _y - []
    _z - []

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_checkpoint;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

//// Choose an occupied City \\\\
private _useful = btc_city_all select {_x getVariable ["occupied", false] && !((_x getVariable ["type", ""]) in ["NameLocal", "Hill", "NameMarine"])};
if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};
private _city = selectRandom _useful;
private _pos = getPos _city;

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;
publicVariable "btc_side_assigned";

btc_side_jip_data = [9, _pos, _city getVariable "name"];
btc_side_jip_data remoteExec ["btc_fnc_task_create", 0];

_city setVariable ["spawn_more", true];

private _statics = btc_type_gl + btc_type_mg;
private _radius_x = _city getVariable ["RadiusX", 0];
private _radius_y = _city getVariable ["RadiusY", 0];
private _radius = (_radius_x + _radius_y)/4;

private _boxes = [];
private _markers = [];
for "_i" from 1 to (1 + round random 2) do {
    //// Choose a road \\\\
    private _pos = [getPos _city, _radius] call btc_fnc_randomize_pos;
    private _roads = _pos nearRoads 200;
    _roads = _roads select {isOnRoad _x};
    if (_roads isEqualTo []) exitWith {_boxes pushBack objNull};
    private _road = selectRandom _roads;
    _pos = getPos _road;

    private _direction = [_road] call btc_fnc_road_direction;

    //// Create marker \\\\
    private _marker = createMarker [format ["sm_2_%1", _pos], _pos];
    _marker setMarkerType "hd_flag";
    [_marker, "str_a3_timetrials_checkpoints0"] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker]; //Checkpoint
    _marker setMarkerColor "ColorRed";
    _marker setMarkerSize [0.6, 0.6];
    _markers pushback _marker;

    //// Randomise composition \\\\
    private _type_barrel = selectRandom btc_type_barrel;
    private _type_barrel_canister1 = selectRandom (btc_type_barrel + btc_type_canister);
    private _type_barrel_canister2 = selectRandom (btc_type_barrel + btc_type_canister);
    private _type_pallet = selectRandom btc_type_pallet;
    private _type_box = selectRandom btc_type_box;
    private _composition_checkpoint = [
        [_type_barrel,10,[0.243652,-2.78906,0]],
        [_type_barrel,20,[-0.131836,3.12939,0]],
        ["Land_BagFence_Long_F",90,[0.769531,-4.021,0]],
        ["Land_BagFence_Long_F",90,[-0.638672,4.31787,0]],
        ["Flag_Red_F",-90,[2.23193,-4.375,0]],
        [_type_barrel_canister1,0,[1.27393,-4.93604,0]],
        [_type_pallet,-70,[-5,3.75342,0]],
        [_type_barrel_canister2,0,[1.83984,-4.95264,0]],
        [_type_box,180,[-1.97998,4.88574,0]],
        ["Land_CncBarrier_stripes_F",180,[2.26367,-5.38623,0]],
        ["RoadCone_L_F",180,[1.14771,-5.89697,0.00211954]],
        ["Land_CncBarrier_stripes_F",0,[-2.1416,5.66553,0]],
        ["RoadCone_L_F",0,[-1.03101,6.18164,0.00211954]],
        ["RoadCone_L_F",180,[2.81616,-5.81689,0.00211954]],
        ["RoadCone_L_F",0,[-2.6731,6.17773,0.00211954]]
    ];

    //// Create checkpoint with static at _pos \\\\
    _pos params ["_x", "_y", "_z"];
    private _posStatic = [_x -2.39185*cos(-_direction) - 2.33984*sin(-_direction), _y  + 2.33984 *cos(-_direction) -2.39185*sin(-_direction), _z];
    private _static = [_posStatic, _statics, _direction + 180] call btc_fnc_mil_create_static;
    _static setPos _posStatic;

    private _posStatic = [_x + 2.72949*cos(-_direction) - -2.03857*sin(-_direction), _y -2.03857*cos(-_direction) +2.72949*sin(-_direction), _z];
    private _static = [_posStatic, _statics, _direction] call btc_fnc_mil_create_static;
    _static setPos _posStatic;

    [_pos, _direction, _composition_checkpoint] call btc_fnc_create_composition;

    private _boxe = nearestObject [_pos, _type_box];
    _boxe setVariable ["ace_cookoff_enable", false, true];
    _boxe spawn {
        params ["_boxe"];

        private _pos = getPos _boxe;
        waitUntil {sleep 5; btc_side_aborted || btc_side_failed || !(Alive _boxe)};
        private _fx = "test_EmptyObjectForSmoke" createVehicle _pos;
        _fx setPos _pos;
        sleep 120;
        _fx call CBA_fnc_deleteEntity;
    };
    _boxes pushBack _boxe;
};

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || (_boxes select {Alive _x} isEqualTo []))};

btc_side_assigned = false;
publicVariable "btc_side_assigned";
[_markers, _boxes, []] call btc_fnc_delete;

if (btc_side_aborted || btc_side_failed) exitWith {
    9 remoteExec ["btc_fnc_task_fail", 0];
};

80 call btc_fnc_rep_change;

9 remoteExec ["btc_fnc_task_set_done", 0];
