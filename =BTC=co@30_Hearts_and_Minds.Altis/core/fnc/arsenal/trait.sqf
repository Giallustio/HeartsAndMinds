params [
    ["_player", objNull, [objNull]]
];

// 0 - Rifleman, 1 - Medic Adv, 2 - Medic Basic, 3 - Repair, 4 - Engineer, 5 - Anti-Tank
// https://community.bistudio.com/wiki/CfgAmmo_Config_Reference#aiAmmoUsageFlags
private _type_ammoUsageAllowed = [0, ["64"]];
switch (true) do {
    case ((_player getUnitTrait "medic") && (ace_medical_level isEqualTo 1)): {
        _type_ammoUsageAllowed = [1, ["64"]];
    };
    case ((_player getUnitTrait "medic") && (ace_medical_level isEqualTo 2)): {
        _type_ammoUsageAllowed = [2, ["64"]];
    };
    case (_player getVariable ["ace_isEngineer", 0] in [1, 2]): {
        _type_ammoUsageAllowed = [3, ["64"]];
    };
    case (_player getUnitTrait "explosiveSpecialist"): {
        _type_ammoUsageAllowed = [4, ["64", "16"]];
    };
    case ([typeOf _player, "128 + 512"] call btc_fnc_mil_ammoUsage): {
        _type_ammoUsageAllowed = [5, ["64", "128 + 512"]];
    };
    case ([typeOf _player] call btc_fnc_mil_ammoUsage): {
        _type_ammoUsageAllowed = [6, ["64", "256"]];
    };
    default {
        _type_ammoUsageAllowed = [0, ["64"]];
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

_type_ammoUsageAllowed
