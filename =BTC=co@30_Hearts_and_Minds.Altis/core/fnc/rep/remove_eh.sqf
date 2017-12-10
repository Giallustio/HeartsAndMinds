
private _data = _this getVariable ["btc_rep_eh_added", []];

if (_data isEqualTo []) exitWith {true};

_this setVariable ["btc_rep_eh_added", []];

_this removeEventHandler ["HandleDamage", (_data select 0)];
_this removeEventHandler ["Killed", (_data select 1)];
_this removeEventHandler ["FiredNear", (_data select 2)];

true