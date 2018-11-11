
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_server

Description:
    Fill me when you edit me !

Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_eh_server;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

addMissionEventHandler ["HandleDisconnect", btc_fnc_eh_handledisconnect];
addMissionEventHandler ["BuildingChanged", btc_fnc_eh_buildingchanged];
["ace_explosives_defuse", btc_fnc_eh_explosives_defuse] call CBA_fnc_addEventHandler;
