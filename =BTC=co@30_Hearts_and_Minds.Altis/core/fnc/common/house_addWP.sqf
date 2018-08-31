
/* ----------------------------------------------------------------------------
Function: btc_fnc_common_house_addWP

Description:
    Fill me when you edit me !

Parameters:
    _group - [Group]
    _house - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_common_house_addWP;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_group", grpNull, [grpNull]],
    ["_house", objNull, [objNull]]
];

private _allpositions = [_group, _house] call btc_fnc_house_addWP_loop;

private _wp = [_group, _allpositions select 0, 0.2, "CYCLE", "UNCHANGED", "NO CHANGE", "UNCHANGED", "NO CHANGE", "", [15, 20, 30]] call CBA_fnc_addWaypoint;
_wp waypointAttachObject _house;
_wp setWaypointHousePosition 0;
