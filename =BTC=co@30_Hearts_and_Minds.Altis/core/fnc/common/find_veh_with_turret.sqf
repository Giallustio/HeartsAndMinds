
private ["_veh_array","_veh_with_turret"];

if ((_this select 0) isEqualTypeAll objNull) then {
	_veh_array = (_this select 0) apply {typeOf _x};
} else {
	_veh_array = _this select 0;
};

_veh_with_turret = [];
{
	private _turrets = "true" configClasses (configFile >> "CfgVehicles" >> _x >> "Turrets");

	if ({!("CargoTurret" in ([_x,true] call BIS_fnc_returnParents))} count _turrets > 0) then {
		_veh_with_turret pushBackUnique _x;
	};
} forEach _veh_array;

_veh_with_turret