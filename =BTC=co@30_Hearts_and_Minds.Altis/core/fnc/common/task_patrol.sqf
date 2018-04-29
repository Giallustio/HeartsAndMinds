params ["_group", "_pos", "_max_area", "_behav", ["_allowwater", false]];

private _min_area = [100, 0] select (_max_area < 100);

_group setBehaviour _behav;
{_x setBehaviour _behav;} forEach units _group;
private _waypointspeed = ["LIMITED", "NORMAL"] select ((vehicle leader _group) isKindOf "Air");

private _prevPos = _pos;
for "_i" from 0 to (2 + (floor (random 3))) do {
    private _newPos = [_prevPos, _min_area, _max_area, 1, [0, 1] select _allowwater, 60 * (pi / 180), 0, []] call BIS_fnc_findSafePos;

    _prevPos = _newPos;
    if (_i isEqualTo 0) then {
        [_group, _newPos, 0, "MOVE", "SAFE", "RED", _waypointspeed, "STAG COLUMN", "", [5, 10, 20], 20] call CBA_fnc_addWaypoint;
    } else {
        [_group, _newPos, 0, "MOVE", "UNCHANGED", "RED", "UNCHANGED", "NO CHANGE", "", [5, 10, 20], 20] call CBA_fnc_addWaypoint;
    };
};

if (_allowwater) then {
    private _nearestLocation = nearestLocation [_pos, ""];
    [_group, locationPosition _nearestLocation, 0, "MOVE", "UNCHANGED", "RED", "UNCHANGED", "NO CHANGE", "", [20, 30, 60]] call CBA_fnc_addWaypoint;
};

[_group, _pos, 0, "CYCLE", "UNCHANGED", "NO CHANGE", "UNCHANGED", "NO CHANGE", "", [20, 30, 60], 20] call CBA_fnc_addWaypoint;
