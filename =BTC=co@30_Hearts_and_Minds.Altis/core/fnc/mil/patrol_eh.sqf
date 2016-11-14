//diag_log format ["EH CHECK TRAFFIC %1",_this];

//if (count _this > 4 && {!((_this select 1) isEqualTo "engine")}) exitWith {};

private ["_veh"];

_veh = _this select 0;
//hint "traffic eh";diag_log text format ["traffic eh: %1",_veh];
_veh call btc_fnc_mil_patrol_eh_remove;

[_veh,(_veh getVariable ["crews",grpNull])] spawn {
	waitUntil {sleep 5; ({_x distance (_this select 0) < 1000} count playableUnits == 0)};
	{deleteVehicle _x;} foreach ([_this select 0] + units (_this select 1));
	deleteGroup (_this select 1);
	if (isNull (_this select 0)) exitWith {};//Just to be sure
};