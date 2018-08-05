params [
    ["_obj", objNull, [objNull]],
    ["_pos", getPosASL btc_create_object_point, [[]]],
    ["_vector", vectorUp btc_create_object_point, [[]]]
];

if (getText (configFile >> "cfgVehicles" >> _obj >> "displayName") isEqualTo "") then {
    _obj = [btc_create_object_point, _obj] call ace_rearm_fnc_createDummy;
} else {
    _obj = _obj createVehicle [0, 0, 0];
};
_obj setVectorUp _vector;
_obj setPosASL _pos;

[_obj] call btc_fnc_log_init;
