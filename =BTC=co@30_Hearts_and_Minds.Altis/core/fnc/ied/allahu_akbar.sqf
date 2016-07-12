
private ["_target","_suicider","_soundPath","_soundToPlay"];

_target = _this select 0;
_suicider = (nearestObjects [_target, btc_civ_type_units, 10]) select 0;

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + "core\sounds\allahu_akbar.ogg";
if (alive _suicider) then {
	playSound3d [_soundToPlay, _suicider, false, (getPos _suicider), 10, 1];
	sleep 1.4;
	{ detach _x; deleteVehicle _x;} forEach attachedObjects _suicider;
	"Bo_GBU12_LGB_MI10" createVehicle getPos _suicider;
	playSound3d["A3\Missions_F_EPA\data\sounds\combat_deafness.wss", _suicider, false, (getPos _suicider), 3, 1];
};