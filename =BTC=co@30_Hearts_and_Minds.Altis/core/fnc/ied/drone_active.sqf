
params ["_driver_drone"];

while {(count (waypoints group _driver_drone)) > 0} do { deleteWaypoint ((waypoints group _driver_drone) select 0); };

private _trigger = createTrigger ["EmptyDetector", getPos _driver_drone];
_trigger setTriggerArea [10, 10, 0, false, -60];
_trigger setTriggerActivation [str(btc_player_side), "PRESENT", true];
_trigger setTriggerStatements ["this", "[thisTrigger] call btc_fnc_ied_drone_fire;", ""];
_trigger setVariable ["btc_ied_drone", _driver_drone];

_trigger attachTo [vehicle _driver_drone,[0,0,0]];

if (btc_debug_log) then {diag_log format ["btc_fnc_ied_drone_active: _driver_drone = %1; POS %2 START LOOP",_driver_drone,getpos _driver_drone];};

(group _driver_drone) setBehaviour "CARELESS";
(group _driver_drone) setSpeedMode "LIMITED";

_trigger
