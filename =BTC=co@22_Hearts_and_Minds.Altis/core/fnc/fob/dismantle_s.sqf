private ["_FOBname","_element"];

_FOBname = _this getVariable "btc_fob";
_element = (btc_fobs select 0) find _FOBname;

deleteVehicle _this;
deleteVehicle ((btc_fobs select 1) deleteAt _element);

[btc_fob_mat,markerPos _FOBname] call btc_fnc_log_create_s;

deleteMarker ((btc_fobs select 0) deleteAt _element);