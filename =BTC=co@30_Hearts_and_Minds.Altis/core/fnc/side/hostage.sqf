
private ["_useful","_city","_pos","_captive","_group","_house","_houses","_marker"];

//// Choose an occupied City \\\\
_useful = btc_city_all select {(_x getVariable ["occupied",false] && {_x getVariable ["type",""] != "NameLocal"} && {_x getVariable ["type",""] != "Hill"} && (_x getVariable ["type",""] != "NameMarine"))};

if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};

_city = selectRandom _useful;

//// Randomise position \\\\
_houses = [getPos _city,100] call btc_fnc_getHouses;
_house = selectRandom _houses;
_pos = _house buildingPos 0;
if (btc_debug_log) then {diag_log format ["hostage : count all pos %1 in %2 ", count (_house buildingPos -1),_house buildingPos -1];};

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;publicVariable "btc_side_assigned";

[[13,getPos _city,_city getVariable "name"],"btc_fnc_task_create",true] spawn BIS_fnc_MP;

btc_side_jip_data = [13,getPos _city,_city getVariable "name"];

_city setVariable ["spawn_more",true];

_marker = createmarker [format ["sm_2_%1",_pos],_pos];
_marker setmarkertype "hd_flag";
_marker setmarkertext "Hostage";
_marker setMarkerSize [0.6, 0.6];

_group = createGroup civilian;
_group setVariable ["no_cache",true];
(selectRandom btc_civ_type_units) createUnit [_pos, _group, "_captive = this; [this,true] call ACE_captives_fnc_setHandcuffed;"];
_captive setPos _pos;
{_x call btc_fnc_civ_unit_create} foreach units _group;

{
	_unit = ((createGroup btc_enemy_side) createUnit [selectRandom btc_type_units, _x, [], 0, "NONE"]);
	_unit setDir (random 360);
	_unit call btc_fnc_mil_unit_create;
} forEach ((_house buildingPos -1) - [_house buildingPos 0]);

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || !(_captive getVariable ["ace_captives_isHandcuffed", false]) || !Alive _captive)};

deletemarker _marker;
_group setVariable ["no_cache",false];

if (btc_side_aborted || btc_side_failed || !(Alive _captive)) exitWith {
	[13,"btc_fnc_task_fail",true] spawn BIS_fnc_MP;
	btc_side_assigned = false;publicVariable "btc_side_assigned";
	[_captive,_group] spawn {
	waitUntil {sleep 5; ({_x distance (_this select 0) < 500} count playableUnits isEqualTo 0)};
	{if (!isNull _x) then {deleteVehicle _x}} foreach ([(_this select 0)] + units (_this select 1));
	deleteGroup (_this select 1);
	};
};

40 call btc_fnc_rep_change;

[13,"btc_fnc_task_set_done",true] spawn BIS_fnc_MP;

btc_side_assigned = false;publicVariable "btc_side_assigned";