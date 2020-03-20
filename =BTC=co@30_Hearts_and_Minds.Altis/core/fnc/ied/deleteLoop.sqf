
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_deleteLoop

Description:
    Remove IED objects.

Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_fnc_ied_deleteLoop;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]],
    ["_role", "", [""]],
    ["_vehicle", objNull, [objNull]]
];

if !(_vehicle isKindOf "B_APC_Tracked_01_CRV_F") exitWith {};

if (btc_ied_deleteOn > -1) exitWith {};

btc_ied_deleteOn = [{
    params ["_arguments", "_idPFH"];
    _arguments params [
        ["_vehicle", objNull, [objNull]]
    ];

    private _ieds = allSimpleObjects [];
    _ieds = _ieds apply {[_x distance _vehicle, _x]};
    _ieds sort true;

    private _ied = _ieds select 0;
    if (_ied select 0 < 7 && {[getPos _vehicle, getDir _vehicle, 40, getPos (_ied select 1)] call BIS_fnc_inAngleSector}) then {
        (_ied select 1) call CBA_fnc_deleteEntity;
    };
}, 1, [_vehicle]] call CBA_fnc_addPerFrameHandler;
