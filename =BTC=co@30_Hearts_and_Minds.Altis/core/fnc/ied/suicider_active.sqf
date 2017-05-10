
private ["_trigger","_array","_expl1","_expl2","_expl3"];

[_this] joinSilent createGroup [btc_enemy_side, true];

_this call btc_fnc_rep_remove_eh;

while {(count (waypoints group _this)) > 0} do { deleteWaypoint ((waypoints group _this) select 0); };

_trigger = createTrigger["EmptyDetector",getPos _this];
_trigger setTriggerArea[5,5,0,false];
_trigger setTriggerActivation[str(btc_player_side),"PRESENT",false];
_trigger setTriggerStatements["this", "thisTrigger call btc_fnc_ied_allahu_akbar;", ""];
_trigger setVariable ["suicider",_this];

_trigger attachTo [_this,[0,0,0]];

_array = getpos _this nearEntities ["SoldierWB", 30];

if (_array isEqualTo []) exitWith {};

_expl1 = "DemoCharge_Remote_Ammo" createVehicle (position _this);
_expl1 attachTo [_this, [-0.1,0.1,0.15],"Pelvis"];
_expl2 = "DemoCharge_Remote_Ammo" createVehicle (position _this);
_expl2 attachTo [_this, [0,0.15,0.15],"Pelvis"];
_expl3 = "DemoCharge_Remote_Ammo" createVehicle (position _this);
_expl3 attachTo [_this, [0.1,0.1,0.15],"Pelvis"];

[[_expl1,_expl2,_expl3], {
	(_this select 0) setVectorDirAndUp [[0.5,0.5,0],[-0.5,0.5,0]];
	(_this select 1) setVectorDirAndUp [[1,0,0],[0,1,0]];
	(_this select 2) setVectorDirAndUp [[0.5,-0.5,0],[0.5,0.5,0]];
}] remoteExec ["call", 0, false];

(group _this) setBehaviour "CARELESS";
(group _this) setSpeedMode "FULL";

if (btc_debug_log) then {diag_log format ["btc_fnc_ied_suicider_active: _this = %1; POS %2 START LOOP",_this,getpos _this];};

[{
	params ["_args", "_id"];
	_args params ["_suicider","_trigger"];

	if (Alive _suicider) then {
		private _array = _suicider nearEntities ["SoldierWB", 30];
		if !(_array isEqualTo []) then {
			_suicider doMove (position (_array select 0));//hint format ["MOVING %1",_man]; //_trigger setPos getPos _suicider;
		};
	} else {
		[_id] call CBA_fnc_removePerFrameHandler;
		deleteVehicle _trigger;
		group _suicider setVariable ["suicider",false];
		if (btc_debug_log) then {diag_log format ["btc_fnc_ied_suicider_active: _suicider = %1; POS %2 END LOOP",_suicider,getpos _suicider];};
	};
} , 0.5, [_this,_trigger]] call CBA_fnc_addPerFrameHandler;