
private ["_unit","_killer"];

_unit = _this select 0;
_killer = _this select 1;
if (isPlayer _killer) then {
	btc_rep_malus_civ_killed call btc_fnc_rep_change;
	if (btc_global_reputation < 600) then {[getpos _unit] spawn btc_fnc_rep_eh_effects;};
	if (btc_debug_log) then {diag_log format ["REP KILLED = GREP %1 THIS = %2",btc_global_reputation,_this];};
};

if !(isNil {_unit getVariable ["traffic",objNull]}) then {
	[[], [_unit getVariable ["traffic",objNull]], [], []] call btc_fnc_delete;
};