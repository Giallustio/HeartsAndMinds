
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

hint format [localize "STR_BTC_HAM_O_FOB_DISMANTLE_H_PROC"]; //"Dismantle, move out ..."
sleep 10;
_flag remoteExec ["btc_fnc_fob_dismantle_s", 2];
