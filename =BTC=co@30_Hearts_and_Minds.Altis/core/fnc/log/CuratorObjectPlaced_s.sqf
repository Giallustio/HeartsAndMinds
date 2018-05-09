params ["_obj_created"];

btc_log_obj_created pushBack _obj_created;

if (btc_debug_log) then {
    [format ["btc_log_obj_created UPDATED by curator %1", _obj_created], __FILE__, [false]] call btc_fnc_debug_message;
};
