
private ["_HC","_group"];

_HC = owner ((entities "HeadlessClient_F") select 0);
_group = _this select 0;

_group setgroupOwner _HC;

if (side _group isEqualTo btc_enemy_side) then {
	[_group,{
		{
			_x call btc_fnc_mil_add_eh;
		} foreach units _this;
	}] remoteExec ["call", _HC];
};