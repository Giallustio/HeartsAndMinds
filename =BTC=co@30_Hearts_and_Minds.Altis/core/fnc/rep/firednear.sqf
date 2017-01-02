
private ["_civ"];

_civ = _this select 0;

//Remove the eventHandler to prevent spamming
_civ removeEventHandler ["FiredNear", _thisEventHandler];

if (!(side _civ isEqualTo civilian) || (floor random 3 isEqualTo 1)) exitWith {};

[_civ, selectRandom ["ApanPknlMstpSnonWnonDnon_G01", "ApanPknlMstpSnonWnonDnon_G02", "ApanPknlMstpSnonWnonDnon_G03", "ApanPpneMstpSnonWnonDnon_G01", "ApanPpneMstpSnonWnonDnon_G02", "ApanPpneMstpSnonWnonDnon_G03"], 1] call ace_common_fnc_doAnimation;