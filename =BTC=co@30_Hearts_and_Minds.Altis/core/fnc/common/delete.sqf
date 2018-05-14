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

        if ({_x distance _args < 1000} count playableUnits isEqualTo 0) then {
            [_id] call CBA_fnc_removePerFrameHandler;
            [_args] call CBA_fnc_deleteEntity;
        };
    }, 5, _object] call CBA_fnc_addPerFrameHandler;
} forEach _objects;

{
    private _group = _x;
    [{
        params ["_args", "_id"];

        if ({_x distance leader _args < 1000} count playableUnits isEqualTo 0) then {
            [_id] call CBA_fnc_removePerFrameHandler;
            [_args] call CBA_fnc_deleteEntity;
        };
    }, 5, _group] call CBA_fnc_addPerFrameHandler;
} forEach _groups;
