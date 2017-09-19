
params ["_uav","_weapon"];

if (_weapon isEqualTo "Bomb_Leaflets") then {
	[getPos _uav] call btc_fnc_civ_evacuate;
};