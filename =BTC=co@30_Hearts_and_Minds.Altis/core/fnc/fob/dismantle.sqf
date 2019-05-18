
/* ----------------------------------------------------------------------------
Function: btc_fnc_fob_dismantle

Description:
    Fill me when you edit me !

Parameters:
    _flag - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_fob_dismantle;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_flag", objNull, [objNull]]
];

(format [localize "STR_BTC_HAM_O_FOB_DISMANTLE_H_PROC"]) call CBA_fnc_notify;
sleep 10;
_flag remoteExecCall ["btc_fnc_fob_dismantle_s", 2];
