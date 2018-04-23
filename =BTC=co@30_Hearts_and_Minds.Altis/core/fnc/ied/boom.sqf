params ["_wreck", "_ied"];

if (btc_debug_log) then {diag_log format ["IED BOOM %1 - POS %2", [_wreck, _ied], getPos _wreck]};

private _pos = getPos _ied;
deleteVehicle _ied;
"Bo_GBU12_LGB_MI10" createVehicle _pos;
deleteVehicle _wreck;

[_pos] call btc_fnc_deaf_earringing;
[_pos] remoteExec ["btc_fnc_ied_effects", [0, -2] select isDedicated];
