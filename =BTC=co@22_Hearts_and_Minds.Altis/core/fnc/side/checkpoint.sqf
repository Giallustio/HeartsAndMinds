
private ["_useful","_city","_pos","_road","_roads","_marker","_statics","_tower_type","_tower","_roadConnectedTo","_connectedRoad","_direction"];

//// Choose a occupied City \\\\
_useful = [];
{if (_x getVariable ["occupied",false] && {_x getVariable ["type",""] != "NameLocal"} && {_x getVariable ["type",""] != "Hill"}) then {_useful = _useful + [_x];};} foreach btc_city_all;
if (count _useful == 0) exitWith {[] spawn btc_fnc_side_create;};
_city = _useful select (floor random count _useful);


//// Choose a road \\\\
_pos = [getPos _city, 100] call btc_fnc_randomize_pos;
_roads = _pos nearRoads 100;
if (count _roads > 0) then {_road = (_roads select (floor random count _roads));
	_pos = getPos _road;
	};
_roadConnectedTo = roadsConnectedTo _road;
_connectedRoad = _roadConnectedTo select 0;
_direction = [_road, _connectedRoad] call BIS_fnc_dirTo;
hint str(_direction);

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;publicVariable "btc_side_assigned";

[[8,_pos,_city getVariable "name"],"btc_fnc_task_create",true] spawn BIS_fnc_MP;

btc_side_jip_data = [8,_pos,_city getVariable "name"];

_city setVariable ["spawn_more",true];

//// Create marker \\\\
_marker = createmarker [format ["sm_2_%1",_pos],_pos];
_marker setmarkertype "hd_flag";
_marker setmarkertext "Destroy checkpoint";
_marker setMarkerSize [0.6, 0.6];

//// Create checkpoint at _pos \\\\
_btc_composition_checkpoint = [
	["MetalBarrel_burning_F",0,[0.243652,-2.78906,0]],
	["MetalBarrel_burning_F",0,[-0.131836,3.12939,0]],
	["Land_BagFence_Long_F",90,[0.769531,-4.021,0]],
	["Land_BagFence_Long_F",90,[-0.638672,4.31787,0]],
	["Flag_Red_F",-90,[2.23193,-4.375,0]],
	["Land_BarrelWater_F",0,[1.27393,-4.93604,0]],
	["Land_Pallets_F",-90,[-2.94336,3.96436,0]],
	["Land_BarrelWater_F",0,[1.83984,-4.95264,0]],
	["Box_IND_WpsSpecial_F",180,[-1.97998,4.88574,0]],
	["Land_CncBarrier_stripes_F",180,[2.26367,-5.38623,0]],
	["RoadCone_L_F",180,[1.14771,-5.89697,0.00211954]],
	["Land_CncBarrier_stripes_F",0,[-2.1416,5.66553,0]],
	["RoadCone_L_F",0,[-1.03101,6.18164,0.00211954]],
	["RoadCone_L_F",180,[2.81616,-5.81689,0.00211954]],
	["RoadCone_L_F",0,[-2.6731,6.17773,0.00211954]]
];
_statics = btc_type_gl + btc_type_mg;

[[((_pos select 0) + 2.14355*cos(-_direction) - -2.74805*sin(-_direction)), ((_pos select 1)  -2.74805*cos(-_direction) + 2.14355*sin(-_direction)), (_pos select 2)],_statics,_direction] call btc_fnc_mil_create_static;
[[((_pos select 0) -2.04443*cos(-_direction) - 3.03271*sin(-_direction)), ((_pos select 1) + 3.03271*cos(-_direction) + -2.04443*sin(-_direction)), (_pos select 2)],_statics,_direction + 180] call btc_fnc_mil_create_static;
[_pos,_direction,_btc_composition_checkpoint] call btc_fnc_create_composition;

_box = nearestObject [_pos, "Box_IND_WpsSpecial_F"];

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || !Alive _box )};

{deletemarker _x} foreach [_marker];

if (btc_side_aborted || btc_side_failed ) exitWith {
	[8,"btc_fnc_task_fail",true] spawn BIS_fnc_MP;
	btc_side_assigned = false;publicVariable "btc_side_assigned";
};

80 call btc_fnc_rep_change;

[8,"btc_fnc_task_set_done",true] spawn BIS_fnc_MP;

btc_side_assigned = false;publicVariable "btc_side_assigned";