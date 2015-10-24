
private ["_useful","_city","_pos","_road","_roads","_marker","_statics","_tower_type","_tower","_roadConnectedTo","_connectedRoad","_direction"];

_useful = [];
{if (_x getVariable ["occupied",false] && {_x getVariable ["type",""] != "NameLocal"} && {_x getVariable ["type",""] != "Hill"}) then {_useful = _useful + [_x];};} foreach btc_city_all;

if (count _useful == 0) exitWith {[] spawn btc_fnc_side_create;};

_city = _useful select (floor random count _useful);

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

_marker = createmarker [format ["sm_2_%1",_pos],_pos];
_marker setmarkertype "hd_flag";
_marker setmarkertext "Radio Tower";
_marker setMarkerSize [0.6, 0.6];

_btc_type_tower = ["Land_Portable_generator_F"];
_tower_type = _btc_type_tower select (floor (random (count _btc_type_tower)));

_tower = createVehicle [_tower_type, _pos, [], 0, "NONE"];
_tower setDir (_direction);

_btc_composition_checkpoint = [
	["C_supplyCrate_F",0,[0.2,0.2,0]],
	["Flag_Red_F",0,[-0.542969,-0.270508,-0.00143433]],
	["Land_BagFence_Round_F",146.026,[2.82666,-1.77124,-0.00143433]],
	["Land_Razorwire_F",0,[1.08496,-3.35547,-0.00143433]],
	["Land_TentA_F",349.935,[-2.09814,2.94702,-0.00143433]],
	["Land_TentA_F",349.935,[1.10889,3.53687,-0.00143433]],
	["Land_Portable_generator_F",243.462,[-3.89404,1.15088,-0.0022583]],
	["C_supplyCrate_F",55.6146,[-4.60059,-2.28027,-0.00143433]],
	["Land_PaperBox_open_full_F",143.441,[-3.74023,-3.77405,-0.00143433]],
	["Land_Razorwire_F",0,[-5.93555,0.444702,-0.00143433]],
	["Land_PaperBox_closed_F",0,[-5.76221,-3.35876,-0.00143433]],
	["Land_PaperBox_open_empty_F",324.641,[-4.91895,-4.99585,-0.00143433]],
	["Land_Pallet_MilBoxes_F",297.549,[-7.8623,-2.05115,-0.00143433]]
];

[_pos,_btc_composition_checkpoint] call btc_fnc_create_composition;

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || !Alive _tower )};

{deletemarker _x} foreach [_marker];

if (btc_side_aborted || btc_side_failed ) exitWith {
	[7,"btc_fnc_task_fail",true] spawn BIS_fnc_MP;
	btc_side_assigned = false;publicVariable "btc_side_assigned";
	_tower spawn {
		waitUntil {sleep 5; ({_x distance _this < 300} count playableUnits == 0)};
		deleteVehicle _this;
	};
};

80 call btc_fnc_rep_change;

[8,"btc_fnc_task_set_done",true] spawn BIS_fnc_MP;

_tower spawn {
	waitUntil {sleep 5; ({_x distance _this < 300} count playableUnits == 0)};
	deleteVehicle _this;
};


btc_side_assigned = false;publicVariable "btc_side_assigned";