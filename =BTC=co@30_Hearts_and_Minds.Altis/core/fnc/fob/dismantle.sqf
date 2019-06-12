
/* ----------------------------------------------------------------------------
Function: btc_fnc_fob_dismantle

Description:
    Show hint when player dismantle FOB.

Parameters:
    _flag - Flag of the FOB. [Object]

Returns:

Examples:
    (begin example)
        [cursorTarget] call btc_fnc_fob_dismantle;
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
