params [
    ["_player", objNull],
    ["_color", [[0, 1] select (worldName isEqualTo "Tanoa"), 2] select (sunOrMoon isEqualTo 0)], //0 - Desert, 1 - Tropic, 2 - Noir
    ["_isDay", sunOrMoon isEqualTo 1]
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
    case (_player getVariable ["ace_isEngineer", false]): {
        _type = 4;
    };
    case (_player getUnitTrait "explosiveSpecialist"): {
        _type = 3;
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

if (btc_debug && btc_debug_log) then {
    [
        format ["IsMedic basic: %1 IsMedic Adv: %2 IsAdvEngineer: %3 IsExplosiveSpecialist: %4 IsAT: %5 IsAA: %6 (Color: %7 IsDay: %8)",
            (_player getUnitTrait "medic") && (ace_medical_level isEqualTo 1),
            (_player getUnitTrait "medic") && (ace_medical_level isEqualTo 2),
            _player getVariable ["ace_isEngineer", false],
            _player getUnitTrait "explosiveSpecialist",
            [typeOf _player, "128 + 512"] call btc_fnc_mil_ammoUsage,
            [typeOf _player] call btc_fnc_mil_ammoUsage,
            _color,
            _isDay
            ], __FILE__, [btc_debug, btc_debug_log]
    ] call btc_fnc_debug_message;
};

private _uniform = ["U_B_CombatUniform_mcam", "U_B_CTRG_Soldier_F", "U_B_CTRG_1"];
private _vest = ["V_PlateCarrierH_CTRG", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrierH_CTRG"];
private _helmet = ["H_HelmetSpecB_paint2", "H_HelmetB_Enh_tna_F", "H_HelmetSpecB_blk"];
private _hood = ["G_Balaclava_combat", "G_Balaclava_TI_G_tna_F", "G_Balaclava_combat"];
private _night_vision = ["NVGoggles", "NVGoggles_INDEP", "NVGoggles_OPFOR"];
private _weapon = ["arifle_MXC_F", "arifle_MXC_khk_F", "arifle_MXC_Black_F"];
private _pistol = ["hgun_P07_F", "hgun_P07_khk_F", "hgun_P07_F"];
private _launcher_AT = ["launch_B_Titan_short_F", "launch_B_Titan_short_tna_F", "launch_O_Titan_short_F"];
private _launcher_AA = ["launch_B_Titan_F", "launch_B_Titan_tna_F", "launch_O_Titan_F"];
private _backpack = ["B_AssaultPack_Kerry", "B_AssaultPack_Kerry", "B_AssaultPack_blk"];
private _backpack_big = ["B_Kitbag_mcamo", "B_Kitbag_rgr", "B_Kitbag_rgr"];

private _cargo_uniform = [["acc_flashlight", 1], ["ACE_EarPlugs", 1], ["ACE_CableTie",5], ["optic_ACO_grn_smg", 1], ["ACE_MapTools", 1], ["ACE_RangeTable_82mm", 1], ["ACE_morphine", 3], ["ACE_epinephrine", 3], ["ACE_fieldDressing", 3], ["ACE_packingBandage", 3], ["ACE_tourniquet", 4]];
private _cargo = [
    [],
    [_backpack select _color, [["ACE_packingBandage", 15], ["ACE_elasticBandage", 10], ["ACE_morphine", 12], ["ACE_epinephrine", 12], ["ACE_salineIV_250", 2], ["ACE_salineIV", 2], ["ACE_fieldDressing", 2], ["ACE_personalAidKit", 2], ["ACE_salineIV_500", 3], ["ACE_quikclot", 10], ["ACE_surgicalKit", 1], ["SmokeShellGreen", 3, 1], ["SmokeShellPurple", 1, 1]]],
    [_backpack select _color, [["ACE_packingBandage", 15], ["ACE_elasticBandage", 10], ["ACE_morphine", 12], ["ACE_epinephrine", 12], ["ACE_fieldDressing", 2], ["ACE_personalAidKit", 2], ["ACE_quikclot", 10], ["ACE_surgicalKit", 1], ["ACE_bloodIV", 2], ["ACE_bloodIV_250", 2], ["ACE_bloodIV_500", 1], ["SmokeShellGreen", 3, 1], ["SmokeShellPurple", 1, 1]]],
    [_backpack select _color, [["ToolKit", 1]]],
    [_backpack select _color, [["ACE_DefusalKit", 1], ["ACE_Clacker", 2], ["ACE_RangeTable_82mm", 1], ["ACE_SpraypaintRed", 1], ["DemoCharge_Remote_Mag", 2, 1], [["ACE_VMM3", "", "", "", [], [], ""], 1]]],
    [_backpack select _color, [["Titan_AP", 1, 1], ["Titan_AT", 1, 1]]],
    [_backpack_big select _color, [["Titan_AA", 1, 1], ["Titan_AA", 1, 1]]]
];
private _launcher = [[], [_launcher_AT select _color, "", "", "", ["Titan_AT", 1], [], ""]] select (_type isEqualTo 5);
private _launcher = [_launcher, [_launcher_AA select _color, "", "", "", ["Titan_AA", 1], [], ""]] select (_type isEqualTo 6);

if (_isDay) then {
    [[_weapon select _color, "", "", "ACE_optic_Arco_2D", ["30Rnd_65x39_caseless_mag", 30], [], ""], _launcher, [_pistol select _color, "", "", "", ["16Rnd_9x21_Mag", 17], [], ""], [_uniform select _color, _cargo_uniform], [_vest select _color, [["SmokeShellGreen", 2, 1], ["30Rnd_65x39_caseless_mag",7, 30], ["SmokeShellPurple", 2, 1], ["SmokeShellYellow", 1, 1], ["16Rnd_9x21_Mag", 1, 17], ["ACE_M84", 1, 1], ["HandGrenade", 3, 1]]], _cargo select _type, _helmet select _color, _hood select _color, ["Laserdesignator", "", "", "", [], [], ""], ["ItemMap", "B_UavTerminal", "ItemRadio", "ItemCompass", "ItemWatch", ""]]
} else {
    [[_weapon select _color, "muzzle_snds_65_TI_blk_F", "acc_pointer_IR", "ACE_optic_Hamr_2D", ["30Rnd_65x39_caseless_mag", 30], [], ""], _launcher, [_pistol select _color, "", "", "", ["16Rnd_9x21_Mag", 17], [], ""], [_uniform select _color, _cargo_uniform], [_vest select _color, [["SmokeShellGreen", 1, 1], ["B_IR_Grenade", 2, 1], ["30Rnd_65x39_caseless_mag_Tracer",7, 30], ["Chemlight_green", 2, 1], ["Chemlight_blue", 2, 1], ["ACE_HandFlare_Green", 1, 1], ["HandGrenade", 3, 1], ["ACE_M84", 1, 1]]], _cargo select _type, _helmet select _color, _hood select _color, ["Laserdesignator", "", "", "", [], [], ""], ["ItemMap", "B_UavTerminal", "ItemRadio", "ItemCompass", "ItemWatch", _night_vision select _color]]
};
