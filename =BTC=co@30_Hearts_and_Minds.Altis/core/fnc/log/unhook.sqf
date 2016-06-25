
private ["_veh","_towed","_pos"];

_veh = _this;

deTach _veh;

_pos = getpos _veh;
if ((_pos select 2) < -0.05) then {
	_veh setpos [_pos select 0, _pos select 1, 0];
};

btc_int_ask_data = nil;
[[4,_veh,player],"btc_fnc_int_ask_var",false] spawn BIS_fnc_MP;

waitUntil {!(isNil "btc_int_ask_data")};

if (isNull btc_int_ask_data) exitWith {hint "This vehicle is not attached to another!"};

_towed = btc_int_ask_data;

deTach _towed;

_pos = getpos _towed;
if ((_pos select 2) < -0.05) then {
	_towed setpos [_pos select 0, _pos select 1, 0];
} else {
	_towed setVelocity [0, 0, 0.01];
};

[[_towed,"tow",objNull],"btc_fnc_int_change_var",false] spawn BIS_fnc_MP;
[[_veh,"tow",objNull],"btc_fnc_int_change_var",false] spawn BIS_fnc_MP;