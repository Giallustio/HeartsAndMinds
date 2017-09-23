
params ["_uav","_weapon"];

if (_weapon isEqualTo "Bomb_Leaflets") then {
	[getPos _uav] remoteExec ["btc_fnc_civ_evacuate", 2];
};