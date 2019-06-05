
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

0 call btc_fnc_task_set_done;

hint localize "STR_BTC_HAM_O_COMMON_ENDMISSION"; //All the hideouts are destroyed, finally the Oplitas has been defeated! Mission accomplished
while {true} do {
    hintSilent localize "STR_BTC_HAM_O_COMMON_ENDMISSION";  //All the hideouts are destroyed, finally the Oplitas has been defeated! Mission accomplished
    sleep 1;
};
