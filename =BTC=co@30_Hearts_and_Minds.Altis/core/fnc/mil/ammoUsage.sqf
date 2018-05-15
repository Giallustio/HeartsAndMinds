params ["_typeof_unit", ["_aiAmmoUsageFlags", "256"]];

private _weapons = getArray(configFile >> "CfgVehicles" >> _typeof_unit >> "weapons");

private _isAmmoUsage = _weapons apply {
    private _weapon = _x;
    private _magazines = getArray(configFile >> "CfgWeapons" >> _weapon >> "magazines");
    private _ammo = "";
    if !(_magazines isEqualTo []) then {
        _ammo = getText(configFile >> "CfgMagazines" >> _magazines select 0 >> "ammo");
    };
    private _aiAmmoUsage = getText(configFile >> "CfgAmmo" >> _ammo >> "aiAmmoUsageFlags");
    if (_aiAmmoUsage isEqualTo "") then {
        _aiAmmoUsage = str getNumber(configFile >> "CfgAmmo" >> _ammo >> "aiAmmoUsageFlags");
    };
    _aiAmmoUsage isEqualTo _aiAmmoUsageFlags;
};
if (btc_debug_log) then {
    [format ["%1 Weapons: %2 isAmmoUsage: %3", _typeof_unit, _weapons, _isAmmoUsage], __FILE__, [false]] call btc_fnc_debug_message;
};

true in _isAmmoUsage;
