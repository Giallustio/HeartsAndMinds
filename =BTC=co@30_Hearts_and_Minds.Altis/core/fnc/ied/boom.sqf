
private ["_pos"];

if (btc_debug_log) then {diag_log format ["IED BOOM %1 - POS %2",_this,getPos _this]};
_pos = getPos _this;
deleteVehicle _this;
"Bo_GBU12_LGB_MI10" createVehicle _pos;
[_pos] call btc_fnc_deaf_earringing;