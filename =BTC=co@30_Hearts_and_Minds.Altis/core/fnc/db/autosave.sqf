
if (btc_p_auto_db > 0) then {
	// Save 5 minutes before, so it saves on time.
	[{[] spawn btc_fnc_db_save; call btc_fnc_db_autosave;}, [], btc_p_auto_db * 60 * 60 - 300] call CBA_fnc_waitAndExecute;
};