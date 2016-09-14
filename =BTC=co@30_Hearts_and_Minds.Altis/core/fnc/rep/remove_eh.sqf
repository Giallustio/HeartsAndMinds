
if (isNil {_this getVariable "btc_rep_eh_added"}) exitWith {true};

private ["_data"];

_data = _this getVariable "btc_rep_eh_added";

_this removeEventHandler ["HandleDamage", (_data select 0)];
_this removeEventHandler ["Killed", (_data select 1)];

//, [_id_d,_id_k]];

true