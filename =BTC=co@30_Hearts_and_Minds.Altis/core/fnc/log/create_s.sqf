private ["_obj","_pos"];

if (count _this > 1) then {
	_pos = _this select 1;
} else {
	_pos = getpos btc_create_object_point;
};

_obj = (_this select 0) createVehicle [_pos select 0,_pos select 1,0];
btc_log_obj_created = btc_log_obj_created + [_obj];
btc_curator addCuratorEditableObjects [[_obj], false];