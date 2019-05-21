
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_persistantOnLocalityChange

Description:
    Add event handler persistant on locality change which are only triggered where object is local.

Parameters:
    _object - Object where to add the event handler. [Object]
    _EH_name - Name of the event handler. [String]
    _EH_fnc - Name of the function executed when the EH is triggered. [Array]

Returns:
    _EH_IDs - Local EH ID and ID of the EH. [Array]

Examples:
    (begin example)
        [cursorObject, "Killed", "btc_fnc_mil_unit_killed"] call btc_fnc_eh_persistantOnLocalityChange;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_object", objNull, [objNull]],
    ["_EH_name", "", [""]],
    ["_EH_fnc", "", [""]]
];

private _EH_IDs = [
    [_object, "Local", {
        params ["_entity", "_isLocal"];

        if !(_isLocal) then {
            _thisArgs params [
                ["_EH_name", "", [""]],
                ["_EH_fnc", "", [""]]
            ];

            if !(isServer) then { // Keep EH on server in case owner drop connection
                [_entity, _EH_name, _EH_fnc, false] call btc_fnc_eh_removePersistantOnLocalityChange;
            } else {
                [_entity, _EH_name, _EH_fnc] remoteExecCall ["btc_fnc_eh_persistantOnLocalityChange", _entity];
            };
        };
    }, [_EH_name, _EH_fnc]] call CBA_fnc_addBISEventHandler
];

_EH_IDs pushBack (
    _object addEventHandler [_EH_name, missionNamespace getVariable [_EH_fnc, {}]]
);

if (btc_debug_log) then {
    [format ["%1: _EH_name = %2, _EH_fnc = %3, isRemoteExecuted = %4", _object, _EH_name, _EH_fnc, isRemoteExecuted], __FILE__, [false]] call btc_fnc_debug_message;
};

_object setVariable [
    _EH_fnc,
    _EH_IDs
];

_EH_IDs
