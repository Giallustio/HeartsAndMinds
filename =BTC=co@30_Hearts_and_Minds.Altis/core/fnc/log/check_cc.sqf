params ["_veh","_cargo"];

private _tot_rc = 0;
{
	_tot_rc = _tot_rc + ([_x] call btc_fnc_log_get_rc);
} forEach _cargo;
_tot_rc
