
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_player

Description:
    Add event handler to player.

Parameters:
    _player - Player to add event. [Object]

Returns:
	_eventHandleID - ID of the WeaponAssembled event handle. [Number]

Examples:
    (begin example)
        _eventHandleID = [player] call btc_fnc_eh_player;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_player", objNull, [objNull]]
];

_player addEventHandler ["Respawn", format ["[%1] call btc_fnc_eh_player_respawn", getPosASL player]];
_player addEventHandler ["CuratorObjectPlaced", btc_fnc_eh_CuratorObjectPlaced];
["ace_treatmentSucceded", btc_fnc_eh_treatment] call CBA_fnc_addEventHandler;
_player addEventHandler ["WeaponAssembled", btc_fnc_civ_add_leaflets];
