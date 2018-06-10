params [
    ["_player", objNull, [objNull]],
    ["_custom_arsenal", btc_custom_arsenal, [[]]],
    ["_arsenalRestrict", btc_custom_arsenal, [0]],
];

([_player] call btc_fnc_arsenal_trait) params ["_type", "_ammo_usageAllowed"];

private _weapons = ("true" configClasses (configFile >> "CfgWeapons") select {
    getNumber (_x >> "scope") isEqualTo 2 AND
    {getNumber (_x >> 'type') in [1, 4]}
}) apply {configName _x};

private _allowedWeapons = [];
{

    _allowedWeapons append ([_weapons, _x] call btc_fnc_arsenal_ammoUsage);
} forEach _ammo_usageAllowed;

if (_arsenalRestrict isEqualTo 1) then {
    (_custom_arsenal select 0) append (_allowedWeapons);
} else {
    (_custom_arsenal select 0) append (_weapons - _allowedWeapons);
};

_allowedWeapons
