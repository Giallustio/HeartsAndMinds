
/* ----------------------------------------------------------------------------
Function: btc_fnc_rep_remove_eh

Description:
    Fill me when you edit me !

Parameters:
    _civilian - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_rep_remove_eh;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_civilian", objNull, [objNull]]
];

private _data = _civilian getVariable ["btc_rep_eh_added", []];

if (_data isEqualTo []) exitWith {true};

_civilian setVariable ["btc_rep_eh_added", []];

_civilian removeEventHandler ["HandleDamage", _data select 0];
_civilian removeEventHandler ["Killed", _data select 1];
_civilian removeEventHandler ["FiredNear", _data select 2];

true
