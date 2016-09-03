
private ["_HC"];

_HC = owner ((entities "HeadlessClient_F") select 0);

(_this select 0) setgroupOwner _HC;

if (side (_this select 0) isEqualTo btc_enemy_side) then {
	[(_this select 0),{
	{
		_x addEventHandler ["Killed",{_this remoteExec ["btc_fnc_mil_unit_killed",2];}];
	} foreach units _this;
	}] remoteExec ["call", _HC];
};