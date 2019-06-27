
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_copy

Description:
    Fill me when you edit me !

Parameters:
    _create_object_point - [Object]
    _containers_mat - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_log_copy;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_create_object_point", objNull, [objNull]],
    ["_containers_mat", btc_containers_mat, [objNull]]
];

private _objects = nearestObjects [_create_object_point, _containers_mat, 3];

if (_objects isEqualTo []) exitWith {hint localize "STR_BTC_HAM_O_COPY_NOCONTAINER"}; //No container around!

btc_int_ask_data = nil;
[9, _objects select 0] remoteExecCall ["btc_fnc_int_ask_var", 2];
waitUntil {!(isNil "btc_int_ask_data")};

btc_copy_container = +btc_int_ask_data;

hint localize "STR_BTC_HAM_O_COPY_SUCCSESS"; //Container and cargo copied! Clear the area to paste.
