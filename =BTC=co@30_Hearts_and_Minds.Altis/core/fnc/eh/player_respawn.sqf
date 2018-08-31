
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_player_respawn

Description:
    Fill me when you edit me !

Parameters:
    _pos - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_eh_player_respawn;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_pos", [0, 0, 0], [[]]]
];

player setPosASL _pos;
player addRating 9999;
player setCaptive false;

btc_rep_malus_player_respawn remoteExec ["btc_fnc_rep_change", 2];
