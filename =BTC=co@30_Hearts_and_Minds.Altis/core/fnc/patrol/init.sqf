
/* ----------------------------------------------------------------------------
Function: btc_fnc_patrol_init

Description:
    Fill me when you edit me !

Parameters:
    _group - [Group]
    _cities - [Array]
    _area - [Number]
    _isBoat - [Boolean]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_patrol_init;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

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

private _end_city = selectRandom ([[_start_city, _active_city], _area, _isBoat] call btc_fnc_patrol_usefulCity);

private _pos = getPos _end_city;
if (_isBoat) then {
    ((selectBestPlaces [_pos, (_end_city getVariable ["RadiusX", 0]) + (_end_city getVariable ["RadiusY", 0]), "sea", 10, 1]) select 0 select 0) params ["_x", "_y"];
    _pos = [_x, _y, 0];
};

private _start_cityID = _start_city getVariable ["id", 0];
private _active_cityID = _active_city getVariable ["id", 0];
private _end_cityID = _end_city getVariable ["id", 0];
private _waypointStatements = format ["[group this, %1, %2, %3, %4] call btc_fnc_patrol_WPCheck;", _area, _pos, [_start_cityID, _active_cityID, _end_cityID], _isBoat];

[_group, _pos, _waypointStatements] call btc_fnc_patrol_addWP;

if (btc_debug_log) then {
    if (!isNil {_group getVariable "btc_patrol_id"}) then {
        [format ["ID: %1, End city ID: %2", _group getVariable ["btc_patrol_id", "Missing patrol ID"], _end_cityID], __FILE__, [false]] call btc_fnc_debug_message;
    };
};
