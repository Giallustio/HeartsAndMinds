
private ["_civ","_gunner"];

_civ = _this select 0;
_gunner = _this select 7;

//Remove the eventHandler to prevent spamming
_civ removeEventHandler ["FiredNear", _thisEventHandler];

if (!(side _civ isEqualTo civilian) || (random 3 < 1)) exitWith {};

[_civ, selectRandom ["ApanPknlMstpSnonWnonDnon_G01", "ApanPknlMstpSnonWnonDnon_G02", "ApanPknlMstpSnonWnonDnon_G03", "ApanPpneMstpSnonWnonDnon_G01", "ApanPpneMstpSnonWnonDnon_G02", "ApanPpneMstpSnonWnonDnon_G03"], 1] call ace_common_fnc_doAnimation;

if (side _gunner isEqualTo btc_player_side) then {
	if ((_gunner findNearestEnemy getpos _civ) distance _civ > 300)  then {
		if (abs((_gunner getdir _civ) - getDir _gunner) < (300/(_this select 2))) then {
			btc_rep_malus_civ_firenear call btc_fnc_rep_change;
			[getpos _civ] call btc_fnc_rep_eh_effects;
			if (btc_debug_log) then {diag_log format ["REP Firenear = GREP %1 THIS = %2",btc_global_reputation,_this];};
		};
	};
};