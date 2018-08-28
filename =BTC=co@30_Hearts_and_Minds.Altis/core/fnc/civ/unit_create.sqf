params [
    ["_unit", objNull, [objNull]]
];

if (_unit getVariable ["btc_init", false]) exitWith {true};

_unit setVariable ["btc_init", true];

_unit call btc_fnc_rep_add_eh;

true
