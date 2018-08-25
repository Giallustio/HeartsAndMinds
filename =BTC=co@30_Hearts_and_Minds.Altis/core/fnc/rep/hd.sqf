params ["_unit", "_part", "_dam", "_injurer", "_ammo"];

if (_part in ["body", "wheel_1_1_steering", "wheel_1_2_steering", "wheel_2_1_steering", "wheel_2_2_steering", "palivo", "engine", "glass1", "glass2", "glass3", "glass4", "karoserie", "palivo", "fuel_hitpoint", "engine_hitpoint", "body_hitpoint"]) then {
    if (isPlayer _injurer && {_dam > 0.01}) then    {
        btc_rep_malus_civ_hd call btc_fnc_rep_change;

        if (btc_global_reputation < 600) then {[getPos _unit] spawn btc_fnc_rep_eh_effects;};
        if (btc_debug_log) then {
            [format ["REP HD = GREP %1 THIS = %2", btc_global_reputation, _this], __FILE__, [false]] call btc_fnc_debug_message;
        };
    };
};

_dam
