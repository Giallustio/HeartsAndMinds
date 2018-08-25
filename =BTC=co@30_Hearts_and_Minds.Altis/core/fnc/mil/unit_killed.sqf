params [
    ["_unit", objNull, [objNull]],
    ["_killer", objNull, [objNull]]
];

private _killer = _unit getVariable ["ace_medical_lastDamageSource", _killer];

if (!isDedicated && !hasInterface) then {
    [_unit, _killer] remoteExec ["btc_fnc_mil_unit_killed", 2];
} else {
    if (random 100 > btc_info_intel_chance) then {
        _unit setVariable ["intel", true];
    };

    if (isPlayer _killer) then {
        if (isServer) then {
            btc_rep_bonus_mil_killed call btc_fnc_rep_change;
        } else {
            btc_rep_bonus_mil_killed remoteExec ["btc_fnc_rep_change", 2];
        };
    };
};
