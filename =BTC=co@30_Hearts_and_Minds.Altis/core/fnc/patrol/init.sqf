params [
    ["_group", grpNull, [grpNull]],
    ["_cities", [], [[]]],
    ["_area", btc_patrol_area, [0]],
    ["_isBoat", false, [false]]
];
_cities params [
    ["_start_city", objNull, [objNull]],
    ["_active_city", objNull, [objNull]]
];

([[_start_city, _active_city], _area, _isBoat] call btc_fnc_patrol_usefulCity) params ["_end_city", "_pos"];

private _start_cityID = _start_city getVariable ["id", 0];
private _active_cityID = _active_city getVariable ["id", 0];
private _end_cityID = _end_city getVariable ["id", 0];
private _waypointStatements = format ["[group this, %1, %2, %3] call btc_fnc_patrol_WPCheck;", _area, [_start_cityID, _active_cityID, _end_cityID], _isBoat];

[_group, _pos, _waypointStatements] call btc_fnc_patrol_addWP;
