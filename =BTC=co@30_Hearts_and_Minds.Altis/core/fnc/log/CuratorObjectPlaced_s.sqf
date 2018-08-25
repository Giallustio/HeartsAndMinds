params ["_obj_created"];

[_obj_created] call btc_fnc_log_init;

if (btc_debug_log) then {
    [format ["btc_log_obj_created UPDATED by curator %1", _obj_created], __FILE__, [false]] call btc_fnc_debug_message;
};
