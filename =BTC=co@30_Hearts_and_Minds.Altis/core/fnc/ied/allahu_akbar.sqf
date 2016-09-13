
private ["_suicider","_soundPath","_soundToPlay"];

_suicider = _this getVariable "suicider";

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + "core\sounds\allahu_akbar.ogg";
if (Alive _suicider && [_suicider] call ace_common_fnc_isAwake) then {
	playSound3d [_soundToPlay, _suicider, false, getPosASL _suicider, 15, 1,100];
};
sleep 1.4;
if (Alive _suicider && [_suicider] call ace_common_fnc_isAwake) then {
	{deleteVehicle _x;} forEach attachedObjects _suicider;
	"Bo_GBU12_LGB_MI10" createVehicle getPos _suicider;
	playSound3d["A3\Missions_F_EPA\data\sounds\combat_deafness.wss", _suicider, false, (getPosASL _suicider), 5, 1, 100];
};