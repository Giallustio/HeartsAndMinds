
while {(count (waypoints group _this)) > 0} do { deleteWaypoint ((waypoints group _this) select 0); };

private _trigger = createTrigger ["EmptyDetector", getPos _this];
_trigger setTriggerArea [10, 10, 0, false, -60];
_trigger setTriggerActivation [str(btc_player_side), "PRESENT", false];
_trigger setTriggerStatements ["this", "systemChat str(thisTrigger); thisTrigger call btc_fnc_ied_fire;", ""];
_trigger setVariable ["btc_ied_drone", _this];

_trigger attachTo [vehicle _this,[0,0,0]];

private _array = getpos _this nearEntities ["SoldierWB", 200];

(group _this) setBehaviour "CARELESS";
(group _this) setSpeedMode "FULL";

if (btc_debug_log) then {diag_log format ["btc_fnc_ied_drone_active: _this = %1; POS %2 START LOOP",_this,getpos _this];};

[{
	params ["_args", "_id"];
	_args params ["_driver_drone","_trigger"];

	if (Alive _driver_drone) then {
		private _array = _driver_drone nearEntities ["SoldierWB", 200];
		if (btc_debug) then {hint str(getpos _trigger);};
		if !(_array isEqualTo []) then {
			_driver_drone doMove (position (_array select 0));
		};
	} else {
		[_id] call CBA_fnc_removePerFrameHandler;
		deleteVehicle _trigger;
		group _driver_drone setVariable ["btc_ied_drone",false];
		if (btc_debug_log) then {diag_log format ["btc_fnc_ied_drone_active: _driver_drone = %1; POS %2 END LOOP",_driver_drone,getpos _driver_drone];};
	};
} , 0.5, [_this,_trigger]] call CBA_fnc_addPerFrameHandler;