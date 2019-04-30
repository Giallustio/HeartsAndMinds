
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_removePersistantOnLocalityChange

Description:
    Remove persistant event handler.

Parameters:
    _object - . [Object]
    _EH_args - . [Array]

Returns:
    _EH_IDs - . [Array]

Examples:
    (begin example)
        [cursorObject, "Killed", "btc_fnc_rep_killed"] call btc_fnc_eh_removePersistantOnLocalityChange;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_object", objNull, [objNull]],
    ["_EH_name", "", [""]],
    ["_EH_fnc", "", [""]],
    ["_removeServerSide", true, [true]]
];

private _EH_IDs = _object getVariable "_EH_fnc";

_object removeEventHandler ["Local", _EH_IDs select 0];
_object removeEventHandler [_EH_name, _EH_IDs select 1];

if (!isServer && _removeServerSide) then {
    [_object, _EH_name, _EH_fnc] remoteExecCall ["btc_fnc_eh_removePersistantOnLocalityChange", 2];
};

_object setVariable [
    _EH_fnc,
    nil
];

_EH_IDs
