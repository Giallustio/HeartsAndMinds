
/* ----------------------------------------------------------------------------
Function: btc_fnc_info_path

Description:
    Show path of a patrol to set an amboush.

Parameters:
    _unit - Unit to show path. [Object]
    _endPos - End position of the group. [Array]
    _taskID - Unique ID for created markers. It is easy to get them later with: allMapMarkers select {(_x select [0, count _taskID]) isEqualTo _taskID}. [String]

Returns:
    _agent - An agent to add the "PathCalculated" event handler to. [Object]

Examples:
    (begin example)
        [group player, [0, 0, 0], "playerPath"] call btc_fnc_info_path;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]],
    ["_endPos", [0, 0, 0], [[]]],
    ["_taskID", "btc_side", [""]]
];

private _parent = [configFile >> "CfgVehicles" >> typeOf vehicle _unit, true] call BIS_fnc_returnParents;
private _type = (_parent arrayIntersect ["Man", "Car", "Tank", "Wheeled_APC", "Boat", "Plane", "Helicopter"]) select 0;
private _agent = calculatePath [_type, behaviour _unit, getPos _unit, _endPos];

[_agent, "PathCalculated", {
    params ["_agent", "_path"];
    _thisArgs params [
        ["_taskID", "btc_side", [""]]
    ];

    _agent removeEventHandler ["PathCalculated", _thisId];

    private _delta = 2;
    private _pathLength = count _path - _delta;
    {
        if (_delta < _forEachIndex && _forEachIndex < _pathLength) then {
            private _prevPosition = _path select (_forEachIndex - _delta);
            private _nextPosition = _path select (_forEachIndex + _delta);
            private _prevDirection = _prevPosition getDir _x;
            private _nextDirection = _x getDir _nextPosition;
            private _direction = acos ([sin _nextDirection, cos _nextDirection, 0] vectorCos [sin _prevDirection, cos _prevDirection, 0]);

            if (abs(_direction) > 32) then {
                [
                    [format ["%1_%2", _taskID, _forEachIndex - _delta], _prevPosition, _prevDirection],
                    [format ["%1_%2", _taskID, _forEachIndex + _delta], _nextPosition, _nextDirection]
                ] apply {
                    _x params ["_mkrName", "_p", "_d"];

                    private _mrk = _mkrName;
                    if !(_mkrName in allMapMarkers) then {
                        _mrk = createMarker [_mkrName, _p];
                        _mrk setMarkerType "hd_arrow";
                    };
                    if (isOnRoad _p) then {
                        _d = [roadAt _p] call btc_fnc_road_direction;
                    };
                    _mrk setMarkerDir _d;

                    if (btc_debug) then {
                        _mrk setMarkerText format ["%1°", floor _direction];
                    };
                };
            } else {
                if (btc_debug) then {
                    private _mrk = createMarker [format ["%1_debug_%2", _taskID, _forEachIndex], _x];
                    _mrk setMarkerType "mil_dot";
                    _mrk setMarkerAlpha 0.3;
                    _mrk setMarkerText format ["%1°", floor _direction];
                };
            };
        };
    } forEach _path;
}, [_taskID]] call CBA_fnc_addBISEventHandler;

_agent
