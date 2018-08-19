
private _FOBname = _this getVariable "btc_fob";
private _element = (btc_fobs select 0) find _FOBname;
private _pos = getPosASL _this;

deleteVehicle _this;
deleteVehicle ((btc_fobs select 1) deleteAt _element);

[btc_fob_mat,_pos] call btc_fnc_log_create_s;

deleteMarker ((btc_fobs select 0) deleteAt _element);