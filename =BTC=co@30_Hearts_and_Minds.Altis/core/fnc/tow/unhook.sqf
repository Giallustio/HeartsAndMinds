
/* ----------------------------------------------------------------------------
Function: btc_fnc_tow_unhook

Description:
    Unhook the current tower/towed vehicle.

Parameters:
    _veh - Vehicle, could be the tower or the towed vehicle. [Object]

Returns:

Examples:
    (begin example)
        [cursorObject] spawn btc_fnc_tow_unhook;
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

if (isNull btc_int_ask_data) exitWith {(localize "STR_BTC_HAM_LOG_UNHOOK_NOROPE") call CBA_fnc_notify;};

private _ropes = ropes _veh;
if (_ropes isEqualTo []) then {
    _ropes = ropes btc_int_ask_data;
};

_ropes apply {ropeDestroy _x};
