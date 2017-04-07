
if (isPlayer (_this select 1)) exitWith {};
if ((Alive (_this select 1)) && (side (_this select 1) isEqualTo civilian) && !((_this select 3) isEqualTo "Diagnose")) then {
	_this remoteExec ["btc_fnc_rep_hh",2];
};