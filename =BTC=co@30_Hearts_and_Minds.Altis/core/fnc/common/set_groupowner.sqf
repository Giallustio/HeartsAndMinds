
private ["_HC","_group"];

//Choose a HC
_HC = owner ((entities "HeadlessClient_F") select 0);

//Transfert GROUP to HC
_group = _this select 0;
if !(_group setgroupOwner _HC) exitWith {};

//Transfert EH to HC
if (side _group isEqualTo btc_enemy_side) then {
	[_group,{
		{
			_x call btc_fnc_mil_add_eh;
		} foreach units _this;
	}] remoteExec ["call", _HC];
};