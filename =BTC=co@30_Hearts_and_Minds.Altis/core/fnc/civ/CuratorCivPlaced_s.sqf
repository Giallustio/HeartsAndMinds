params [
    ["_unit", objNull, [objNull]]
];

_unit call btc_fnc_civ_unit_create;

if (btc_debug_log) then {
    [format [": %1", _unit], __FILE__, [false]] call btc_fnc_debug_message;
};
