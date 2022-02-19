
/* ----------------------------------------------------------------------------
Function: btc_log_fnc_rearmSource

Description:
    Rearm a rearm source.

Parameters:
    _object - Rearm truck. [Object]

Returns:

Examples:
    (begin example)
        [] call btc_log_fnc_rearmSource;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_object", objNull, [objNull]]
];

private _array = (nearestObjects [_object, ["LandVehicle", "Air", "Ship", "Thing"], 10]) select {!(
    _x isKindOf "ACE_friesBase" OR
    _x isKindOf "ace_fastroping_helper"
)};

private _failNotify = [
    [localize "STR_ACE_Refuel_Failed"],
    ["<img size='1' image='\A3\ui_f\data\igui\cfg\simpleTasks\types\rearm_ca.paa' align='center'/>"]
];
if (_array isEqualTo []) exitWith {_failNotify call CBA_fnc_notify;};

private _rearmSource = _array select 0;
private _default_rearmCargo = getNumber (configOf _rearmSource >> "ace_rearm_defaultSupply");

if (_default_rearmCargo <= 0) exitWith {_failNotify call CBA_fnc_notify;};

[_rearmSource, _default_rearmCargo] call ace_rearm_fnc_makeSource;
(localize "STR_ACE_Refuel_Hint_Completed") call CBA_fnc_notify;
