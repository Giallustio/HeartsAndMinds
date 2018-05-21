params [
    ["_player", objNull]
];

// 0 - Rifleman, 1 - Medic Adv, 2 - Medic Basic, 3 - Repair, 4 - Engineer, 5 - Anti-Tank
private _type = 0;
switch (true) do {
    case ((_player getUnitTrait "medic") && (ace_medical_level isEqualTo 1)): {
        _type = 1;
    };
    case ((_player getUnitTrait "medic") && (ace_medical_level isEqualTo 2)): {
        _type = 2;
    };
    case (_player getVariable ["ace_isEngineer", 0] in [1, 2]): {
        _type = 3;
    };
    case (_player getUnitTrait "explosiveSpecialist"): {
        _type = 4;
    };
    case ([typeOf _player, "128 + 512"] call btc_fnc_mil_ammoUsage): {
        _type = 5;
    };
    case ([typeOf _player] call btc_fnc_mil_ammoUsage): {
        _type = 6;
    };
    default {
        _type = 0;
    };
};

if (btc_debug || btc_debug_log) then {
    [
        format ["IsMedic basic: %1 IsMedic Adv: %2 IsAdvEngineer: %3 IsExplosiveSpecialist: %4 IsAT: %5 IsAA: %6",
            (_player getUnitTrait "medic") && (ace_medical_level isEqualTo 1),
            (_player getUnitTrait "medic") && (ace_medical_level isEqualTo 2),
            _player getVariable ["ace_isEngineer", 0],
            _player getUnitTrait "explosiveSpecialist",
            [typeOf _player, "128 + 512"] call btc_fnc_mil_ammoUsage,
            [typeOf _player] call btc_fnc_mil_ammoUsage
            ], __FILE__, [btc_debug, btc_debug_log]
    ] call btc_fnc_debug_message;
};

_type
