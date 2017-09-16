params ["_uav","_weapon"];

if !(_weapon isEqualTo "Bomb_Leaflets") exitWith {};

private _civilians = (allUnits select {side _x isEqualTo civilian}) select {_x distance _uav < 200};
private _position = getPos _uav;

_safe = nearestTerrainObjects [_position, ["CHURCH","CHAPEL"], 400];
if (_safe isEqualTo []) then {
	_position = [_position, 0, 500, 30, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
} else {
	_position = getPos (_safe select 0);
};

{
	private _group = group _x;
	while {(count (waypoints _group)) > 0} do { deleteWaypoint ((waypoints _group) select 0); };

	[_group, _position, 20] spawn btc_fnc_civ_addWP;
	/*private _pos = [_position, 20] call btc_fnc_randomize_pos;

	private _wpa = _group addWaypoint [_pos, 5];
	_wp setWaypointType "MOVE";
	_wp setWaypointCompletionRadius 0;
	_wp setWaypointSpeed "LIMITED";
	_wp setWaypointBehaviour "SAFE";
	//_group setSpeedMode "FULL";

	_wpa = _group addWaypoint [_pos, 5];
	_wpa setWaypointType "CYCLE";*/

} forEach _civilians;