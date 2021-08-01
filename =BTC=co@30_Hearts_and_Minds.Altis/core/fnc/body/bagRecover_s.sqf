
/* ----------------------------------------------------------------------------
Function: btc_body_fnc_bagRecover_s

Description:
    Add respawn tickets when a body bag is provided.

Parameters:
    _bodyBag - Body bag. [Object]

Returns:

Examples:
    (begin example)
        [cursorObject] call btc_body_fnc_bagRecover_s;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_bodyBag", objNull, [objNull]]
];

private _ticket = 0;
if (_bodyBag getVariable ["btc_isDeadPlayer", false]) then {
    _ticket = btc_body_bagTicketPlayer;
};

if (btc_p_respawn_ticketsShare) then {
    private _ticketValue = [btc_player_side, _ticket] call BIS_fnc_respawnTickets;
    [22, _ticketValue] remoteExecCall ["btc_fnc_show_hint", remoteExecutedOwner];
} else {
    private _uid = _bodyBag getVariable ["btc_UID", ""];
    private _player = _uid call BIS_fnc_getUnitByUID;
    if !(isNull _player) then {
        [_player, _ticket] call BIS_fnc_respawnTickets;
    };
    private _ticketValue = _ticket + (btc_respawn_tickets getOrDefault [_uid, 0]);
    btc_respawn_tickets set [_uid, _ticketValue];
};

deleteVehicle _bodyBag;
