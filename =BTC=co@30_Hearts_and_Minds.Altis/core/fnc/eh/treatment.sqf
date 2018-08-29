
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_treatment

Description:
    Fill me when you edit me !

Parameters:
    _caller - [Object]
    _target - [Object]
    _selectionName - [String]
    _className - [String]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_eh_treatment;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_caller", objNull, [objNull]],
    ["_target", objNull, [objNull]],
    ["_selectionName", "", [""]],
    ["_className", "", [""]]
];

if (isPlayer _target) exitWith {};
if ((Alive _target) && (side _target isEqualTo civilian) && !(_className isEqualTo "Diagnose")) then {
    _this remoteExec ["btc_fnc_rep_hh", 2];
};
