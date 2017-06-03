
private _cargo = _this select 0;
private _chopper = _this select 1;

_cargo setVectorUp surfaceNormal position _cargo;
private _support1 = "Box_T_NATO_WpsSpecial_F" createVehicle [0,0,0];
private _pos = getPosATL _cargo;
_support1 setDir getDir _cargo;
_support1 setPosATL _pos;
_support1 setVectorUp surfaceNormal _pos;
_cargo attachTo [_support1, [0,0, -((_cargo worldToModel _pos) select 2)]];

_chopper addEventHandler ["RopeBreak", {
	(_this select 0) removeEventHandler ["RopeBreak", _thisEventHandler];
	btc_lifted = false;
	{
		detach _x;
		_x setVectorUp surfaceNormal position _x;
	} forEach attachedObjects (_this select 2);
	deleteVehicle (_this select 2);
}];

clearWeaponCargoGlobal _support1;
clearItemCargoGlobal _support1;
clearMagazineCargoGlobal _support1;
_support1 setObjectTextureGlobal [0, ""];
_support1 setObjectTextureGlobal [1, ""];

_support1