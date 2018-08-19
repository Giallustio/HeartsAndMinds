
private ["_players_close","_pos"];

_pos = _this select 0;

_players_close = allPlayers select {_pos distance _x < 100};
[20] remoteExec ["ace_hearing_fnc_earRinging", _players_close apply {owner _x}];