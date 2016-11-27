
//Move btc_patrol_active group to HC
{btc_patrol_active apply {[_x] call btc_fnc_set_groupowner;}} remoteExec ["call", 2];