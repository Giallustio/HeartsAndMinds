
/* ----------------------------------------------------------------------------
Function: btc_fob_fnc_recoverBodyBag

Description:
    Add respawn tickets when a body bag is provided.

Parameters:
    _object - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fob_fnc_recoverBodyBag;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_object", objNull, [objNull]]
];

private _array = nearestObjects [_object, ["ACE_bodyBagObject"], 10];
if (_array isEqualTo []) exitWith {
    [
        ["No body bag around"],
        [format ["%1 respawn tickets left", [btc_player_side] call BIS_fnc_respawnTickets]]
    ] call CBA_fnc_notify;
};

[btc_player_side, btc_fob_recoverBodyBag] call BIS_fnc_respawnTickets;
deleteVehicle (_array select 0);

[
    ["Respawn ticket added"],
    [format ["%1 respawn tickets left", [btc_player_side] call BIS_fnc_respawnTickets]]
] call CBA_fnc_notify;
