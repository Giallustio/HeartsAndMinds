[getMarkerPos "btc_base","h",20,30,240,0,[
['\A3\ui_f\data\igui\cfg\simpleTasks\types\run_ca.paa',[1,0.7,0.5,1], getPos btc_gear_object, 1.0, 1.0, 0, "Arsenal/FOB", 1],
['\A3\Ui_f\data\Logos\a_64_ca.paa',[1,0.7,0.5,1], [getPos btc_gear_object select 0,getPos btc_gear_object select 1,(getPos btc_gear_object select 2) + 2], 1.0, 1.0, 0, "", 1],
['\A3\ui_f\data\igui\cfg\simpleTasks\types\repair_ca.paa',[1,0.7,0.5,1], [getPos btc_create_object select 0,getPos btc_create_object select 1,(getPos btc_create_object select 2) + 3], 1.0, 1.0, 0, "", 1],
['\A3\ui_f\data\igui\cfg\simpleTasks\types\rearm_ca.paa',[1,0.7,0.5,1], getPos btc_create_object, 1.0, 1.0, 0, "Objects/Repair and ammo", 1]
],0] spawn BIS_fnc_establishingShot;

[] execVM "core\doc.sqf";

[] spawn {
	waitUntil {!isNull player};

	player addRating 9999;

	player addEventHandler ["Respawn", btc_fnc_eh_player_respawn];
	player addEventHandler ["CuratorObjectPlaced", btc_fnc_eh_CuratorObjectPlaced];
	["ace_treatmentSucceded", {
		if (isPlayer (_this select 1)) exitWith {};
		if ((Alive (_this select 1)) && (side (_this select 1) isEqualTo civilian) && !((_this select 3) isEqualTo "Diagnose")) then {
			_this remoteExec ["btc_fnc_rep_hh",2];
		};
	}] call CBA_fnc_addEventHandler;

	call btc_fnc_int_add_actions;

	//Side
	if (btc_side_assigned) then	{
		[] spawn {
			btc_int_ask_data = nil;

			[[5,nil,player],"btc_fnc_int_ask_var",false] spawn BIS_fnc_MP;

			waitUntil {!(isNil "btc_int_ask_data")};

			btc_int_ask_data spawn btc_fnc_task_create;
		};
	};

	{[_x] spawn btc_fnc_task_create} foreach [0,1];

	if (player getVariable ["interpreter", false]) then {player createDiarySubject ["Diary log","Diary log"];};

	removeAllWeapons player;
	btc_gear_object addAction ["<t color='#ff1111'>Arsenal</t>", "['Open',true] spawn BIS_fnc_arsenal;"];
};

if (btc_debug) then {
	onMapSingleClick "if (vehicle player == player) then {player setpos _pos} else {vehicle player setpos _pos}";
	player allowDamage false;

	waitUntil {!isNull (findDisplay 12)};
	_eh = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", btc_fnc_marker_debug];
	btc_marker_debug_cond = true;
	[_eh] spawn {
		while {btc_marker_debug_cond} do {
			player sideChat format ["UNITS:%1 - GROUPS:%2", count allunits, count allgroups];
			sleep 1;
		};
		((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ["Draw",_this select 0];
	};
};