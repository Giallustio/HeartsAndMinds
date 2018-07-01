params ["_pos"];

player setPosASL _pos;
player addRating 9999;
player setCaptive false;

btc_rep_malus_player_respawn remoteExec ["btc_fnc_rep_change", 2];
