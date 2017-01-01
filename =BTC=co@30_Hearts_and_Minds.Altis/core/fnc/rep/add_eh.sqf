if (!isNil {_this getVariable "btc_rep_eh_added"}) exitWith {true};

private ["_id_d","_id_k","_id_f"];

_id_d = _this addEventHandler ["HandleDamage", btc_fnc_rep_hd];
_id_k = _this addEventHandler ["Killed", btc_fnc_rep_killed];
_id_f = _this addEventHandler ["FiredNear",{

	_civ = _this select 0;

	//Remove the eventHandler to prevent spamming
	_civ removeEventHandler ["FiredNear", _thisEventHandler];

	if (!(side _civ isEqualTo civilian) || (_civ getVariable ["suicider",false])) exitWith {};

	switch (round(random 3)) do {
		case 0 : {_civ switchMove "ApanPercMstpSnonWnonDnon_G01";};
		case 1 : {_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";};
		case 2 : {_civ playMoveNow "ApanPpneMstpSnonWnonDnon_G01";};
		case 3 : {};
		default {_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";};
	};
}];

_this setVariable ["btc_rep_eh_added", [_id_d,_id_k,_id_f]];

true