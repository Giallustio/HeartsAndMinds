params ["_veh", "_dropped", "_chute_type"];

private _type_dropped = typeOf _dropped;
private _offset = [0, -(sizeOf typeOf _veh + sizeOf _type_dropped)/2, -5];

_dropped disableCollisionWith _veh;
_dropped setPos (_veh modelToWorld _offset);

sleep 0.1;

waitUntil {_dropped distance _veh > 50};

_dropped enableCollisionWith _veh;

(getPosATL _dropped) params ["_x", "_y", "_z"];
private _chute = createVehicle [_chute_type, [_x, _y, _z + 5], [], 0, "FLY"];
{_chute disableCollisionWith _x;} forEach [_veh, _dropped];

_chute setPosATL getPosATL _dropped;
private _smoke = "SmokeshellGreen" createVehicle [0, 0, 0];
private _chem = "Chemlight_green" createVehicle [0, 0, 0];
_smoke attachto [_dropped, [0, 0, 0]];
_chem attachto [_dropped, [0, 0, 0]];
_dropped attachTo [_chute, [0, 0, -0.6]];

sleep 1;

if ((velocity _dropped select 2) > -2) then {
    detach _dropped;
    deleteVehicle _chute;
    (getPosATL _dropped) params ["_x", "_y", "_z"];
    _chute = createVehicle [_chute_type, [_x, _y, _z + 5], [], 0, "CAN_COLLIDE"];
    {_chute disableCollisionWith _x;} forEach [_veh, _dropped];

    _dropped attachTo [_chute, [0, 0, 0]];
};

private _pos = getPosASL _chute;
waitUntil {
    _pos = getPosASL _chute;
    sleep 1;
    (_chute isEqualTo objNull)
};
detach _dropped;
_dropped setPosASL _pos;
