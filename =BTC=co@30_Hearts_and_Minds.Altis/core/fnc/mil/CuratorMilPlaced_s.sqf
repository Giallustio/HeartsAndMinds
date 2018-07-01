params ["_unit"];

_unit call btc_fnc_mil_unit_create;

if (btc_debug_log) then {
    [format ["%1", _unit], __FILE__, [false]] call btc_fnc_debug_message;
};
