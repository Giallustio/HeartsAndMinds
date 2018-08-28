params [
    ["_civilian", objNull, [objNull]]
];

private _data = _civilian getVariable ["btc_rep_eh_added", []];

if (_data isEqualTo []) exitWith {true};

_civilian setVariable ["btc_rep_eh_added", []];

_civilian removeEventHandler ["HandleDamage", _data select 0];
_civilian removeEventHandler ["Killed", _data select 1];
_civilian removeEventHandler ["FiredNear", _data select 2];

true
