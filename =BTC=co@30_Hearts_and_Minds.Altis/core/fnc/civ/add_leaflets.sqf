
params ["_player","_uav"];

if !(_uav isKindOf "UAV_06_base_F") exitWith {};

_uav addMagazine "1Rnd_Leaflets_West_F";
if !("Bomb_Leaflets" in (_uav weaponsTurret [-1])) then {
	_uav addWeapon "Bomb_Leaflets";
};
if (needReload _uav == 1) then {reload _uav};

_uav addEventHandler ["Fired", btc_fnc_eh_leaflets];