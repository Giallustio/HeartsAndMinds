params ["_civilian"];

if !((_civilian getVariable ["btc_rep_eh_added", []]) isEqualTo []) exitWith {true};

private _id_d = _civilian addEventHandler ["HandleDamage", btc_fnc_rep_hd];
private _id_k = _civilian addEventHandler ["Killed", btc_fnc_rep_killed];
private _id_f = _civilian addEventHandler ["FiredNear", btc_fnc_rep_firednear];

_civilian setVariable ["btc_rep_eh_added", [_id_d, _id_k, _id_f]];

true
