
/* ----------------------------------------------------------------------------
Function: btc_fnc_civ_add_leaflets

Description:
    Fill me when you edit me !

Parameters:
    _player - [Object]
    _uav - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_civ_add_leaflets;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_player", objNull, [objNull]],
    ["_uav", objNull, [objNull]]
];

if !(_uav isKindOf "UAV_06_base_F") exitWith {};

_uav addMagazine "1Rnd_Leaflets_West_F";
if !("Bomb_Leaflets" in (_uav weaponsTurret [[0, -1] select (_uav isKindOf "UAV_06_base_F")])) then {
    _uav addWeapon "Bomb_Leaflets";
};
_uav selectWeaponTurret ["Bomb_Leaflets", [[0, -1] select (_uav isKindOf "UAV_06_base_F")]];
if (needReload _uav isEqualTo 1) then {reload _uav};

if ((_uav getVariable ["btc_leaflets_eh_added" , -1]) isEqualTo -1) then {
    private _id_f = _uav addEventHandler ["Fired", btc_fnc_eh_leaflets];
    _uav setVariable ["btc_leaflets_eh_added", _id_f];

    if (btc_debug) then {
        [format ["EventHandler ID: %1", _id_f], __FILE__, [btc_debug, false]] call btc_fnc_debug_message;
    };
};
