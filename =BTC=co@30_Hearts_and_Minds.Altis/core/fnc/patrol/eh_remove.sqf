
/* ----------------------------------------------------------------------------
Function: btc_fnc_patrol_eh_remove

Description:
    Remove events.

Parameters:
    _veh - Object with events.  [Object]

Returns:
	_bool - Events ID found. [Boolean]

Examples:
    (begin example)
        [cursorTarget] call btc_fnc_patrol_eh_remove;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_veh", objNull, [objNull]]
];

private _indexEH = _veh getVariable ["btc_eh", []];
if (_indexEH isEqualTo []) exitWith {false};

private _EH_name = ["Fuel", "HandleDamage", "GetOut", "HandleDamage"];
{
    _veh removeEventHandler [_EH_name select _forEachIndex, _x];
} forEach _indexEH;

true
