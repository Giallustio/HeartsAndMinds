params [
    ["_pos", [0, 0, 0], [[]]]
];

private _players_close = allPlayers inAreaArray [_pos, 100, 100];
[20] remoteExec ["ace_hearing_fnc_earRinging", _players_close apply {owner _x}];
