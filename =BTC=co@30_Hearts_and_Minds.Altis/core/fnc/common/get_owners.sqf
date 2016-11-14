
private ["_units","_owners"];

_units = allunits select {Alive _x};
_units append entities "Car";
_owners = _units apply {owner _x};

[[_units,_owners], {btc_units_owners = _this}] remoteExec ["call", (_this select 0), false];