
//btc_info_intel_type = [80,95];//cache - hd - both

private ["_id","_n"];

_id = 1;
_n = random 100;

if (count btc_hideouts == 0) then {_n = (btc_info_intel_type select 0) - 10;};

switch (true) do {
    case (_n < (btc_info_intel_type select 0)) : {[true,0] spawn btc_fnc_info_cache;};//cache
    case (_n > (btc_info_intel_type select 1) && _n < 101) : {_id = 4;[true,0] spawn btc_fnc_info_cache;[true] spawn btc_fnc_info_hideout;};//both
    case (_n > (btc_info_intel_type select 0) && _n < (btc_info_intel_type select 1)) : {_id = 5;[true] spawn btc_fnc_info_hideout;};//hd
    default {_id = 0;[3] remoteExec ["btc_fnc_show_hint", (_this select 0)];};
};

if (_id == 0) exitWith {};
[_id] remoteExec ["btc_fnc_show_hint", 0];