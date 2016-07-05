/*
	curator,object
*/

if !(((_this select 1) isKindOf "AllVehicles") || ((_this select 1) isKindOf "Module_F")) then {
	[(_this select 1)] remoteExec ["btc_fnc_log_CuratorObjectPlaced_s",2];

	if (btc_debug_log) then	{diag_log format ["CURATOR OBJECT %1",(_this select 1)];};
	if (btc_debug) then	{hint str(_this select 1);};
};

if ((_this select 1) isKindOf "Man") then {

	if (side (_this select 1) == btc_enemy_side) then	{
		[(_this select 1)] remoteExec ["btc_fnc_mil_CuratorMilPlaced_s",2];
	};

	if (side (_this select 1) == civilian) then	{
		[(_this select 1)] remoteExec ["btc_fnc_civ_CuratorCivPlaced_s",2];
	};

	if (btc_debug_log) then	{diag_log format ["CURATOR MAN %1",(_this select 1)];};
	if (btc_debug) then	{hint str (_this select 1);};
};