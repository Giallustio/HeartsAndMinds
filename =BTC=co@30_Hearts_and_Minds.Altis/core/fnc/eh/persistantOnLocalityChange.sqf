
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_persistantOnLocalityChange

Description:
    Add persistancy on locality change for event handler which are only triggered where object is local.

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
    ["_object", objNull, [objNull]]
    ["_EH_args", [], [[]]]
];


[
    _object addEventHandler _EH_args,

    [_object, "Local", {
        params ["_entity", "_isLocal"];
        _thisArgs params [
            ["_EH_args", [], [[]]]
        ];

        if !(_isLocal) then {
            [_entity, _EH_args] remoteExecCall ["addEventHandler", _entity];
        };
    }, _EH_args] call CBA_fnc_addBISEventHandler
]
