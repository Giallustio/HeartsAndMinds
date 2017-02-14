
private ["_pos"];

if (btc_debug_log) then {diag_log format ["IED BOOM %1 - POS %2",_this,getPos (_this select 0)]};
_pos = getPos (_this select 1);
deleteVehicle (_this select 1);
"Bo_GBU12_LGB_MI10" createVehicle _pos;
deleteVehicle (_this select 0);
[_pos] call btc_fnc_deaf_earringing;