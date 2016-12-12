
private ["_obj","_fall","_pos"];

_obj = _this select 0;
_pos = getPos _obj;
_fall = createVehicle ["Land_PenBlack_F", [_pos select 0, _pos select 1, (_pos select 2) + 0.7], [], 0, "FLY"];
_fall setPosASL getPosASL _obj;
_obj attachTo [_fall,[0,0,0]];

sleep 0.1;

waitUntil {(Velocity _fall select 2) isEqualTo 0};

detach _obj;
_obj setPosASL getPosASL _fall;
deleteVehicle _fall;