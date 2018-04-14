params ["_veh"];

if (btc_debug_log) then {
	hint "traffic eh";
	diag_log text format ["traffic eh: %1",_veh];
};

_veh call btc_fnc_mil_patrol_eh_remove;

[[], [_veh], [], [_veh getVariable ["crews", grpNull]]] call btc_fnc_delete;
