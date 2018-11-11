
/* ----------------------------------------------------------------------------
Function: btc_fnc_house_addWP_loop

Description:
    Fill me when you edit me !

Parameters:
    _group - [Group]
    _house - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_house_addWP_loop;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_group", grpNull, [grpNull]],
    ["_house", objNull, [objNull]]
];

private _allpositions = (_house buildingPos -1) call BIS_fnc_arrayShuffle;

if (btc_debug_log) then {
    [format ["count all pos %1 in %2 ", count _allpositions, _house], __FILE__, [false]] call btc_fnc_debug_message;
};
{
    private _wp = [_group, _x, 0.2, "MOVE", "UNCHANGED", "NO CHANGE", "UNCHANGED", "NO CHANGE", "", [15, 20, 30]] call CBA_fnc_addWaypoint;
    _wp waypointAttachObject _house;
    _wp setWaypointHousePosition _forEachIndex;
} forEach _allpositions;

_allpositions
