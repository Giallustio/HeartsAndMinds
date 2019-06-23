
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_FOB_killed

Description:
    Delete FOB from the btc_fobs array and remove the flag.

Parameters:
    _struc - Object the event handler is assigned to. [Object]
    _killer - Object that killed the unit. Contains the unit itself in case of collisions. [Object]
    _instigator - Person who pulled the trigger. [Object]
    _useEffects - same as useEffects in setDamage alt syntax. [Boolean]
    _fobs - Array containing FOB data. [Array]

Returns:
    _fob_name - Name of the deleted FOB. [String]
    _fob_struc - FOB structure object. [Object]

Examples:
    (begin example)
        _result = [btc_fobs select 1 select 0] call btc_fnc_eh_FOB_killed;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_struc", objNull, [objNull]],
    ["_killer", objNull, [objNull]],
    ["_instigator", objNull, [objNull]],
    ["_useEffects", true, [true]],
    ["_fobs", btc_fobs, [[]]]
];

private _fob_index = (_fobs select 1) find _struc;

if (btc_debug || btc_debug_log) then {
    [format ["FOB killed named %1", (_fobs select 0) select _fob_index], __FILE__, [btc_debug, btc_debug_log]] call btc_fnc_debug_message;
};

deleteVehicle ((_fobs select 2) deleteAt _fob_index);
private _marker = ((_fobs select 0) deleteAt _fob_index);
private _FOB_name = markerText _marker;
deleteMarker _marker;

[_FOB_name, (_fobs select 1) deleteAt _fob_index]
