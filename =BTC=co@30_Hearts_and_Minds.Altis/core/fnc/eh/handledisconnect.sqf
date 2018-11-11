
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_handledisconnect

Description:
    Fill me when you edit me !

Parameters:
    _headless - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_eh_handledisconnect;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_headless", objNull, [objNull]]
];

if (_headless in (entities "HeadlessClient_F")) then {
    //Remove HC player when disconnect
    deleteVehicle _headless;
};
