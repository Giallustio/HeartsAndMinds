params ["_veh"];

if (btc_debug_log) then {
    diag_log format ["EH TRAFFIC ID: %1 veh: %2 driver: %3 pos_veh: %4", (_veh getVariable ["driver", _veh]) getVariable "btc_traffic_id", _veh, _veh getVariable ["driver", _veh], getPos _veh];
};

_veh call btc_fnc_civ_traffic_eh_remove;
[[], [_veh], [_veh getVariable ["driver", grpNull]]] call btc_fnc_delete;
