
/* ----------------------------------------------------------------------------
Function: btc_fnc_end_mission

Description:
    Message shown when the mission end.

Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_fnc_end_mission;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

hint localize "STR_BTC_HAM_O_ENDMISSION";

while {true} do {
    hintSilent localize "STR_BTC_HAM_O_ENDMISSION";
    sleep 1;
};
