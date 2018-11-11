
/* ----------------------------------------------------------------------------
Function: btc_fnc_civ_unit_create

Description:
    Initialize civilian by adding eventhandlers.

Parameters:
    _unit - Unit to initialize. [Object]

Returns:
	_isInitialized - Return true if is initialized. [Boolean]

Examples:
    (begin example)
        _isInitialized = [_unit] call btc_fnc_civ_unit_create;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]]
];

if (_unit getVariable ["btc_init", false]) exitWith {true};

_unit setVariable ["btc_init", true];

_unit call btc_fnc_rep_add_eh;

true
