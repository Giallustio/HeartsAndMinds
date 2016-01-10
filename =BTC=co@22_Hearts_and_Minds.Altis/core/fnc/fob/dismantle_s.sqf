private ["_flag","_pos","_FOBname"];

_flag = (_this select 0);
_FOBname = _this select 1;

_pos = getpos _flag;
deleteVehicle _flag;
hint str((nearestObjects [_pos, [btc_fob_structure], 10]));
deleteVehicle ((nearestObjects [_pos, [btc_fob_structure], 10]) select 0);

btc_fobs deleteAt (btc_fobs find _FOBname);
deleteMarker _FOBname;

[btc_fob_mat,_pos] call btc_fnc_log_create_s;