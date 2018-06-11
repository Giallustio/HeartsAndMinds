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

    private _aiAmmoUsage_magazines = _magazines apply {
        private _ammo = getText (_cfgMagazines >> _x >> "ammo");

        private _aiAmmoUsage = getText (_cfgAmmo >> _ammo >> "aiAmmoUsageFlags");
        if (_aiAmmoUsage isEqualTo "") then {
            _aiAmmoUsage = str getNumber (_cfgAmmo >> _ammo >> "aiAmmoUsageFlags");
        };

        _aiAmmoUsage;
    };

    if (btc_debug_log) then {
        if ("" in _aiAmmoUsage_magazines) then {
            [format ["Weapons: %1 AiAmmoUsage Magazines: %2", _weapons, _aiAmmoUsage_magazines], __FILE__, [false]] call btc_fnc_debug_message;
        };
    };

    _aiAmmoUsageFlags in _aiAmmoUsage_magazines;
};
