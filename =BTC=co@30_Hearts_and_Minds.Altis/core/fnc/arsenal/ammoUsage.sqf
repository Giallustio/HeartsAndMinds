params [
    ["_weapons", [], [[]]],
    ["_aiAmmoUsageFlags", "256", [""]]
];

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgAmmo = configFile >> "CfgAmmo";

_weapons select {
    private _weapon = _x;
    private _magazines = getArray (_cfgWeapons >> _weapon >> "magazines");
    private _ammo = "";

    if !(_magazines isEqualTo []) then {
        _ammo = getText (_cfgMagazines >> _magazines select 0 >> "ammo");
    };

    private _aiAmmoUsage = getText (_cfgAmmo >> _ammo >> "aiAmmoUsageFlags");
    if (_aiAmmoUsage isEqualTo "") then {
        _aiAmmoUsage = str getNumber (_cfgAmmo >> _ammo >> "aiAmmoUsageFlags");
    };

    if (btc_debug_log) then {
        if (_aiAmmoUsage isEqualTo "") then {
            [format ["Weapons: %1 isAmmoUsage: %2", _weapons, _aiAmmoUsage], __FILE__, [false]] call btc_fnc_debug_message;
        };
    };

    _aiAmmoUsage isEqualTo _aiAmmoUsageFlags;
};
