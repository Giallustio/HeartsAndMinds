
private ["_useful","_city","_pos","_marker","_crash_type","_crash"];

//// Choose an occupied City \\\\
_useful = btc_city_all select {(_x getVariable ["occupied",false] && {_x getVariable ["type",""] != "NameLocal"} && {_x getVariable ["type",""] != "Hill"} && (_x getVariable ["type",""] != "NameMarine"))};

if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};

_city = selectRandom _useful;

//// Randomise composition \\\\
_pos = [getPos _city, 100] call btc_fnc_randomize_pos;

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;publicVariable "btc_side_assigned";

[[7,_pos,_city getVariable "name"],"btc_fnc_task_create",true] spawn BIS_fnc_MP;

btc_side_jip_data = [7,_pos,_city getVariable "name"];

_city setVariable ["spawn_more",true];

//// Create marker \\\\
_marker = createmarker [format ["sm_2_%1",getPos _city],getPos _city];
_marker setmarkertype "hd_flag";
_marker setmarkertext "Rescue Pilot";
_marker setMarkerSize [0.6, 0.6];

_crash_type = selectRandom btc_type_crash;

_crash = createVehicle [_crash_type, _pos, [], 0, "NONE"];

_smokeeff = createVehicle ["test_EmptyObjectForSmoke",position _crash,[], 0, "CAN_COLLIDE"];
_smokeeff attachTo [_crash, [0.5, -2, 1] ];


waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || !Alive _tower )};

{deletemarker _x} foreach [_area,_marker];

if (btc_side_aborted || btc_side_failed ) exitWith {
	[7,"btc_fnc_task_fail",true] spawn BIS_fnc_MP;
	btc_side_assigned = false;publicVariable "btc_side_assigned";
	_crash spawn {

		waitUntil {sleep 5; ({_x distance _this < 300} count playableUnits == 0)};

		deleteVehicle _this;
	};
};

80 call btc_fnc_rep_change;

[7,"btc_fnc_task_set_done",true] spawn BIS_fnc_MP;

_crash spawn {

	waitUntil {sleep 5; ({_x distance _this < 300} count playableUnits == 0)};

	deleteVehicle _this;
};


btc_side_assigned = false;publicVariable "btc_side_assigned";