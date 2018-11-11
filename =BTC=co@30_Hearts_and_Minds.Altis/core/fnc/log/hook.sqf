
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_hook

Description:
    Fill me when you edit me !

Parameters:
    _towed - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_log_hook;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_towed", objNull, [objNull]]
];

btc_log_vehicle_selected = _towed;

private _string_array = "";
{
    _string_array = _string_array + ", " + _x;
} forEach (([_towed] call btc_fnc_log_get_nottowable) - ["Truck_F"]);

hint format [localize "STR_BTC_HAM_LOG_HOOK_HINFO", _string_array]; //Interact with a vehicle to tow it! (This vehicle can't tow %1)
