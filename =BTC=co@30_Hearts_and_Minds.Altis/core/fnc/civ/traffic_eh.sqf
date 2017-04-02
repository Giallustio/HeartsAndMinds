//diag_log format ["EH CHECK TRAFFIC %1",_this];

//if (count _this > 4 && {!((_this select 1) isEqualTo "engine")}) exitWith {};

private ["_veh"];

_veh = _this select 0;
if (btc_debug_log) then	{
	diag_log format ["EH TRAFFIC ID: %1 veh: %2 driver: %3 pos_veh: %4",(_veh getVariable ["driver",_veh]) getVariable "btc_traffic_id", _veh,_veh getVariable ["driver",_veh], getPos _veh];
};

_veh call btc_fnc_civ_traffic_eh_remove;

[_veh,(_veh getVariable ["driver",grpNull])] spawn {
	waitUntil {sleep 5; ({_x distance (_this select 0) < 600} count playableUnits == 0)};
	{deleteVehicle _x;} foreach ([_this select 0] + units (_this select 1));
	deleteGroup (_this select 1);
};