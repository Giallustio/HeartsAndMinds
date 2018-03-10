if (isNil {_this getVariable "eh"}) exitWith {true};

private _ehs = _this getVariable "eh";
_this removeEventHandler ["HandleDamage", (_ehs select 0)];
_this removeEventHandler ["Fuel", (_ehs select 1)];
_this removeEventHandler ["GetOut", (_ehs select 2)];
_this removeEventHandler ["HandleDamage", (_ehs select 3)];
