
/* ----------------------------------------------------------------------------
Function: btc_fnc_common_road_direction

Description:
    Fill me when you edit me !

Parameters:
    _road - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_common_road_direction;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_road", objNull, [objNull]]
];

private _roadConnectedTo = roadsConnectedTo _road;
if (_roadConnectedTo isEqualTo []) exitWith {0};
private _connectedRoad = _roadConnectedTo select 0;
private _direction = _road getDir _connectedRoad;

_direction
