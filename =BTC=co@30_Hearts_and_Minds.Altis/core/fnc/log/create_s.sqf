params ["_obj", ["_pos", getPosASL btc_create_object_point], ["_vector", vectorUp btc_create_object_point]];

if (getText (configFile >> "cfgVehicles" >> _obj >> "displayName") isEqualTo "") then {
    _obj = [btc_create_object_point, _obj] call ace_rearm_fnc_createDummy;
} else {
    _obj = _obj createVehicle [0, 0, 0];
};
_obj setVectorUp _vector;
_obj setPosASL _pos;

btc_log_obj_created pushBack _obj;
btc_curator addCuratorEditableObjects [[_obj], false];
