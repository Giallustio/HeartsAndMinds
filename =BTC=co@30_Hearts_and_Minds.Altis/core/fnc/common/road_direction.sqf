
private ["_road","_roadConnectedTo","_connectedRoad","_direction"];

_road = _this select 0;
_roadConnectedTo = roadsConnectedTo _road;
if (_roadConnectedTo isEqualTo []) exitWith {0};
_connectedRoad = _roadConnectedTo select 0;
_direction = _road getDir _connectedRoad;

_direction