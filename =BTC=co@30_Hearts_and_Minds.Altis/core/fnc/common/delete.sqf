
/* ----------------------------------------------------------------------------
Function: btc_fnc_common_delete

Description:
    Fill me when you edit me !

Parameters:
    _markers - []
    _objects - []
    _groups - []

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_common_delete;
    (end)

Author:
    Giallustio

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

{
    private _object = _x;
    [{
        params ["_args", "_id"];

        if (playableUnits inAreaArray [getPosWorld _args, 1000, 1000] isEqualTo []) then {
            [_id] call CBA_fnc_removePerFrameHandler;
            _args call CBA_fnc_deleteEntity;
        };
    }, 5, _object] call CBA_fnc_addPerFrameHandler;
} forEach _objects;

{
    private _group = _x;
    [{
        params ["_args", "_id"];

        if (playableUnits inAreaArray [getPosWorld leader _args, 1000, 1000] isEqualTo []) then {
            [_id] call CBA_fnc_removePerFrameHandler;
            _args call CBA_fnc_deleteEntity;
        };
    }, 5, _group] call CBA_fnc_addPerFrameHandler;
} forEach _groups;
