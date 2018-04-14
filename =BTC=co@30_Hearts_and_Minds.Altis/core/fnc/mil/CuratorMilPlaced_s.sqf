params ["_unit"];

_unit call btc_fnc_mil_unit_create;

if (btc_debug_log) then {diag_log format ["Curator create mil : %1", _unit];};
