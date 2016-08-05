
waitUntil {!isNull player};

//[player, {btc_headless_array pushBack _this}] remoteExec ["call", 2];

[player, {(btc_patrol_active + btc_civ_veh_active) apply {_x setgroupOwner owner _this}}] remoteExec ["call", 2];