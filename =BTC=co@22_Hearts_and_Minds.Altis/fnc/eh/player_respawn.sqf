if (btc_p_revive != 0) then
{
	closeDialog 0;
	player call btc_fnc_rev_init_var;
	if (count btc_rev_gear > 0) then {[player,btc_rev_gear] spawn btc_fnc_rev_set_gear;}; 
};

player addRating 9999;
player setCaptive false;

[btc_rep_malus_player_respawn,"btc_fnc_rep_change",false] spawn BIS_fnc_MP;
