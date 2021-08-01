
/* ----------------------------------------------------------------------------
Function: btc_body_fnc_bagRecover

Description:
    Add respawn tickets when a body bag is provided.

Parameters:
    _logistic - Logistic pad. [Object]

Returns:

Examples:
    (begin example)
        [cursorObject] call btc_body_fnc_bagRecover;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_logistic", objNull, [objNull]]
];

private _array = nearestObjects [_logistic, ["ACE_bodyBagObject"], 10];
if (_array isEqualTo []) exitWith {
    [
        ["No body bag around"],
        [format ["%1 respawn tickets left", [btc_player_side] call BIS_fnc_respawnTickets]]
    ] call CBA_fnc_notify;
};

[_array select 0] remoteExecCall ["btc_body_fnc_bagRecover_s", 2];
