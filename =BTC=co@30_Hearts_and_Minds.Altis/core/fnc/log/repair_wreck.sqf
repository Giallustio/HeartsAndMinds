
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_repair_wreck

Description:
    Fill me when you edit me !

Parameters:
    _object - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_log_repair_wreck;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_object", objNull, [objNull]]
];

private _array = (nearestObjects [_object, ["LandVehicle", "Air", "Ship"], 10]) select {!(
    _x isKindOf "ACE_friesBase" OR
    _x isKindOf "ace_fastroping_helper"
)};

if (_array isEqualTo []) exitWith {hint localize "STR_BTC_HAM_LOG_RWRECK_NOWRECK";}; //No wreck found

if (damage (_array select 0) != 1) exitWith {hint localize "STR_BTC_HAM_LOG_RWRECK_NOTWRECK"}; //It is not a wreck!

btc_int_ask_data = nil;
["btc_helo"] remoteExecCall ["btc_fnc_int_ask_var", 2];

waitUntil {!(isNil "btc_int_ask_data")};

private _helo = btc_int_ask_data;
if ((_array select 0) in _helo) exitWith {hint localize "STR_BTC_HAM_LOG_RWRECK_ISHELO"};

[_array select 0] remoteExec ["btc_fnc_log_server_repair_wreck", 2];
