
private ["_useful","_city","_pos","_heli","_heli_type","_pitch","_bank","_random_area","_return_pos","_units","_fx","_group","_triggers","_trigger"];

//// Choose an occupied City \\\\
_useful = btc_city_all select {(_x getVariable ["occupied",false] && {_x getVariable ["type",""] != "NameLocal"} && {_x getVariable ["type",""] != "Hill"} && (_x getVariable ["type",""] != "NameMarine"))};

if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};

_city = selectRandom _useful;

//// Randomise position \\\\
_pos = [getPos _city, (((_city getVariable ["RadiusX",0]) + (_city getVariable ["RadiusY",0]))/2) - 100] call btc_fnc_randomize_pos;
_random_area = 50;
for "_i" from 0 to 4 do {
	_return_pos = [_pos, 0, _random_area, 13, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
	if (count _return_pos == 2) exitWith {_return_pos = [_return_pos select 0, _return_pos select 1, 0];};
	_random_area = _random_area * 1.5;
};
_pos = _return_pos;

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;publicVariable "btc_side_assigned";

[[13,getPos _city,_city getVariable "name"],"btc_fnc_task_create",true] spawn BIS_fnc_MP;

btc_side_jip_data = [13,getPos _city,_city getVariable "name"];

_city setVariable ["spawn_more",true];

_heli_type = typeOf selectRandom ((btc_vehicles + btc_helo) select {_x isKindOf "air"});
_heli = createVehicle [_heli_type, _pos, [], 0, "NONE"];
_heli setVariable ["btc_dont_delete",true];
_heli setDamage 1;
_heli enableSimulation false;
_heli setPos [getPosASL _heli select 0, getPosASL _heli select 1, 0 - 1.5];
_pitch = if(random 1 > 0.5) then{ random 40} else { -1 * random 40};
_bank = if(random 1 > 0.5) then{ random 40} else { -1 * random 40};
[_heli, _pitch, _bank] call BIS_fnc_setPitchBank;
_fx = createVehicle ["test_EmptyObjectForSmoke",_pos,[], 0, "CAN_COLLIDE"];
_fx attachTo [_heli, [0.5, -2, 1] ];

_group = createGroup btc_player_side;
_group setVariable ["no_cache",true];
_group setVariable ["btc_patrol",true];
getText(configfile >> "CfgVehicles" >> _heli_type >> "crew") createUnit [_pos, _group];
_units = [];
_triggers = [];
{
	_x setCaptive true;
	removeAllWeapons _x;
	_x setBehaviour "CARELESS";
	_x setDir (random 360);
	_x setUnitPos "DOWN";
	_units pushBack _x;
	//// Create trigger \\\\
	_trigger = createTrigger["EmptyDetector",getPos _city];
	_trigger setVariable ["unit", _x];
	_trigger setTriggerArea[50,50,0,false];
	_trigger setTriggerActivation[str(btc_player_side),"PRESENT",false];
	_trigger setTriggerStatements["this", "_unit = thisTrigger getVariable 'unit'; [_unit] join (thisList select 0); _unit setUnitPos 'UP';", ""];
	_trigger attachTo [_x,[0,0,0]];
	_triggers pushBack _trigger;
} foreach units _group;

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || ({_x distance getpos btc_create_object_point > 100} count _units isEqualTo 0) || ({Alive _x} count _units isEqualTo 0))};

[[_fx,_heli] + _triggers,_units,_group] spawn {
	waitUntil {sleep 5; ({_x distance ((_this select 1) select 0) < 500} count playableUnits isEqualTo 0)};
	((_this select 0) select 0) call btc_fnc_deleteTestObj;
	{if (!isNull _x) then {deleteVehicle _x}} foreach ((_this select 0) + (_this select 1));
	deleteGroup (_this select 2);
};

if (btc_side_aborted || btc_side_failed || ({Alive _x} count _units isEqualTo 0)) exitWith {
	[13,"btc_fnc_task_fail",true] spawn BIS_fnc_MP;
	btc_side_assigned = false;publicVariable "btc_side_assigned";
};

50 call btc_fnc_rep_change;

[13,"btc_fnc_task_set_done",true] spawn BIS_fnc_MP;

btc_side_assigned = false;publicVariable "btc_side_assigned";