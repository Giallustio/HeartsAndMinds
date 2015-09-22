enableSaving [false,false];
//Server
call compile preprocessFile "core\def\mission.sqf";
call compile preprocessFile "define_mod.sqf";
call compile preprocessFile "core\fnc\compile.sqf";

if (isServer) then {
	call compile preprocessFile "core\init_server.sqf";
};

call compile preprocessFile "core\init_common.sqf";

if (!isDedicated) then {
	call compile preprocessFile "core\init_player.sqf";
};

if (btc_debug) then {
	onMapSingleClick "if (vehicle player == player) then {player setpos _pos} else {vehicle player setpos _pos}";
	player allowDamage false;
	
	btc_marker_debug_cond = true;
	[] spawn btc_fnc_marker_debug;
};
