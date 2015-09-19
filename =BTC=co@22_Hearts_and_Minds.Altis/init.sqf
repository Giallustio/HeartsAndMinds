enableSaving [false,false];
//Server
call compile preprocessFile "define.sqf";
call compile preprocessFile "define_mod.sqf";
call compile preprocessFile "fnc\compile.sqf";

if (isServer) then 
{
	
	call compile preprocessFile "fnc\city\init.sqf";
	for "_i" from 1 to btc_hideout_n do {[] call btc_fnc_mil_create_hideout;};
	
	[] execVM "fnc\cache\init.sqf";
	
	//[btc_helo_1,30,true] spawn btc_fnc_eh_veh_add_respawn;
	[btc_helo_1,true,30] spawn btc_fnc_marker;
	
	[] spawn {{waitUntil {!isNull _x};_x addEventHandler ["Killed", btc_fnc_eh_veh_killed];} foreach [btc_veh_1,btc_veh_2,btc_veh_3,btc_veh_4,btc_veh_5,btc_veh_6,btc_veh_7,btc_veh_8,btc_veh_9,btc_veh_10,btc_veh_11,btc_veh_12,btc_veh_13];};
	
};

if (!isDedicated) then 
{
	[] spawn
	{
		if (count (actionKeys "User1") == 0 || count (actionKeys "User2") == 0) then
		{
			while {count (actionKeys "User1") == 0 || count (actionKeys "User2") == 0} do
			{
				hint "SET YOUR USER ACTIONS!";
				sleep 5;
			};
			hintSilent "";
		};
	};

	[] execVM "doc.sqf";
	
	[] spawn 
	{
		waitUntil {!isNull player};
		
		player addRating 9999;
		
		player addEventHandler ["Respawn", btc_fnc_eh_player_respawn];
		
		//Deaf
		if (btc_p_deaf) then
		{
			player addEventHandler ["firedNear",btc_fnc_deaf_fired_near];
			[] spawn btc_fnc_deaf_loop;
		};
		//Int
		[] spawn {waitUntil {!isNull findDisplay 46};sleep 1;btc_int_display_EH = (findDisplay 46) displayAddEventHandler ["KeyDown","_key = _this spawn btc_fnc_int_key_pressed;"];};
		
		//Rev
		call compile preprocessFile "fnc\rev\init.sqf";
		
		//Side
		if (btc_side_assigned) then
		{
			[] spawn 
			{
				btc_int_ask_data = nil;
				
				[[5,nil,player],"btc_fnc_int_ask_var",false] spawn BIS_fnc_MP;

				waitUntil {!(isNil "btc_int_ask_data")};
				
				btc_int_ask_data spawn btc_fnc_task_create;
			};
		};
		
		{[_x] spawn btc_fnc_task_create} foreach [0,1];
		
		if (player getVariable ["interpreter", false]) then {player createDiarySubject ["Diary log","Diary log"];};
	};
};

if (btc_debug) then
{
	onMapSingleClick "if (vehicle player == player) then {player setpos _pos} else {vehicle player setpos _pos}";
	player allowDamage false;
	
	btc_marker_debug_cond = true;
	[] spawn btc_fnc_marker_debug;
};
