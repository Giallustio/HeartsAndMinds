//https://forums.bistudio.com/forums/topic/186316-how-to-open-the-land_dataterminal_01_f-data-terminal-nexus-update/
//http://killzonekid.com/arma-scripting-tutorials-uav-r2t-and-pip/
//http://killzonekid.com/arma-scripting-tutorials-scripted-charges/

private ["_useful","_city","_pos","_road","_roads","_marker","_statics","_tower_type","_tower","_direction","_area","_power_type","_cord_type","_btc_composition","_btc_composition_tower"];

_useful = btc_city_all select {(_x getVariable ["occupied",false] && {_x getVariable ["type",""] != "NameLocal"} && {_x getVariable ["type",""] != "Hill"} && (_x getVariable ["type",""] != "NameMarine"))};

if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};

_city = selectRandom _useful;

_pos = [getPos _city, 100] call btc_fnc_randomize_pos;

_roads = _pos nearRoads 100;
_roads = _roads select {isOnRoad _x};
if (_roads isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};
_road = selectRandom _roads;
_pos = getPos _road;
_direction = [_road] call btc_fnc_road_direction;

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;publicVariable "btc_side_assigned";

[16,_pos,_city getVariable "name"] call btc_fnc_task_create;

btc_side_jip_data = [16,_pos,_city getVariable "name"];

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

//// Create terminal \\\\
_terminal = createVehicle ["Land_DataTerminal_01_F", _pos, [], 0, "CAN_COLLIDE"];
btc_side_hack_start = false;
_pos = [[_pos, 100] call btc_fnc_randomize_pos, 50, 500, 30, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
_launchsite = createVehicle ["Land_PenBlack_F", _pos, [], 0, "FLY"];

//// Add interaction on Terminal \\\\
[[_terminal],{

	private _action = ["Open","Start Hacking","\A3\ui_f\data\igui\cfg\simpleTasks\types\intel_ca.paa",{
		[_this select 0,3] call BIS_fnc_dataTerminalAnimate;
		{btc_side_hack_start = true} remoteExec ["call", 0];
	},{true}] call ace_interact_menu_fnc_createAction;
	[_this select 0, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

}] remoteExec ["call", 2];//-2

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || btc_side_hack_start)};

_groups = [];
private _closest = [_city,btc_city_all select {!(_x getVariable ["active",false])},false] call btc_fnc_find_closecity;
for "_i" from 1 to (2 + round random 1) do {
	_groups pushBack ([_closest, getpos _terminal,1,selectRandom btc_type_motorized] call btc_fnc_mil_send);
};

_terminal setObjectTexture [0, "#(argb,512,512,1)r2t(uavrtt,1)"];

/* create camera and stream to render surface */
_cam = "camera" camCreate (_launchsite modelToWorld [0,100,10]);
_cam cameraEffect ["Internal", "Back", "uavrtt"];

_y = -180; _p = 50; _r = 0;
_cam setVectorDirAndUp [
	[ sin _y * cos _p,cos _y * cos _p,sin _p],
	[ [ sin _r,-sin _p,cos _r * cos _p],-_y] call BIS_fnc_rotateVector2D
];

{player commandChat "Defend the terminal until it is hacked!"} remoteExec ["call", -2];

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || ({_x isEqualTo grpNull} count _groups > 0))};

//// Launch to hacked missile \\\\
private _altitude = 20;
while {_altitude < 400} do {
	_altitude = _altitude + 1.5;
	(createVehicle ["DemoCharge_Remote_Ammo_Scripted", [_pos select 0, _pos select 1, _altitude], [], 0, "CAN_COLLIDE"]) setDamage 1;
	sleep 0.1;
};
private _rocket = createVehicle ["ace_rearm_Missile_AGM_02_F", [_pos select 0, _pos select 1, _altitude], [], 0, "CAN_COLLIDE"];
private _fx = createVehicle ["test_EmptyObjectForSmoke", [_pos select 0, _pos select 1, _altitude], [], 0, "CAN_COLLIDE"];
_fx attachTo [_rocket,[0,0,0]];

btc_side_hack_start = false;
{deletemarker _x} foreach [_area,_marker];

if (btc_side_aborted || btc_side_failed ) exitWith {
	{16 call btc_fnc_task_fail} remoteExec ["call", 0];
	btc_side_assigned = false;publicVariable "btc_side_assigned";
	[_fx] spawn {
		waitUntil {sleep 5; ({_x distance (_this select 0) < 500} count playableUnits == 0)};
		(_this select 0) call btc_fnc_deleteTestObj;
		deleteVehicle (_this select 0);
	};
	{
		[_x] spawn {
			waitUntil {sleep 5; ({_x distance (_this select 0) < 500} count playableUnits == 0)};
			deleteVehicle (_this select 0);
		};
	} forEach [_rocket, _terminal];
};

80 call btc_fnc_rep_change;

{16 call btc_fnc_task_set_done} remoteExec ["call", 0];

[_fx] spawn {
	waitUntil {sleep 5; ({_x distance (_this select 0) < 500} count playableUnits == 0)};
	(_this select 0) call btc_fnc_deleteTestObj;
	deleteVehicle (_this select 0);
};
{
	[_x] spawn {
		waitUntil {sleep 5; ({_x distance (_this select 0) < 500} count playableUnits == 0)};
		deleteVehicle (_this select 0);
	};
} forEach [_rocket, _terminal];

btc_side_assigned = false;publicVariable "btc_side_assigned";