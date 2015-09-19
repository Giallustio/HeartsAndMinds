if (!Dialog) exitWith {};

_obj_type = lbData [991, lbCurSel 991];

_veh = btc_log_veh_selected;

closeDialog 0;

if (vehicle player != player && {_veh isKindOf "Air"}) then
{
	btc_int_action_result = nil;
	disableSerialization;
	createDialog "btc_dlg_progressBar";
	_ctrlProgressBar = uiNamespace getVariable "btc_dlg_ctrlProgressBar";
	_ctrlProgressBarTitle = uiNamespace getVariable "btc_dlg_title";
	_ctrlProgressBar ctrlSetPosition 
	[
		safezoneX + 0.1 * safezoneW,
		safezoneY + 0.1 * safezoneH,
		0.8 * safezoneW,
		0.01 * safezoneH
	];
	_ctrlProgressBar ctrlCommit (5 / accTime);
	_ctrlProgressBarTitle ctrlSetText format ["Unloading %1. . .",getText (configFile >> "cfgVehicles" >> _obj_type >> "displayName")];


	_time = time + 5;
	waitUntil 
	{
		!dialog || {!alive player} || {player getVariable ["btc_rev_isUnc",false]} || {time > _time}
	};

	closeDialog 0;

	if (time > _time) then {btc_int_action_result = true} else {btc_int_action_result = false};
} else {[5,format ["Unloading %1. . .",getText (configFile >> "cfgVehicles" >> _obj_type >> "displayName")],_veh] call btc_fnc_int_action_result;};

waitUntil {!(isNil "btc_int_action_result")};

if (btc_int_action_result) then
{
	[[_obj_type,_veh],"btc_fnc_log_server_unload",false] spawn BIS_fnc_MP;
	hint format ["%1 has been unloaded from %2",getText (configFile >> "cfgVehicles" >> _obj_type >> "displayName"),getText (configFile >> "cfgVehicles" >> typeOf _veh >> "displayName")];
} else {hint "Unloading aborted";};