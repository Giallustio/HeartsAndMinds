
private ["_pos","_pos_ASL"];

if (btc_debug_log) then {diag_log format ["IED BOOM %1 - POS %2",_this,getPos (_this select 0)]};
_pos = getPos (_this select 1);
_pos_ASL = getPosASL (_this select 1);
deleteVehicle (_this select 1);
"Bo_GBU12_LGB_MI10" createVehicle _pos;
deleteVehicle (_this select 0);
playSound3d["A3\Missions_F_EPA\data\sounds\combat_deafness.wss", objNull, false, _pos_ASL, 1, 1];