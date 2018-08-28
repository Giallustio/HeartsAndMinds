params [
    ["_unit", objNull, [objNull]]
];

if (_unit getVariable ["btc_init", false]) exitWith {true};

_unit setVariable ["btc_init", true];

_unit call btc_fnc_mil_add_eh;

if (btc_p_set_skill) then {
    _unit call btc_fnc_mil_set_skill;
};

true
