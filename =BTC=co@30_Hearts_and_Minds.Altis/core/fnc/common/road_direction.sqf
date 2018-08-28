params [
    ["_road", objNull, [objNull]]
];

private _roadConnectedTo = roadsConnectedTo _road;
if (_roadConnectedTo isEqualTo []) exitWith {0};
private _connectedRoad = _roadConnectedTo select 0;
private _direction = _road getDir _connectedRoad;

_direction
