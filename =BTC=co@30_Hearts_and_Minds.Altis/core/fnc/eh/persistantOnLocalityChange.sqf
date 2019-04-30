
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_persistantOnLocalityChange

Description:
    Add event handler persistant on locality change which are only triggered where object is local.

Parameters:
    _object - . [Object]
    _EH_args - . [Array]

Returns:

Examples:
    (begin example)
        [] call btc_fnc_eh_persistantOnLocalityChange;
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

_object setVariable [
    _EH_fnc,
    _EH_IDs
];

_EH_IDs
