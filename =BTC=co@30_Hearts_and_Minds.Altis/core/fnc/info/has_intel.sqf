
private ["_body","_asker"];

_body = _this select 0;
_asker = _this select 1;

if (btc_debug_log) then	{diag_log format ["getVariable intel has_intel: %1",_body getVariable "intel"];};

if (_body getVariable ["intel",false] && !(_body getVariable ["btc_already_interrogated",false])) then {
	_body setVariable ["intel",false];
	if (isServer) then	{
		[_asker] spawn btc_fnc_info_give_intel;
	} else {
		[_asker] remoteExec ["btc_fnc_info_give_intel", 2];
	};
} else {
	[3] remoteExec ["btc_fnc_show_hint", _asker];
};