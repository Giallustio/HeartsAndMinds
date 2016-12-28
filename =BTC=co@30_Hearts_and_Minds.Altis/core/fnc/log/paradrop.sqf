
private ["_veh","_dropped","_chute_type","_offset","_type_dropped","_chute","_smoke","_chem","_pos"];

_veh          = _this select 0;
_dropped      = _this select 1;
_chute_type   = _this select 2;

_type_dropped = typeOf _dropped;
_offset = [0,-(sizeOf typeOf _veh + sizeOf _type_dropped)/2,-5];

_dropped disableCollisionWith _veh;

_dropped setPos (_veh modelToWorld _offset);

sleep 0.1;

waitUntil {_dropped distance _veh > 50};

_dropped enableCollisionWith _veh;

_chute = createVehicle [_chute_type, [getPosATL _dropped select 0,getPosATL _dropped select 1,(getPosATL _dropped select 2) + 5], [], 0, "FLY"];
{_chute disableCollisionWith _x;} foreach [_veh,_dropped];

_chute setPosATL (getPosATL _dropped);
_smoke        = "SmokeshellGreen" createVehicle [0,0,0];
_chem         = "Chemlight_green" createVehicle [0,0,0];
_smoke attachto [_dropped,[0,0,0]];
_chem attachto [_dropped,[0,0,0]];
_dropped attachTo [_chute,[0,0,-0.6]];

waitUntil {sleep 1; (_chute isEqualTo objNull)};

_pos = getPos _dropped;

if !((_pos select 2) < 1) then {
	_chute = createVehicle [_chute_type, [getPosATL _dropped select 0,getPosATL _dropped select 1,(getPosATL _dropped select 2) + 5], [], 0, "FLY"];
	{_chute disableCollisionWith _x;} foreach [_veh,_dropped];

	_dropped attachTo [_chute,[0,0,0]];

	waitUntil {sleep 1; (_chute isEqualTo objNull)};
	_pos = getPos _dropped;
};

_dropped setPos [_pos select 0,_pos select 1,0];
detach _dropped;