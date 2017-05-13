//diag_log format ["EH CHECK TRAFFIC %1",_this];

//if (count _this > 4 && {!((_this select 1) isEqualTo "engine")}) exitWith {};

private _veh = _this select 0;
if (btc_debug_log) then {hint "traffic eh";diag_log text format ["traffic eh: %1",_veh];};
_veh call btc_fnc_mil_patrol_eh_remove;

[[], [_veh], [], [(_veh getVariable ["crews",grpNull])]] call btc_fnc_delete;