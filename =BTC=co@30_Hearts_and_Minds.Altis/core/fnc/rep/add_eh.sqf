if !((_this getVariable ["btc_rep_eh_added",[]]) isEqualTo []) exitWith {true};

private ["_id_d","_id_k","_id_f"];

_id_d = _this addEventHandler ["HandleDamage", btc_fnc_rep_hd];
_id_k = _this addEventHandler ["Killed", btc_fnc_rep_killed];
_id_f = _this addEventHandler ["FiredNear", btc_fnc_rep_firednear];

_this setVariable ["btc_rep_eh_added", [_id_d,_id_k,_id_f]];

true