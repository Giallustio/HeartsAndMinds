params ["_veh"];

if (_veh getVariable ["eh", []] isEqualTo []) exitWith {true};

private _ehs = _veh getVariable "eh";
_veh removeEventHandler ["HandleDamage", _ehs select 0];
_veh removeEventHandler ["Fuel", _ehs select 1];
_veh removeEventHandler ["GetOut", _ehs select 2];
_veh removeEventHandler ["HandleDamage", _ehs select 3];
