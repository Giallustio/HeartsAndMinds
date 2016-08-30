
while {btc_marker_debug_cond} do {

	if (!((entities "HeadlessClient_F") isEqualTo [])) then {
	 	[player] remoteExec ["btc_fnc_get_owners",2];
	 };

	systemChat format ["UNITS:%1 - GROUPS:%2", count allunits, count allgroups];
	sleep 1;
};
((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ["Draw",_this select 0];
