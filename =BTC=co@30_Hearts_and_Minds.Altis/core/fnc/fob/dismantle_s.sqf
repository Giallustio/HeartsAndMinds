
/* ----------------------------------------------------------------------------
Function: btc_fnc_fob_dismantle_s

Description:
    Fill me when you edit me !

Parameters:
    _flag - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_fob_dismantle_s;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_flag", objNull, [objNull]],
    ["_players", [], [[]]]
];

[18] remoteExecCall ["btc_fnc_show_hint", (allPlayers - entities "HeadlessClient_F") inAreaArray [getPosASL _flag, 10, 10]];

[{
	params ["_flag"];

	private _FOBname = _flag getVariable "btc_fob";
	private _element = (btc_fobs select 0) find _FOBname;
	private _pos = getPosASL _flag;

	deleteVehicle _flag;
	deleteVehicle ((btc_fobs select 1) deleteAt _element);

	[btc_fob_mat, _pos, surfaceNormal _pos] call btc_fnc_log_create_s;

	deleteMarker ((btc_fobs select 0) deleteAt _element);
}, [_flag], 10] call CBA_fnc_waitAndExecute;
