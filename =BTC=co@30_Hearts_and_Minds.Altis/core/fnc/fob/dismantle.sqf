params ["_flag"];

hint format [localize "STR_BTC_HAM_O_FOB_DISMANTLE_H_PROC"]; //"Dismantle, move out ..."
sleep 10;
_flag remoteExec ["btc_fnc_fob_dismantle_s", 2];
