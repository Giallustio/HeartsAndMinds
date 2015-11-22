if (isNil {player getVariable "interpreter"}) exitWith {hint "I can't understand what is saying";};

private ["_man","_rep","_chance","_info","_info_type","_random"];

_man = _this select 0;

btc_int_ask_data = nil;
[[2,nil,player],"btc_fnc_int_ask_var",false] spawn BIS_fnc_MP;

waitUntil {!(isNil "btc_int_ask_data")};

_rep = btc_int_ask_data;

switch (true) do {
	case (_rep < 200) : {_info_type = "very low";};
	case (_rep >= 200 && _rep < 500) : {_info_type = "low";};
	case (_rep >= 500 && _rep < 750) : {_info_type = "normal";};
	case (_rep >= 750) : {_info_type = "high";};
};

_text = format ["Your reputation is %1", _info_type];
hint _text;