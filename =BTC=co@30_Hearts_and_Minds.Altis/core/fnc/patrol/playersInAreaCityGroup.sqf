
/* ----------------------------------------------------------------------------
Function: btc_fnc_patrol_playersInAreaCityGroup

Description:
    Fill me when you edit me !

Parameters:
    _active_city - [Object]
    _group - [Group]
    _area - [Number]
    _players - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_patrol_playersInAreaCityGroup;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_active_city", objNull, [objNull]],
    ["_group", grpNull, [grpNull]],
    ["_area", btc_patrol_area, [0]],
    ["_players", [switchableUnits, playableUnits] select isMultiplayer, [[]]]
];

_players inAreaArray [getPosWorld _active_city, _area/2, _area/2] isEqualTo [] &&
{_players inAreaArray [getPosWorld leader _group, _area/2, _area/2] isEqualTo []}
