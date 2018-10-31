
/* ----------------------------------------------------------------------------
Function: btc_fnc_patrol_WPCheck

Description:
    Fill me when you edit me !

Parameters:
    _group - [Group]
    _area - [Number]
    _last_wp_pos - [Array]
    _citiesID - [Array]
    _isBoat - [Boolean]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_patrol_WPCheck;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_group", grpNull, [grpNull]],
    ["_area", btc_patrol_area, [0]],
    ["_last_wp_pos", [0, 0, 0], [[]]],
    ["_citiesID", [], [[]]],
    ["_isBoat", false, [false]]
];
_citiesID params [
    ["_start_cityID", 0, [0]],
    ["_active_cityID", 0, [0]],
    ["_end_cityID", 0, [0]]
];

if (btc_debug) then {
    if (!isNil {_group getVariable "btc_patrol_id"}) then {
        deleteMarker format ["Patrol_fant_%1", _group getVariable ["btc_patrol_id", 0]];
    };
};

private _start_city = btc_city_all select _start_cityID;
private _active_city = btc_city_all select _active_cityID;
private _end_city = btc_city_all select _end_cityID;

//Remove if too far from player
if ([_active_city, _group, _area] call btc_fnc_patrol_playersInAreaCityGroup) exitWith {
    [_group] call btc_fnc_patrol_eh;
};

//Sometimes the waypoint is completed but too far due to obstacle (water for island etc)
if ((leader _group) distance _last_wp_pos > 100) then {
    if (btc_debug || btc_debug_log) then {
        [format ["Patrol ID: %1, %2 inaccessible (end city ID: %3)", _group getVariable ["btc_patrol_id", "Missing patrol ID"], _end_city getVariable ["name", "no name"], _end_city getVariable ["id", 0]], __FILE__, [btc_debug, btc_debug_log]] call btc_fnc_debug_message;
    };

    //Dynamically create a balcklist of cities inaccessible from the starting city
    private _cities_inaccessible = _start_city getVariable ["btc_cities_inaccessible", []];
    _cities_inaccessible pushBack _end_city;
    _start_city setVariable ["btc_cities_inaccessible", _cities_inaccessible];

    _end_city = _start_city;
};

[_group, [_end_city, _active_city], _area, _isBoat] call btc_fnc_patrol_init;
