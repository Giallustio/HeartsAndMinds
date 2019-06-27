
/* ----------------------------------------------------------------------------
Function: btc_fnc_delete

Description:
    Delete markers (and JIP data of marker) and objects or units in groups when there are far enough from players.

Parameters:
    _markers - Array of markers. [Array]
    _objects - Array of objects. [Array]
    _groups - Array of groups. [Array]

Returns:

Examples:
    (begin example)
        [[], [btc_helo_1]] call btc_fnc_delete;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_markers", [], [[""]]],
    ["_objects", [], [[objNull]]],
    ["_groups", [], [[grpNull]]]
];

{
    deleteMarker _x;
    //remove JIP remoteExec
    remoteExec ["", _x];
} forEach _markers;

[_objects + _groups] call btc_fnc_deleteEntities;
