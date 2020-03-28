
/* ----------------------------------------------------------------------------
Function: btc_fnc_fob_rallypointAssemble

Description:
    Handle assembling and disassembling of BI rallypoint.

Parameters:
    _nameEH - Name of the event. [String]
    _args - Arguments passed by the event. [Array]

Returns:

Examples:
    (begin example)
        ["WeaponAssembled", [player, cursorObject]] call btc_fnc_fob_rallypointAssemble;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_nameEH", "", [""]],
    ["_args", [], [[]]]
];

switch (_nameEH) do {
    case "WeaponAssembled": {
        _args params [
            ["_player", objNull, [objNull]],
            ["_rallyPoint", objNull, [objNull]]
        ];

        if !(_rallyPoint isKindOf "Camping_base_F") exitWith {_this};
        _rallyPoint remoteExecCall ["btc_fnc_fob_timer", 2];
    };
    case "WeaponDisassembled": {
        _args params [
            ["_player", objNull, [objNull]],
            ["_bag", objNull, [objNull]]
        ];

        if !("_Respawn_" in typeOf _bag) exitWith {_this};

        private _markers = ([btc_player_side, false] call BIS_fnc_getRespawnMarkers) - [btc_respawn_marker];
        private _playerPos = getPosWorld _player;
        _markers = _markers apply {[_playerPos distance markerPos _x, _x]};
        _markers sort true;
        deleteMarker (_markers select 0 select 1);
    };
    default {
    };
};
