
/* ----------------------------------------------------------------------------
Function: btc_fnc_deaf_earringing

Description:
    Fill me when you edit me !

Parameters:
    _pos - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_deaf_earringing;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_pos", [0, 0, 0], [[]]]
];

private _players_close = allPlayers inAreaArray [_pos, 100, 100];
[20] remoteExec ["ace_hearing_fnc_earRinging", _players_close apply {owner _x}];
