
params ["_player","_uav"];

private _isUAV6 = _uav isKindOf "UAV_06_base_F";

if !(_isUAV6 || _uav isKindOf "UAV_01_base_F") exitWith {};

private _turret = [0, -1] select (_isUAV6);

_uav addMagazine "1Rnd_Leaflets_West_F";
if !("Bomb_Leaflets" in (_uav weaponsTurret [_turret])) then {
    _uav addWeapon "Bomb_Leaflets";
};
_uav selectWeaponTurret ["Bomb_Leaflets", [_turret]];
if (needReload _uav == 1) then {reload _uav};

if ((_uav getVariable ["btc_leaflets_eh_added" , -1]) isEqualTo -1) then {
    private _id_f = _uav addEventHandler ["Fired", btc_fnc_eh_leaflets];
    _uav setVariable ["btc_leaflets_eh_added" , _id_f];

    if (btc_debug) then {
        systemChat format ["Add leaflets EventHandler ID: %1", _id_f];
    };
};
