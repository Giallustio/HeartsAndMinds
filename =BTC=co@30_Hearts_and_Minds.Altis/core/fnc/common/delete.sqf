
/* ----------------------------------------------------------------------------
Function: btc_fnc_delete

Description:
    Fill me when you edit me !

Parameters:
    _markers - []
    _objects - []
    _groups - []

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_delete;
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
