//diag_log format ["EH CHECK TRAFFIC %1",_this];

//if (count _this > 4 && {!((_this select 1) isEqualTo "engine")}) exitWith {};

private ["_veh"];

_veh = _this select 0;
/*if (btc_debug_log) then	{
	diag_log format ["traffic eh: veh: %1 driver: %2 pos_veh: %3",_veh,(_veh getVariable ["driver",_veh]), getPos _veh];
};
*/
_veh call btc_fnc_civ_traffic_eh_remove;

[_veh,(_veh getVariable ["driver",_veh])] spawn {
	waitUntil {sleep 5; ({_x distance (_this select 0) < 600} count playableUnits == 0)};
	{deleteVehicle _x;} foreach _this;
};