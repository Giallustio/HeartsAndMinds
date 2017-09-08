params ["_uav"];

private _civilians = (allUnits select {side _x isEqualTo civilian}) select {_x distance _uav < 200};

{
	private _group = group _x;
	while {(count (waypoints _group)) > 0} do { deleteWaypoint ((waypoints _group) select 0); };

	private ["_wpa"];
	_wpa = _group addWaypoint [_uav, 0];
	_wpa setWaypointType "MOVE";
	_wpa setWaypointCombatMode "RED";
	_wpa setWaypointBehaviour "CARELESS";
	_group setSpeedMode "FULL";
} forEach _civilians;