
private ["_useful","_veh","_vehpos","_city","_pos","_r","_houses","_roads","_marker","_unit_type","_fx","_phone_type","_veh_type","_group","_unit"];

//// Choose a clear City \\\\
_useful = btc_city_all select {(!(_x getVariable ["occupied",false]) && {_x getVariable ["type",""] != "NameLocal"} && {_x getVariable ["type",""] != "Hill"} && (_x getVariable ["type",""] != "NameMarine"))};
if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};
_city = selectRandom  _useful;
_pos = getPos _city;

//// Choose spawn in house or on road \\\\
_r = random 2;
if ( _r < 1)	then {
	_roads = _pos nearRoads 200;
	if (count _roads > 0) then {_pos = getPos (selectRandom _roads);};
	_vehpos = [_pos, 10] call btc_fnc_randomize_pos;
} else {
	_houses = [[(_pos select 0),(_pos select 1),0],200] call btc_fnc_getHouses;
	_pos = getPos (selectRandom _houses);
	_vehpos = [(_pos select 0),(_pos select 1),(_pos select 2) + 0.1];
};

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;publicVariable "btc_side_assigned";

[[8,_pos,_city getVariable "name"],"btc_fnc_task_create",true] spawn BIS_fnc_MP;

btc_side_jip_data = [8,_pos,_city getVariable "name"];

//// Create marker \\\\
_marker = createmarker [format ["sm_2_%1",_pos],_pos];
_marker setmarkertype "hd_flag";
_marker setmarkertext "Civil need help";
_marker setMarkerSize [0.6, 0.6];

//// Create civ on _pos \\\\
if ( _r < 1) then {
	_veh_type = selectRandom btc_civ_type_veh;
	_veh = createVehicle [_veh_type, _vehpos, [], 0, "NONE"];
	_veh setDir (random 360);
	_veh setDamage 0.7;
	//// Random wheel hit \\\\
	if (_r <0.5) then {
		_veh setHit ["wheel_1_2_steering", 1];
	} else {
		_veh setHit ["wheel_2_1_steering", 1];
	};
	_veh setHit ["wheel_1_1_steering", 1];
	//// Add smoke effect on car \\\\
	_fx = "test_EmptyObjectForSmoke" createVehicle (getposATL _veh);
	_fx attachTo [_veh,[0,0,0]];
} else {
	_phone_type = selectRandom btc_type_phone;
	_veh = createVehicle [_phone_type, _vehpos, [], 0, "NONE"];
	_veh setDir (random 360);
	_fx = objNull;
};

_unit_type = selectRandom btc_civ_type_units;
_group = createGroup civilian;
_group setVariable ["no_cache",true];
_group setVariable ["btc_patrol",true];
_unit =_group createUnit [_unit_type, _pos, [], 0, "NONE"];
(leader _group) setpos _pos;
_unit setBehaviour "CARELESS";
_unit setDir (random 360);
_unit setPosATL _pos;
_unit setUnitPos "DOWN";
{_x call btc_fnc_civ_unit_create} foreach units _group;

sleep 1;
waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || ({_x distance _unit > 5000} count playableUnits == 0))};
[_unit] call btc_fnc_set_damage;

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || !Alive _unit || {_unit call ace_medical_fnc_isInStableCondition && [_unit] call ace_common_fnc_isAwake})};

{deletemarker _x} foreach [_marker];

[_fx,_unit,_veh] spawn {
	waitUntil {sleep 5; ({_x distance (_this select 1) < 300} count playableUnits == 0)};
	(_this select 0) call btc_fnc_deleteTestObj;
	{if (!isNull _x) then {deleteVehicle _x}} forEach _this;
};

if (btc_side_aborted || btc_side_failed || !Alive _unit) exitWith {
	[8,"btc_fnc_task_fail",true] spawn BIS_fnc_MP;
	btc_side_assigned = false;publicVariable "btc_side_assigned";
};

15 call btc_fnc_rep_change;

[8,"btc_fnc_task_set_done",true] spawn BIS_fnc_MP;

_unit setUnitPos "UP";

btc_side_assigned = false;publicVariable "btc_side_assigned";