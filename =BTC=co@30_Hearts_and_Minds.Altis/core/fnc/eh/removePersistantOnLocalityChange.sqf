
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_removePersistantOnLocalityChange

Description:
    Remove persistant event handler from client owner and server.

Parameters:
    _object - Object where to add the event handler. [Object]
    _EH_name - Name of the event handler. [String]
    _EH_fnc - Name of the function executed when the EH is triggered. [Array]
    _removeServerSide - Also remove the EH on the server. [Boolean]

Returns:
    _EH_IDs - Local EH ID and ID of the EH. [Array]

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

private _EH_IDs = _object getVariable ["_EH_fnc", []];
if (_EH_IDs isEqualTo []) exitWith {_EH_IDs};

_object removeEventHandler ["Local", _EH_IDs select 0];
_object removeEventHandler [_EH_name, _EH_IDs select 1];

if (btc_debug_log) then {
    [format ["%1: _EH_name = %2, _EH_fnc = %3, isRemoteExecuted = %4", _object, _EH_name, _EH_fnc, isRemoteExecuted], __FILE__, [false]] call btc_fnc_debug_message;
};

if (!isServer && _removeServerSide) then {
    [_object, _EH_name, _EH_fnc] remoteExecCall ["btc_fnc_eh_removePersistantOnLocalityChange", 2];
};

_object setVariable [
    _EH_fnc + _EH_name,
    nil
];

_EH_IDs
