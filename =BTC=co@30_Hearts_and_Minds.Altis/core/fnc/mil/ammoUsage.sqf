params [
    ["_typeof_unit", "", [""]],
    ["_aiAmmoUsageFlags", "256", [""]]
];

private _weapons = getArray (configFile >> "CfgVehicles" >> _typeof_unit >> "weapons");

private _weapons_ammoUsage = [_weapons, _aiAmmoUsageFlags] call btc_fnc_arsenal_ammoUsage;
if (btc_debug_log) then {
    [format ["%1 Weapons: %2 isAmmoUsage: %3", _typeof_unit, _weapons, _isAmmoUsage], __FILE__, [false]] call btc_fnc_debug_message;
};

!(_weapons_ammoUsage isEqualTo [])
