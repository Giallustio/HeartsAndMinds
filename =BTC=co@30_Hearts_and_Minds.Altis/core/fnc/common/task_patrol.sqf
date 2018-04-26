params ["_group", "_pos", "_max_area", "_behav", ["_allowwater", false]];

private _min_area = [100, 0] select (_max_area < 100);

_group setBehaviour _behav;
{_x setBehaviour _behav;} forEach units _group;
private _waypointspeed = ["LIMITED", "NORMAL"] select ((vehicle leader _group) isKindOf "Air");

private _prevPos = _pos;
for "_i" from 0 to (2 + (floor (random 3))) do {
    private _newPos = [_prevPos, _min_area, _max_area, 1, [0, 1] select _allowwater, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;

    _prevPos = _newPos;

    private _wp = _group addWaypoint [_newPos, 0];
    _wp setWaypointType "MOVE";
    _wp setWaypointCompletionRadius 20;
    _wp setWaypointCombatMode "RED";
    _wp setWaypointTimeout [5, 10, 20];
    if (_i isEqualTo 0) then {
        _wp setWaypointSpeed _waypointspeed;
        _wp setWaypointFormation "STAG COLUMN";
        _wp setWaypointCombatMode "RED";
        _wp setWaypointBehaviour "SAFE";
    };
};

if (_allowwater) then {
    private _nearestLocation = nearestLocation [_pos, ""];
    private _wp = _group addWaypoint [locationPosition _nearestLocation, 0];
    _wp setWaypointType "MOVE";
    _wp setWaypointCompletionRadius 20;
    _wp setWaypointCombatMode "RED";
    _wp setWaypointTimeout [20, 30, 60];
};

private _wp = _group addWaypoint [_pos, 0];
_wp setWaypointType "CYCLE";
_wp setWaypointCompletionRadius 20;
