closeDialog 0;

_veh = _this;

deTach _veh;

btc_int_ask_data = nil;
[[4,btc_int_target,player],"btc_fnc_int_ask_var",false] spawn BIS_fnc_MP;

waitUntil {!(isNil "btc_int_ask_data")};

_towed = btc_int_ask_data;

deTach _towed;
_towed setVelocity [0, 0, 0.01];

[[_towed,"tow",objNull],"btc_fnc_int_change_var",false] spawn BIS_fnc_MP;
[[_veh,"tow",objNull],"btc_fnc_int_change_var",false] spawn BIS_fnc_MP;