params ["_unit"];

_unit addEventHandler ["Killed", {_this call btc_fnc_mil_unit_killed}];

true
