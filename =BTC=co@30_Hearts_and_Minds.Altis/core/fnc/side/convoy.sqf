
private ["_usefuls","_city1","_city2","_pos2","_area","_marker1","_marker2","_markers","_mines","_crewmen"];

_usefuls = btc_city_all select {((_x getVariable ["type",""] != "NameLocal") && {_x getVariable ["type",""] != "Hill"} && (_x getVariable ["type",""] != "NameMarine") && !(_x getVariable ["occupied",false]))};

if (_usefuls isEqualTo []) then {_usefuls = + btc_city_all;};

_city2 = selectRandom _usefuls;

_area = btc_patrol_area*2;
_cities = btc_city_all select {(_x distance _city2 > _area)};
_usefuls = _cities select {((_x getVariable ["type",""] != "NameLocal") && {_x getVariable ["type",""] != "Hill"} && (_x getVariable ["type",""] != "NameMarine") && (_x getVariable ["occupied",false]))};

if (_usefuls isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};

_city1 = selectRandom _usefuls;

_pos1 = [getPos _city1, 0, 500, 30, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
_pos2 = [getPos _city2, 0, 500, 30, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;publicVariable "btc_side_assigned";

[[4,_pos1,_city1 getVariable "name"],"btc_fnc_task_create",true] spawn BIS_fnc_MP;

btc_side_jip_data = [4,_pos1,_city1 getVariable "name"];

_marker1 = createmarker [format ["sm_2_%1",_pos1],_pos1];
_marker1 setmarkertype "hd_flag";
_marker1 setmarkertext "Convoy start";
_marker1 setMarkerSize [0.6, 0.6];

_marker2 = createmarker [format ["sm_2_%1",_pos2],_pos2];
_marker2 setmarkertype "hd_flag";
_marker2 setmarkertext "Convoy end";
_marker2 setMarkerSize [0.6, 0.6];
_markers = [_marker1,_marker2];

private ["_veh_type","_newZone","_veh","_cargo"];

_group = createGroup btc_enemy_side;
_group setVariable ["city",_city2];
_group setVariable ["no_cache",true];
_group setVariable ["btc_patrol",true];

_veh_type = selectRandom btc_type_motorized;
_crewmen = btc_type_crewmen;
_veh = createVehicle [_veh_type, _pos1, [], 0, "NONE"];

if (btc_debug_log) then {diag_log format ["CONVOY veh: %1",_veh];};

[_veh,_group,false,"",_crewmen] call BIS_fnc_spawnCrew;
_cargo = (_veh emptyPositions "cargo") - 1;
if (_cargo > 0) then {
	for "_i" from 0 to _cargo do {
		_unit_type = selectRandom btc_type_units;
		_unit_type createUnit [_pos1, _group, "this moveinCargo _veh;this assignAsCargo _veh;"];
		if (btc_debug_log) then {diag_log format ["CONVOY createUnit: %1",_unit_type];};
	};
};

_spawn = [_group,_area,false] spawn btc_fnc_mil_patrol_addWP;

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed)};

{deletemarker _x} foreach _markers;

if (btc_side_aborted || btc_side_failed) exitWith {
	[4,"btc_fnc_task_fail",true] spawn BIS_fnc_MP;
	btc_side_assigned = false;publicVariable "btc_side_assigned";
	{if (!isNull _x) then {deleteVehicle _x}} foreach [_veh];
};

30 call btc_fnc_rep_change;

[4,"btc_fnc_task_set_done",true] spawn BIS_fnc_MP;

btc_side_assigned = false;publicVariable "btc_side_assigned";