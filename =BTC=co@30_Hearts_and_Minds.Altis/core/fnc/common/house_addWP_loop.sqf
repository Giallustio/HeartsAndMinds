
private ["_group","_house","_wp","_allpositions"];

_group = _this select 0;
_house = _this select 1;

_allpositions = _house buildingPos -1;
if (btc_debug_log) then {diag_log format ["setWaypoint : count all pos %1 in %2 ", count _allpositions,_house];};
{
	_wp = _group addWaypoint [getPos _house, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointCompletionRadius 0;
	_wp waypointAttachObject _house;
	_wp setWaypointHousePosition _foreachindex;
	_wp setWaypointTimeout [15, 20, 30];
} forEach _allpositions;