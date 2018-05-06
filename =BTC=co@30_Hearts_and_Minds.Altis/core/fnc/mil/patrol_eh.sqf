params ["_veh"];

if (btc_debug_log) then {
    diag_log text format ["btc_fnc_mil_patrol_eh: %1", _veh];
};

_veh call btc_fnc_mil_patrol_eh_remove;

[[], [_veh], [_veh getVariable ["crews", grpNull]]] call btc_fnc_delete;
