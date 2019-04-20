
/* ----------------------------------------------------------------------------
Function: btc_fnc_info_cache

Description:
    Fill me when you edit me !

Parameters:
    _isReal - [Boolean]
    _showHint - [Number]

Returns:

Examples:
    (begin example)
        btc_cache_info = 100;
        [true, 1] call btc_fnc_info_cache;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_isReal", true, [true]],
    ["_showHint", 0, [0]]
];

if (isNull btc_cache_obj) exitWith {};

if (btc_cache_info < btc_info_cache_ratio) then {

    ([btc_cache_obj] call btc_fnc_cache_nearestTerrainObjects) params ["_building_with_the_cache", "_classnames"];
    _classname_object = tolower (selectRandom _classnames);

    if (btc_cache_pictures pushBackUnique _classname_object isEqualTo -1) exitWith {
        [btc_cache_pos, btc_info_cache_ratio, _isReal, _showHint] call btc_fnc_info_cacheMarker;
    };

    if (_showHint > 0) then {
        [
            [15, 14] select (_classname_object isEqualTo _building_with_the_cache),
            _classname_object
        ] remoteExecCall ["btc_fnc_show_hint", 0];
    };
    [
        _classname_object,
        btc_cache_n,
        _classname_object isEqualTo _building_with_the_cache
    ] remoteExecCall ["btc_fnc_info_cachePicture", [0, -2] select isDedicated, btc_cache_obj];
} else {
    btc_cache_info = [btc_cache_pos, btc_cache_info, _isReal, _showHint] call btc_fnc_info_cacheMarker;
};
