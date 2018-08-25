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
