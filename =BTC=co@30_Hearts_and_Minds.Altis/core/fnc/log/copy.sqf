
params ["_create_object_point"];

private _objects = nearestObjects [_create_object_point, btc_containers_mat, 3];

if (_objects isEqualTo []) exitWith {hint "No container around!"};

btc_copy_container = [_objects select 0] call btc_fnc_db_saveObjectStatus;

hint "Container and cargo copied! Clear the area to paste.";