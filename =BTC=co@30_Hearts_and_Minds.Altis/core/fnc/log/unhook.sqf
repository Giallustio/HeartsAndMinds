
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_unhook

Description:
    Fill me when you edit me !

Parameters:
    _veh - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_log_unhook;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_veh", objNull, [objNull]]
];

btc_int_ask_data = nil;
[4, _veh] remoteExecCall ["btc_fnc_int_ask_var", 2];

waitUntil {!(isNil "btc_int_ask_data")};

if (isNull btc_int_ask_data) exitWith {hint localize "STR_BTC_HAM_LOG_UNHOOK_NOROPE";}; //This vehicle is not attached to another!

deTach _veh;
_veh removeEventHandler ["RopeBreak", _veh getVariable ["btc_eh", -1]];
(ropes _veh) apply {ropeDestroy _x};

(getPos _veh) params ["_x", "_y", "_z"];
if (_z < -0.05) then {
    _veh setPos [_x, _y, 0];
};

private _towed = btc_int_ask_data;

deTach _towed;
_towed removeEventHandler ["RopeBreak", _towed getVariable ["btc_eh", -1]];
(ropes _towed) apply {ropeDestroy _x};

(getPos _towed) params ["_x", "_y", "_z"];
if (_z < -0.05) then {
    _towed setPosASL [_x, _y, ((getPosASL _veh) select 2) - _z];
} else {
    _towed setVelocity [0, 0, 0.01];
};

[_towed, ["tow", objNull]] remoteExec ["setVariable", 2];
[_veh, ["tow", objNull]] remoteExec ["setVariable", 2];
