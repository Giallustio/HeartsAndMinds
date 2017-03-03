
private _cargo = _this select 0;
private _chopper = _this select 1;

private _bbr_local = (boundingBoxReal _cargo) select 0;
private _support = "Box_East_Wps_F" createVehicle [0,0,0];
_support setDir getDir _cargo;
_support setPosASL getPosASL _cargo;
_cargo attachTo [_support,[0,0, -(_bbr_local select 2)]];

_chopper addEventHandler ["RopeBreak", {
	btc_lifted = false;
	{
	  detach _x;
	} forEach attachedObjects (_this select 2);
	deleteVehicle (_this select 2);
}];

_support