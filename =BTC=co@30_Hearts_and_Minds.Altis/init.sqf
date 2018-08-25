enableSaving [false, false];

if (hasInterface) then {btc_intro_done = [] spawn btc_fnc_intro;};

[] call compile preprocessFileLineNumbers "core\def\mission.sqf";
[] call compile preprocessFileLineNumbers "define_mod.sqf";

if (isServer) then {
    [] call compile preprocessFileLineNumbers "core\init_server.sqf";
};

[] call compile preprocessFileLineNumbers "core\init_common.sqf";

if (!isDedicated && hasInterface) then {
    [] call compile preprocessFileLineNumbers "core\init_player.sqf";
};

if (!isDedicated && !hasInterface) then {
    [] call compile preprocessFileLineNumbers "core\init_headless.sqf";
};
