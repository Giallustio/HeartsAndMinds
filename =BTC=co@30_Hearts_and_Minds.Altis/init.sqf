enableSaving [false,false];
//Server
call compile preprocessFile "core\fnc\compile.sqf";
call compile preprocessFile "core\def\mission.sqf";
call compile preprocessFile "define_mod.sqf";

if (isServer) then {
	call compile preprocessFile "core\init_server.sqf";
};

call compile preprocessFile "core\init_common.sqf";

if (!isDedicated && hasInterface) then {
	call compile preprocessFile "core\init_player.sqf";
};

if (!isDedicated && !hasInterface) then {
	call compile preprocessFile "core\init_headless.sqf";
};