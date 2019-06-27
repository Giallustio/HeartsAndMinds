
/* ----------------------------------------------------------------------------
Function: btc_fnc_mil_ammoUsage

Description:
    Fill me when you edit me !

Parameters:
    _typeof_unit - [String]
    _itemType_ammo_usageAllowed - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_mil_ammoUsage;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_typeof_unit", "", [""]],
    ["_itemType_ammo_usageAllowed", ["MissileLauncher", "256", []], [[]]]
];

private _weapons = getArray (configFile >> "CfgVehicles" >> _typeof_unit >> "weapons");
private _weapons_ammoUsage = [_weapons, _itemType_ammo_usageAllowed] call btc_fnc_arsenal_ammoUsage;

if (btc_debug_log) then {
    [format ["%1 Weapons: %2 isAmmoUsage: %3", _typeof_unit, _weapons, _weapons_ammoUsage], __FILE__, [false]] call btc_fnc_debug_message;
};

!(_weapons_ammoUsage isEqualTo [])
