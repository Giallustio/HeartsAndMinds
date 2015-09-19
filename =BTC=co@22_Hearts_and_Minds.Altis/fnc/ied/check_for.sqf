
//ENGINEER CHECK

_ied = btc_int_target;

[btc_ied_check_time,"Checking for IED . . .",_ied] call btc_fnc_int_action_result;

waitUntil {!(isNil "btc_int_action_result")};

if (btc_int_action_result) then
{
	btc_int_ask_data = nil;
	[[0,_ied,player],"btc_fnc_int_ask_var",_ied,false] spawn BIS_fnc_MP;
	waitUntil {!(isNil "btc_int_ask_data")};
	
	if (btc_int_ask_data) then
	{
		_ied setVariable ["active",true];
		hint "This object is an IED";
	} else {hint "This object is not an IED";};
};