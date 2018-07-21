params [
    ["_active_city", objNull, [objNull]],
    ["_group", grpNull, [grpNull]],
    ["_area", btc_patrol_area, [0]],
    ["_players", [switchableUnits, playableUnits] select isMultiplayer, [[]]]
];

_players inAreaArray [getPosWorld _active_city, _area/2, _area/2] isEqualTo [] &&
{_players inAreaArray [getPosWorld leader _group, _area/2, _area/2] isEqualTo []}
