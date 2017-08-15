// [marker array], [object array],[fx object array (test_EmptyObjectForSmoke)] , [group array]

{
	deletemarker _x;
} foreach (_this select 0);

{
	private _object = _x;
	[{
		params ["_args", "_id"];
		if ({_x distance _args < 1000} count playableUnits == 0) then {
			[_id] call CBA_fnc_removePerFrameHandler;
			deleteVehicle _args;
		};
	} , 5, _object] call CBA_fnc_addPerFrameHandler;
} forEach (_this select 1);

{
	private _fx = _x;
	[{
		params ["_args", "_id"];
		if ({_x distance _args < 1000} count playableUnits == 0) then {
			[_id] call CBA_fnc_removePerFrameHandler;
			_args call btc_fnc_deleteTestObj;
		};
	} , 5, _fx] call CBA_fnc_addPerFrameHandler;
} forEach (_this select 2);

{
	private _group = _x;
	[{
		params ["_args", "_id"];
		if ({_x distance leader _args < 1000} count playableUnits == 0) then {
			[_id] call CBA_fnc_removePerFrameHandler;
			{deleteVehicle _x} foreach units _args;
			[_args] call btc_fnc_deletegroup;
		};
	} , 5, _group] call CBA_fnc_addPerFrameHandler;
} forEach (_this select 3);