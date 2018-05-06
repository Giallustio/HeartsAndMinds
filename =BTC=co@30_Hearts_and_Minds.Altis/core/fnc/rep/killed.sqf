params ["_unit", "_killer"];

if (isPlayer _killer) then {
    btc_rep_malus_civ_killed call btc_fnc_rep_change;
    if (btc_global_reputation < 600) then {
        [getPos _unit] spawn btc_fnc_rep_eh_effects;
    };

    if (btc_debug_log) then {
        diag_log format ["REP KILLED = GREP %1 THIS = %2", btc_global_reputation, _this];
    };
};

if !((_unit getVariable ["traffic", objNull]) isEqualTo objNull) then {
    [[], [_unit getVariable ["traffic", objNull]], []] call btc_fnc_delete;
};
