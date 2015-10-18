
private ["_useful","_city","_pos","_roads","_marker","_tower_type","_tower","_t"];

_useful = [];
{if (_x getVariable ["occupied",false] && {_x getVariable ["type",""] != "NameLocal"} && {_x getVariable ["type",""] != "Hill"}) then {_useful = _useful + [_x];};} foreach btc_city_all;

if (count _useful == 0) exitWith {[] spawn btc_fnc_side_create;};

_city = _useful select (floor random count _useful);

_pos = [getPos _city, 100] call btc_fnc_randomize_pos;

_roads = _pos nearRoads 300;

if (count _roads > 0) then {_pos = getPos (_roads select (floor random count _roads));};

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;publicVariable "btc_side_assigned";

[[7,_pos,_city getVariable "name"],"btc_fnc_task_create",true] spawn BIS_fnc_MP;

btc_side_jip_data = [7,_pos,_city getVariable "name"];

_city setVariable ["spawn_more",true];

_area = createmarker [format ["sm_%1",_pos],_pos];
_area setMarkerShape "ELLIPSE";
_area setMarkerBrush "SolidBorder";
_area setMarkerSize [30, 30];
_area setMarkerAlpha 0.3;
_area setmarkercolor "colorBlue";

_marker = createmarker [format ["sm_2_%1",_pos],_pos];
_marker setmarkertype "hd_flag";
_marker setmarkertext "Radio Tower";
_marker setMarkerSize [0.6, 0.6];

_btc_type_tower = ["Land_Communication_F","  	Land_TTowerBig_1_F","Land_TTowerBig_2_F","Land_TTowerSmall_1_F","Land_TTowerSmall_2_F"];
_tower_type = _btc_type_tower select (floor (random (count _btc_type_tower)));

_tower = [];
_t = createVehicle [_tower_type, _pos, [], 0, "NONE"];
_t setDir (random 360);
_tower = _tower + [_t];

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || ({!Alive _x} count _tower == 0))};

{deletemarker _x} foreach [_area,_marker];

if (btc_side_aborted || btc_side_failed ) exitWith {
	[7,"btc_fnc_task_fail",true] spawn BIS_fnc_MP;
	btc_side_assigned = false;publicVariable "btc_side_assigned";
	{_x spawn {

		waitUntil {sleep 5; ({_x distance _this < 300} count playableUnits == 0)};

		deleteVehicle _this;
	};} foreach _tower;
};

15 call btc_fnc_rep_change;

[7,"btc_fnc_task_set_done",true] spawn BIS_fnc_MP;

{_x spawn {

	waitUntil {sleep 5; ({_x distance _this < 300} count playableUnits == 0)};

	deleteVehicle _this;
};} foreach _tower;


btc_side_assigned = false;publicVariable "btc_side_assigned";