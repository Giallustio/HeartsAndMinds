
private ["_veh_array"];

if ((_this select 0) isEqualTypeAll objNull) then {
	_veh_array = (_this select 0) apply {typeOf _x};
} else {
	_veh_array = _this select 0;
};

private _veh_with_turret = [];
{
	private _wps = [];
	private _type = _x;
	{
		_wps append (([_type,_x] call btc_fnc_log_getconfigmagazines));
	} forEach [[-1], [0], [0,0], [0,1], [1], [2], [0,2]];
	_wps = _wps - (_this select 1);

	if !(_wps isEqualTo []) then {
		_veh_with_turret pushBackUnique _x;
	};
} forEach _veh_array;

_veh_with_turret