call compile preprocessFile "core\fnc\city\init.sqf";

if (btc_db_load && {profileNamespace getVariable ["btc_hm_db",false]}) then {
	call compile preprocessFile "core\fnc\db\load.sqf";
};

for "_i" from 1 to btc_hideout_n do {[] call btc_fnc_mil_create_hideout;};
	
[] execVM "core\fnc\cache\init.sqf";
	
//[btc_helo_1,30,true] spawn btc_fnc_eh_veh_add_respawn;
[btc_helo_1,true,30] spawn btc_fnc_veh_track_marker;
	
[] spawn {{waitUntil {!isNull _x};_x addEventHandler ["Killed", btc_fnc_eh_veh_killed];} foreach [btc_veh_1,btc_veh_2,btc_veh_3,btc_veh_4,btc_veh_5,btc_veh_6,btc_veh_7,btc_veh_8,btc_veh_9,btc_veh_10,btc_veh_11,btc_veh_12,btc_veh_13,btc_veh_14];};