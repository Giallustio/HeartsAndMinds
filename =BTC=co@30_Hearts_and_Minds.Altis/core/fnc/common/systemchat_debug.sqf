
private ["_count_units","_count_units_own"];

while {btc_marker_debug_cond} do {

	_count_units = count (allunits select {Alive _x});

	if (!((entities "HeadlessClient_F") isEqualTo [])) then {
		[player] remoteExec ["btc_fnc_get_owners",2];
		sleep 1;
		_count_units_own = {((_x select 1) isEqualTo 2) && ((_x select 0) isKindOf "man")} count btc_units_owners;
	} else {
		sleep 1;
		_count_units_own = _count_units;
	};

	systemChat format ["UNITS:%1 NOT-ON-SERVER:%2  | GROUPS:%3", _count_units, _count_units - _count_units_own, count allgroups];
};
((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ["Draw",_this select 0];