
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_check

Description:
    Fill me when you edit me !

Parameters:
    _city - [Object]
    _ieds - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_ied_check;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_city", objNull, [objNull]],
    ["_ieds", [objNull], [[]]]
];

if (btc_debug) then {
    [format ["START CITY ID %1", _city getVariable "id"], __FILE__, [btc_debug, false]] call btc_fnc_debug_message;
};
if (btc_debug_log) then {
    [format ["START CITY ID %1", _city getVariable "id"], __FILE__, [false]] call btc_fnc_debug_message;
};

private _ieds_check = _ieds select {!((_x select 2) isEqualTo objNull)};

[_city, _ieds, _ieds_check] call btc_fnc_ied_checkLoop;
