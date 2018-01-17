
params ["_city", "_area", ["_rpos", []], ["_group", grpNull]];

if (btc_debug_log) then {
	diag_log format ["btc_fnc_ied_drone_create:  _name = %1 _area %2",_city getVariable ["name","name"],_area];
};

if (_rpos isEqualTo []) then {
	_rpos = [position _city, _area] call btc_fnc_randomize_pos;
	_group = createGroup [btc_enemy_side, true];
};

private _drone = createVehicle ["C_IDAP_UAV_06_antimine_F", _rpos, [], 0, "FLY"];
createVehicleCrew _drone;
[driver _drone] joinSilent _group;

[_group,_rpos,_area,"SAFE", false] call btc_fnc_task_patrol;

_group setVariable ["btc_ied_drone", true];

{_x call btc_fnc_mil_unit_create} foreach units _group;

//Main check
[{
	params ["_args", "_id"];
	_args params ["_driver_drone"];

	if (Alive _driver_drone && !isNull _driver_drone) then {
		private _array = _driver_drone nearEntities ["SoldierWB", 190];
		if !(_array isEqualTo []) then {
			[_id] call CBA_fnc_removePerFrameHandler;
			[_driver_drone] call btc_fnc_ied_drone_active;
		};
	} else {
		[_id] call CBA_fnc_removePerFrameHandler;
	};
} , 5, [driver _drone]] call CBA_fnc_addPerFrameHandler;
