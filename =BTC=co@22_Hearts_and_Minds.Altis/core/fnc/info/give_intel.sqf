


private ["_id","_n"];

_id = 1;
_n = random 100;
switch (true) do {
	case ((_n < (btc_info_intel_type select 0)) && !(isNull btc_cache_obj)) : {[true,0] spawn btc_fnc_info_cache;};//cache
	case ((_n > (btc_info_intel_type select 1) && _n < 101) && (!(count btc_hideouts == 0) && !(isNull btc_cache_obj))) : {_id = 4;[true,0] spawn btc_fnc_info_cache;[true] spawn btc_fnc_info_hideout;};//both
	case ((_n > (btc_info_intel_type select 0) && _n < (btc_info_intel_type select 1)) && !(count btc_hideouts == 0)) : {_id = 5;[true] spawn btc_fnc_info_hideout;};//hd
	default {_id = 0;[[3],"btc_fnc_show_hint",(_this select 0)] spawn BIS_fnc_MP;};
};

if (_id == 0) exitWith {};

[[_id],"btc_fnc_show_hint"] spawn BIS_fnc_MP;