params [
    ["_weapons", [], [[]]],
    ["_aiAmmoUsageFlags", "256", [""]],
    ["_irLock", 1, [0]]
];

private _cfgWeapons = configFile >> "CfgWeapons";
private _cfgMagazines = configFile >> "CfgMagazines";
private _cfgAmmo = configFile >> "CfgAmmo";

_weapons select {
    private _weapon = _x;
    private _magazines = getArray (_cfgWeapons >> _weapon >> "magazines");

    private _aiAmmoUsage_irLock_magazines = _magazines apply {
        private _ammo = getText (_cfgMagazines >> _x >> "ammo");

        private _aiAmmoUsage = getText (_cfgAmmo >> _ammo >> "aiAmmoUsageFlags");
        if (_aiAmmoUsage isEqualTo "") then {
            _aiAmmoUsage = str getNumber (_cfgAmmo >> _ammo >> "aiAmmoUsageFlags");
        };
        private _ammo_irLock = getNumber (_cfgAmmo >> _ammo >> "irLock");

        [_aiAmmoUsage, _ammo_irLock];
    };

    if (btc_debug_log) then {
        if ("" in (_aiAmmoUsage_irLock_magazines apply {_x select 0})) then {
            [format ["Weapons: %1 AiAmmoUsage Magazines: %2", _weapon, _aiAmmoUsage_irLock_magazines], __FILE__, [false]] call btc_fnc_debug_message;
        };
    };

    _aiAmmoUsageFlags in (_aiAmmoUsage_irLock_magazines apply {_x select 0}) && selectMax (_aiAmmoUsage_irLock_magazines apply {_x select 1}) <= _irLock;
};
