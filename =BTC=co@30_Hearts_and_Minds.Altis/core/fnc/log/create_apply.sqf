
private ["_class"];

_class = lbData [72, lbCurSel 72];
closeDialog 0;
sleep 0.2;
[_class] remoteExec ["btc_fnc_log_create_s", 2];