params [
    ["_unit", objNull, [objNull]],
    ["_killer", objNull, [objNull]]
];

if (isPlayer _killer) then {
    btc_rep_malus_civ_killed call btc_fnc_rep_change;
    if (btc_global_reputation < 600) then {
        [getPos _unit] spawn btc_fnc_rep_eh_effects;
    };

    if (btc_debug_log) then {
        [format ["GREP %1 THIS = %2", btc_global_reputation, _this], __FILE__, [false]] call btc_fnc_debug_message;
    };
};

private _vehicle = assignedVehicle _unit;
if !(_vehicle isEqualTo objNull) then {
    [[], [_vehicle], []] call btc_fnc_delete;
};
