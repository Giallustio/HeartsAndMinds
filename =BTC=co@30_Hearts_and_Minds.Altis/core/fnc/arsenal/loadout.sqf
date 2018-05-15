params [
    ["_type", 0], // 0 - Rifleman, 1 - Medic Adv, 2 - Medic Basic, 3 - Repair, 4 - Engineer, 5 - Anti-Tank, 6 - Anti Air
    ["_color", [[0, 1] select (worldName in ["Tanoa"]), 2] select (sunOrMoon isEqualTo 0)], //0 - Desert, 1 - Tropic, 2 - Black
    ["_isDay", sunOrMoon isEqualTo 1]
];

//Array of colored item: 0 - Desert, 1 - Tropic, 2 - Black
private _uniforms = ["U_B_CombatUniform_mcam", "U_B_CTRG_Soldier_F", "U_B_CTRG_1"];
private _vest = ["V_PlateCarrierH_CTRG", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrierH_CTRG"];
private _helmets = ["H_HelmetSpecB_paint2", "H_HelmetB_Enh_tna_F", "H_HelmetSpecB_blk"];
private _hoods = ["G_Balaclava_combat", "G_Balaclava_TI_G_tna_F", "G_Balaclava_combat"];
private _Laserdesignators = ["Laserdesignator", "Laserdesignator_03", "Laserdesignator_01_khk_F"];
private _night_visions = ["NVGoggles", "NVGoggles_INDEP", "NVGoggles_OPFOR"];
private _weapons = ["arifle_MXC_F", "arifle_MXC_khk_F", "arifle_MXC_Black_F"];
private _pistols = ["hgun_P07_F", "hgun_P07_khk_F", "hgun_P07_F"];
private _launcher_AT = ["launch_B_Titan_short_F", "launch_B_Titan_short_tna_F", "launch_O_Titan_short_F"];
private _launcher_AA = ["launch_B_Titan_F", "launch_B_Titan_tna_F", "launch_O_Titan_F"];
private _backpacks = ["B_AssaultPack_Kerry", "B_AssaultPack_Kerry", "B_AssaultPack_blk"];
private _backpacks_big = ["B_Kitbag_mcamo", "B_Kitbag_rgr", "B_Kitbag_rgr"];

//Item inside Uniform
private _cargo_uniform = [["acc_flashlight", 1], ["ACE_EarPlugs", 1], ["ACE_CableTie",5], ["optic_ACO_grn_smg", 1], ["ACE_MapTools", 1], ["ACE_RangeTable_82mm", 1], ["ACE_morphine", 3], ["ACE_epinephrine", 3], ["ACE_fieldDressing", 3], ["ACE_packingBandage", 3], ["ACE_tourniquet", 4]];

//Generate magazines and count
private _launcher = ["", _launcher_AT select _color] select (_type isEqualTo 5);
private _launcher = [_launcher, _launcher_AA select _color] select (_type isEqualTo 6);
[_weapons select _color, _pistols select _color] params ["_weapon", "_pistol"];
([_weapon, _pistol, _launcher] apply {getArray (configFile >> "CfgWeapons" >> _x >> "magazines")}) params ["_weaponMagazines", "_pistolMagazines", "_launcherMagazines"];
[_weaponMagazines select 0, _pistolMagazines select 0, _launcherMagazines select 0] params ["_weaponMagazine", "_pistolMagazine", "_launcherMagazine"];
([_weaponMagazine, _pistolMagazine, _launcherMagazine] apply {getNumber (configfile >> "CfgMagazines" >> _x >> "count")}) params ["_weaponCount", "_pistolCount", "_launcherCount"];

//Backpack content for: 0 - Rifleman, 1 - Medic Adv, 2 - Medic Basic, 3 - Repair, 4 - Engineer, 5 - Anti-Tank, 6 - Anti Air
private _cargos = [
    [],
    [_backpacks select _color, [["ACE_packingBandage", 15], ["ACE_elasticBandage", 10], ["ACE_morphine", 12], ["ACE_epinephrine", 12], ["ACE_salineIV_250", 2], ["ACE_salineIV", 2], ["ACE_fieldDressing", 2], ["ACE_personalAidKit", 2], ["ACE_salineIV_500", 3], ["ACE_quikclot", 10], ["ACE_surgicalKit", 1], ["SmokeShellGreen", 3, 1], ["SmokeShellPurple", 1, 1]]],
    [_backpacks select _color, [["ACE_packingBandage", 15], ["ACE_elasticBandage", 10], ["ACE_morphine", 12], ["ACE_epinephrine", 12], ["ACE_fieldDressing", 2], ["ACE_personalAidKit", 2], ["ACE_quikclot", 10], ["ACE_surgicalKit", 1], ["ACE_bloodIV", 2], ["ACE_bloodIV_250", 2], ["ACE_bloodIV_500", 1], ["SmokeShellGreen", 3, 1], ["SmokeShellPurple", 1, 1]]],
    [_backpacks select _color, [["ToolKit", 1]]],
    [_backpacks select _color, [["ACE_DefusalKit", 1], ["ACE_Clacker", 2], ["ACE_SpraypaintRed", 1], ["DemoCharge_Remote_Mag", 2, 1], [["ACE_VMM3", "", "", "", [], [], ""], 1]]],
    [_backpacks select _color, [[_launcherMagazines param [1, _launcherMagazine], 1, _launcherCount], [_launcherMagazine, 1, _launcherCount]]],
    [_backpacks_big select _color, [[_launcherMagazine, 2, _launcherCount]]]
];
private _binocular_array = [_Laserdesignators, "", "", "", ["Laserbatteries", 1], [], ""];
private _launcher_array = [_launcher, "", "", "", [_launcherMagazine, _launcherCount], [], ""];

if (_isDay) then {
    [
        [_weapon, "", "", "ACE_optic_Arco_2D", [_weaponMagazine, _weaponCount], [], ""],
        _launcher_array,
        [_pistol, "", "", "", [_pistolMagazine, _pistolCount], [], ""],
        [_uniforms select _color, _cargo_uniform],
        [_vest select _color, [["SmokeShellGreen", 2, 1], [_weaponMagazine,7, _weaponCount], ["SmokeShellPurple", 2, 1], ["SmokeShellYellow", 1, 1], [_pistolMagazine, 1, _pistolCount], ["ACE_M84", 1, 1], ["HandGrenade", 3, 1]]],
        _cargos select _type, _helmets select _color, _hoods select _color, _binocular_array,
        ["ItemMap", "B_UavTerminal", "ItemRadio", "ItemCompass", "ItemWatch", ""]
    ]
} else {
    [
        [_weapon, "muzzle_snds_65_TI_blk_F", "acc_pointer_IR", "ACE_optic_Hamr_2D", [_weaponMagazines param [1, _weaponMagazine], _weaponCount], [], ""],
        _launcher_array,
        [_pistol, "", "", "", [_pistolMagazine, _pistolCount], [], ""],
        [_uniforms select _color, _cargo_uniform],
        [_vest select _color, [["SmokeShellGreen", 1, 1], ["B_IR_Grenade", 2, 1], [_weaponMagazines param [1, _weaponMagazine], 7, _weaponCount], ["Chemlight_green", 2, 1], ["Chemlight_blue", 2, 1], ["ACE_HandFlare_Green", 1, 1], ["HandGrenade", 3, 1], ["ACE_M84", 1, 1]]],
        _cargos select _type, _helmets select _color, _hoods select _color, _binocular_array,
        ["ItemMap", "B_UavTerminal", "ItemRadio", "ItemCompass", "ItemWatch", _night_visions select _color]
    ]
};
