// [marker array], [object array],[fx object array (test_EmptyObjectForSmoke)] , [group array]

{
	deletemarker _x;
} foreach (_this select 0);

{
	[_x] spawn {
		waitUntil {sleep 5; ({_x distance (_this select 0) < 1000} count playableUnits == 0)};
		deleteVehicle (_this select 0);
	};
} forEach (_this select 1);

{
	[_fx] spawn {
		waitUntil {sleep 5; ({_x distance (_this select 0) < 1000} count playableUnits == 0)};
		(_this select 0) call btc_fnc_deleteTestObj;
	};
} forEach (_this select 2);

{
	[_x] spawn {
		waitUntil {sleep 5; ({_x distance leader (_this select 0) < 1000} count playableUnits == 0)};
		{deleteVehicle _x} foreach units (_this select 0);
		[_this select 0] call btc_fnc_deletegroup;
	};
} forEach (_this select 3);