
/* ----------------------------------------------------------------------------
Function: btc_fob_fnc_recoverBodyBag

Description:
    Add respawn tickets when a body bag is provided.

Parameters:
    _logistic - [Object]

Returns:

Examples:
    (begin example)
        [cursorObject] call btc_fob_fnc_recoverBodyBag;
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
        [format ["%1 respawn tickets left", ([btc_player_side] call BIS_fnc_respawnTickets) + btc_respawn_ticketDecimal]]
    ] call CBA_fnc_notify;
};

[_array select 0] remoteExecCall ["btc_fob_fnc_recoverBodyBag_s", 2];
