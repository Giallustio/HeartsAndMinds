
private ["_usefuls","_city1","_city2","_pos1","_pos2","_area","_marker1","_marker2","_markers","_mines","_crewmen","_roads","_road","_veh_type","_veh","_cargo","_veh"];

//// Choose two Cities \\\\
_usefuls = btc_city_all select {((_x getVariable ["type",""] != "NameLocal") && {_x getVariable ["type",""] != "Hill"} && (_x getVariable ["type",""] != "NameMarine") && !(_x getVariable ["occupied",false]))};
if (_usefuls isEqualTo []) then {_usefuls = + btc_city_all;};
_city2 = selectRandom _usefuls;
if (btc_debug_log) then {diag_log format ["CONVOY city2: %1",_city2];};

_area = (getNumber (configFile >> "CfgWorlds" >> worldName >> "MapSize"))/10;
if (btc_debug_log) then {diag_log format ["CONVOY area: %1",_area];};
_cities = btc_city_all select {(_x distance _city2 > _area)};
_usefuls = _cities select {((_x getVariable ["type",""] != "NameLocal") && {_x getVariable ["type",""] != "Hill"} && (_x getVariable ["type",""] != "NameMarine") && (_x getVariable ["occupied",false]))};
if (_usefuls isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};
_city1 = selectRandom _usefuls;
if (btc_debug_log) then {diag_log format ["CONVOY city1: %1",_city1];};

_roads = _city2 nearRoads 200;
if (btc_debug_log) then {diag_log format ["CONVOY roads 2: %1",_roads];};
if !(_roads isEqualTo []) then {
	_pos2 = getPos (selectRandom _roads);
} else {
	_pos2 = getPos _city2;
};

_roads = _city1 nearRoads 200;
if (btc_debug_log) then {diag_log format ["CONVOY roads 1: %1",_roads];};
if !(_roads isEqualTo []) then {
	_road = selectRandom _roads;
	_pos1 = getPos _road;
} else {
	_pos1 = getPos _city1;
};

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;publicVariable "btc_side_assigned";

[[12,_pos1,_city1 getVariable "name"],"btc_fnc_task_create",true] spawn BIS_fnc_MP;

btc_side_jip_data = [12,_pos1,_city1 getVariable "name"];

//// Create markers \\\\
_marker1 = createmarker [format ["sm_2_%1",_pos1],_pos1];
_marker1 setmarkertype "hd_flag";
_marker1 setmarkertext "Convoy start";
_marker1 setMarkerSize [0.6, 0.6];

_marker2 = createmarker [format ["sm_2_%1",_pos2],_pos2];
_marker2 setmarkertype "hd_flag";
_marker2 setmarkertext "Convoy end";
_marker2 setMarkerSize [0.6, 0.6];
_markers = [_marker1,_marker2];

if (btc_debug_log) then {diag_log format ["CONVOY pos1: %1",_pos1];};
if (btc_debug_log) then {diag_log format ["CONVOY pos2: %1",_pos2];};

//// Create convoy \\\\
_group = createGroup btc_enemy_side;
_group setVariable ["no_cache",true];

_vehs = [];
for "_i" from 0 to 4 do {
	_veh_type = selectRandom btc_type_motorized;
	_crewmen = btc_type_crewmen;
	_vehs pushBack createVehicle [_veh_type, _pos1, [], 0, "NONE"];;
	if (btc_debug_log) then {diag_log format ["CONVOY veh: %1",_vehs];};
	if (btc_debug_log) then {diag_log format ["CONVOY veh type: %1",_veh_type];};

	[(_vehs select _i),_group,false,"",_crewmen] call BIS_fnc_spawnCrew;
	_cargo = ((_vehs select _i) emptyPositions "cargo") - 1;
	if (_cargo > 0) then {
		for "_i" from 0 to _cargo do {
			_unit_type = selectRandom btc_type_units;
			_unit_type createUnit [_pos1, _group, "this moveinCargo (_veh select _i);this assignAsCargo (_veh select _i);"];
			if (btc_debug_log) then {diag_log format ["CONVOY createUnit: %1",_unit_type];};
		};
	};
	_road = (roadsConnectedTo _road) select 0;
	_pos1 = getPos _road;
};

{_x call btc_fnc_mil_unit_create} foreach units _group;

_group setBehaviour "SAFE";
_wp = _group addWaypoint [_pos2, 0];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 100;
_wp setWaypointCombatMode "RED";
_wp setWaypointSpeed "LIMITED";
_wp setWaypointFormation "STAG COLUMN";
_wp setWaypointStatements ["true", "btc_side_failed = true"];

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || (_group isEqualTo grpNull))};

{deletemarker _x} foreach _markers;

if (btc_side_aborted) exitWith {
	[12,"btc_fnc_task_fail",true] spawn BIS_fnc_MP;
	btc_side_assigned = false;publicVariable "btc_side_assigned";
	[_vehs,_group] spawn {
		waitUntil {sleep 5; ({_x distance (_this select 0) < 500} count playableUnits == 0)};
		{if (!isNull _x) then {deleteVehicle _x}} foreach units (_this select 1);
		{if (!isNull _x) then {deleteVehicle _x}} foreach (_this select 0);
		deleteGroup (_this select 1);
	};
};

if (btc_side_failed) exitWith {
	[12,"btc_fnc_task_fail",true] spawn BIS_fnc_MP;
	btc_side_assigned = false;publicVariable "btc_side_assigned";
	_group setVariable ["no_cache",false];
	_city2 setVariable ["occupied",true];
};

50 call btc_fnc_rep_change;

[12,"btc_fnc_task_set_done",true] spawn BIS_fnc_MP;

[_vehs,_group] spawn {
	waitUntil {sleep 5; ({_x distance (_this select 0) < 500} count playableUnits == 0)};
		{if (!isNull _x) then {deleteVehicle _x}} foreach units (_this select 1);
		{if (!isNull _x) then {deleteVehicle _x}} foreach (_this select 0);
		deleteGroup (_this select 1);
};

btc_side_assigned = false;publicVariable "btc_side_assigned";