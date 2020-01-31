
/* ----------------------------------------------------------------------------
Function: btc_fnc_mil_unit_killed

Description:
    Fill me when you edit me !

Parameters:
    _unit - [Object]
    _killer - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_mil_unit_killed;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]],
    ["_killer", objNull, [objNull]]
];

private _killer = _unit getVariable ["ace_medical_lastDamageSource", _killer];

if (!isServer) exitWith {
    [_unit, _killer] remoteExecCall ["btc_fnc_mil_unit_killed", 2];
};

if (random 100 > btc_info_intel_chance) then {
    _unit setVariable ["intel", true];
};

if (isPlayer _killer) then {
    if (isServer) then {
        btc_rep_bonus_mil_killed call btc_fnc_rep_change;
    } else {
        btc_rep_bonus_mil_killed remoteExecCall ["btc_fnc_rep_change", 2];
    };
};

