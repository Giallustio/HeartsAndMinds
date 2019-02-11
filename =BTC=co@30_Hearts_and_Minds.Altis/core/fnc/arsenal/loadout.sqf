
/* ----------------------------------------------------------------------------
Function: btc_fnc_arsenal_loadout

Description:
    Generate a loadout from an array of defined loadout depending on trait, medical level, color and hour of the day.

Parameters:
    _type - Type of loadout: 0 - Rifleman, 1 - Medic Basic, 2 - Medic Adv, 3 - Repair, 4 - Engineer, 5 - Anti-Tank, 6 - Anti Air, 7 - Sniper, 8 - Machine gunner. [Number]
    _color - Color of skin loadout: 0 - Desert, 1 - Tropic, 2 - Black. [Number]
    _isDay - Select night (false) or day (true) loadout. [Boolean]
    _arsenal_loadout - Array of defined loadout. [Array]

Returns:
    Loadout array.

Examples:
    (begin example)
        _rifleman_loadout = [0] call btc_fnc_arsenal_loadout;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_type", 0, [0]],
    ["_color", [[0, 1] select (worldName in ["Tanoa", "chernarus", "lingor3", "sara"]), 2] select (sunOrMoon isEqualTo 0), [0]],
    ["_isDay", 0, [0, false]],
    ["_arsenal_loadout", btc_arsenal_loadout, [[]]]
];
(_arsenal_loadout apply {_x select _color}) params ["_uniform", "_vest", "_helmet", "_hood", "_laserdesignator", "_night_vision", "_weapon", "_weapon_sniper", "_weapon_machineGunner", "_bipod", "_pistol", "_launcher_AT", "_launcher_AA", "_backpack", "_backpack_big", "_radio"];

if (_isDay isEqualType 0) then {
    (date call BIS_fnc_sunriseSunsetTime) params ["_sunrise", "_sunset"];
    _isDay = (_sunrise < dayTime) && (_sunset > dayTime + 1);
};

//Item inside Uniform
private _cfgPatches = configFile >> "CfgPatches";
private _cargo_uniform = [["acc_flashlight", 1], ["ACE_EarPlugs", 1], ["ACE_CableTie",5], ["optic_ACO_grn_smg", 1], ["ACE_MapTools", 1], ["ACE_RangeTable_82mm", 1], ["ACE_morphine", 3], ["ACE_epinephrine", 3], ["ACE_fieldDressing", 3], [["", _radio] select (isClass(_cfgPatches >> "acre_main")), 1]];
_cargo_uniform append ([[["ACE_fieldDressing", 7]], [["ACE_packingBandage", 3], ["ACE_tourniquet", 4]]] select (ace_medical_level isEqualTo 2)) select 0;

//Choose appropriats weapon/optics depends on _type
private _array = switch (_type) do {
    case 7: {
        [_weapon_sniper, ["ACE_optic_Hamr_2D", "ACE_optic_LRPS_2D"]];
    };
    case 8: {
        [_weapon_machineGunner];
    };
    default {
        [_weapon];
    };
};
_array params ["_weapon", ["_optics", ["ACE_optic_Hamr_2D", "ACE_optic_Arco_2D"], [[]]]];
private _bipod_item = ["", _bipod] select (_type in [7, 8]);

//Generate magazines and boulets count
private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _launcher = ["", _launcher_AT] select (_type isEqualTo 5);
private _launcher = [_launcher, _launcher_AA] select (_type isEqualTo 6);
([_weapon, _pistol, _launcher] apply {getArray (_cfgWeapons >> _x >> "magazines")}) params ["_weaponMagazines", "_pistolMagazines", "_launcherMagazines"];
([_weaponMagazines, _pistolMagazines, _launcherMagazines] apply {_x select 0}) params ["_weaponMagazine", "_pistolMagazine", ["_launcherMagazine", ""]];
([_weaponMagazine, _pistolMagazine, _launcherMagazine] apply {getNumber (_cfgMagazines >> _x >> "count")}) params ["_weaponCount", "_pistolCount", "_launcherCount"];

//Backpack content
private _cargos = [
    [],
    [_backpack, [["ACE_fieldDressing", 25], ["ACE_morphine", 12], ["ACE_epinephrine", 12], ["ACE_bloodIV", 2], ["ACE_bloodIV_250", 2], ["ACE_bloodIV_500", 1], ["SmokeShellGreen", 3, 1], ["SmokeShellPurple", 1, 1]]],
    [_backpack, [["ACE_packingBandage", 15], ["ACE_elasticBandage", 10], ["ACE_morphine", 12], ["ACE_epinephrine", 12], ["ACE_salineIV_250", 2], ["ACE_salineIV", 2], ["ACE_fieldDressing", 2], ["ACE_personalAidKit", 2], ["ACE_salineIV_500", 3], ["ACE_quikclot", 10], ["ACE_surgicalKit", 1], ["SmokeShellGreen", 3, 1], ["SmokeShellPurple", 1, 1]]],
    [_backpack, [["ToolKit", 1], ["ACE_EntrenchingTool", 1]]],
    [_backpack, [["ACE_DefusalKit", 1], ["ACE_Clacker", 2], ["ACE_SpraypaintRed", 1], ["DemoCharge_Remote_Mag", 2, 1], [["ACE_VMM3", "", "", "", [], [], ""], 1], ["ACE_EntrenchingTool", 1]]],
    [_backpack, [[_launcherMagazines param [1, _launcherMagazine], 1, _launcherCount], [_launcherMagazine, 1, _launcherCount]]],
    [_backpack_big, [[_launcherMagazine, 2, _launcherCount]]],
    [_backpack, [["ACE_Sandbag_empty", 1], ["ACE_Kestrel4500", 1], ["ACE_ATragMX", 1], ["ACE_RangeCard", 1], ["ACE_EntrenchingTool", 1]]],
    []
];
private _binocular_array = [_laserdesignator, "", "", "", ["Laserbatteries", 1], [], ""];
private _launcher_array = [_launcher, "", "", "", [_launcherMagazine, _launcherCount], [], ""];
private _radio_item = [["ItemRadio", ""] select (isClass(_cfgPatches >> "acre_main")), _radio] select (isClass (_cfgPatches >> "task_force_radio"));

if (_isDay) then {
    [
        [_weapon, "", "", _optics select _isDay, [_weaponMagazine, _weaponCount], [], _bipod_item],
        _launcher_array,
        [_pistol, "", "", "", [_pistolMagazine, _pistolCount], [], ""],
        [_uniform, _cargo_uniform],
        [_vest, [["SmokeShellGreen", 2, 1], [_weaponMagazine, 7, _weaponCount], ["SmokeShellPurple", 2, 1], ["SmokeShellYellow", 1, 1], [_pistolMagazine, 1, _pistolCount], ["ACE_M84", 1, 1], ["HandGrenade", 3, 1]]],
        _cargos select _type, _helmet, _hood, _binocular_array,
        ["ItemMap", "B_UavTerminal", _radio_item, "ItemCompass", "ItemWatch", ""]
    ]
} else {
    [
        [_weapon, "muzzle_snds_65_TI_blk_F", "acc_pointer_IR", _optics select _isDay, [_weaponMagazines param [1, _weaponMagazine], _weaponCount], [], _bipod_item],
        _launcher_array,
        [_pistol, "", "", "", [_pistolMagazine, _pistolCount], [], ""],
        [_uniform, _cargo_uniform],
        [_vest, [["SmokeShellGreen", 1, 1], ["B_IR_Grenade", 2, 1], [_weaponMagazines param [1, _weaponMagazine], 7, _weaponCount], ["Chemlight_green", 2, 1], ["Chemlight_blue", 2, 1], ["ACE_HandFlare_Green", 1, 1], ["HandGrenade", 3, 1], ["ACE_M84", 1, 1]]],
        _cargos select _type, _helmet, _hood, _binocular_array,
        ["ItemMap", "B_UavTerminal", _radio_item, "ItemCompass", "ItemWatch", _night_vision]
    ]
};
