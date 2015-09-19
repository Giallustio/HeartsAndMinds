_body = btc_int_target;

[btc_int_search_intel_time,"Searching for intel . . .",_body] call btc_fnc_int_action_result;

waitUntil {!(isNil "btc_int_action_result")};

if (btc_int_action_result) then
{
	[[_body,player],"btc_fnc_info_has_intel",_body] spawn BIS_fnc_MP;
};