
private ["_group","_pos","_max_area","_behav","_allowwater","_min_area","_waypointspeed"];

_group = _this select 0;
_pos = _this select 1;
_max_area = _this select 2;
if (_max_area < 100) then {_min_area = 0;} else {_min_area = 100;};
_behav = _this select 3;
if (count _this > 4) then {
	_allowwater = _this select 4;
} else {
	_allowwater = false;
};
_group setBehaviour _behav;
{_x setBehaviour _behav;} foreach units _group;
if ((vehicle leader _group) isKindOf "Air") then 	{
	_waypointspeed = "NORMAL";
} else {
	_waypointspeed = "LIMITED";
};

private _prevPos = _pos;
for "_i" from 0 to (2 + (floor (random 3))) do
{
	private _newPos = [_prevPos, _min_area, _max_area, 1, [0,1] select _allowwater, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;

	_prevPos = _newPos;

	private _wp = _group addWaypoint [_newPos, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointCompletionRadius 20;
	_wp setWaypointCombatMode "RED";
	_wp setWaypointTimeout [5, 10, 20];
	if (_i == 0) then
	{
		_wp setWaypointSpeed _waypointspeed;
		_wp setWaypointFormation "STAG COLUMN";
		_wp setWaypointCombatMode "RED";
		_wp setWaypointBehaviour "SAFE";
	};
};

private _wp = _group addWaypoint [_pos, 0];
_wp setWaypointType "CYCLE";
_wp setWaypointCompletionRadius 20;