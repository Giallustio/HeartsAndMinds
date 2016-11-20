
private ["_units","_owners"];

_units = allunits select {Alive _x};
_units append entities "Car";
_units append entities "Tank";
_units append entities "Ship";
_units append entities "Air";
_owners = _units apply {[_x,owner _x]};

[_owners, {btc_units_owners = _this}] remoteExec ["call", (_this select 0), false];