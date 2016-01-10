private ["_pos","_obj"];

_pos = getpos _this;

deleteVehicle _this;
hint str((nearestObjects [_pos, [btc_fob_structure], 10]));
deleteVehicle ((nearestObjects [_pos, [btc_fob_structure], 10]) select 0);

[btc_fob_mat,_pos] call btc_fnc_log_create_s;