
params ["_player","_uav"];

[_uav, "1Rnd_Leaflets_West_F"] remoteExec ["addMagazine", _uav];
[_uav, "Bomb_Leaflets"] remoteExec ["addWeapon", _uav];

_uav addEventHandler ["Fired", btc_fnc_eh_scatter];