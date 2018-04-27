params ["_unit"];

_unit call btc_fnc_civ_unit_create;

if (btc_debug_log) then {diag_log format ["Curator create civ : %1", _unit];};
