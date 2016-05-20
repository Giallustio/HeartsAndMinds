
private ["_group","_house","_wp"];

_group = _this select 0;
_house = _this select 1;

[_group,_house] call btc_fnc_house_addWP_loop;

_wp = _group addWaypoint [getPos _house, 0];
_wp setWaypointType "CYCLE";
_wp waypointAttachObject _house;
_wp setWaypointHousePosition 0;
_wp setWaypointCompletionRadius 0;
_wp setWaypointTimeout [15, 20, 30];