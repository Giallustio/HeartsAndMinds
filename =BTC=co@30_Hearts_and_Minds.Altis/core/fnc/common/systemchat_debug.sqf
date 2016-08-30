
private ["_units","_units_own"];

while {btc_marker_debug_cond} do {

	_units = count allunits;

	if (!((entities "HeadlessClient_F") isEqualTo [])) then {
		[player] remoteExec ["btc_fnc_get_owners",2];
		sleep 1;
		_units_own = ({_x isEqualTo 2} count (btc_units_owners select 1));
	} else {
		sleep 1;
		_units_own = _units;
	};

	systemChat format ["UNITS:%1 NOT-ON-SERVER:%2  - GROUPS:%3", _units, _units - _units_own, count allgroups];
};
((findDisplay 12) displayCtrl 51) ctrlRemoveEventHandler ["Draw",_this select 0];