params ["_veh"];

if (btc_debug_log) then {
    [format ["%1", _veh], __FILE__, [false]] call btc_fnc_debug_message;
};
if (btc_debug) then {
    deleteMarker format ["Patrol_fant_%1", (_veh getVariable ["crews", grpNull]) getVariable "btc_patrol_id"];
};

_veh call btc_fnc_mil_patrol_eh_remove;

[[], [_veh], [_veh getVariable ["crews", grpNull]]] call btc_fnc_delete;
