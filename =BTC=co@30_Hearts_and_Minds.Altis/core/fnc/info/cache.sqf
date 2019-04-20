
/* ----------------------------------------------------------------------------
Function: btc_fnc_info_cache

Description:
    Create cache intel players with marker or picture.

Parameters:
    _isReal - Return a real information. [Boolean]
    _showHint - Show hint about the intel. [Number]
    _cache_obj - Cache object. [Object]
    _cache_n - Cache numer. [Number]
    _cache_info - Last cache intel radius. [Number]
    _info_cache_ratio - Lower cache intel radius. [Number]

Returns:

Examples:
    (begin example)
        btc_cache_info = 100;
        [true, 1] call btc_fnc_info_cache;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

if (isNull btc_cache_obj) exitWith {};

params [
    ["_isReal", true, [true]],
    ["_showHint", 0, [0]],
    ["_cache_obj", btc_cache_obj, [objNull]],
    ["_cache_pos", btc_cache_pos, [[]]],
    ["_cache_n", btc_cache_n, [0]],
    ["_cache_info", btc_cache_info, [0]],
    ["_info_cache_ratio", btc_info_cache_ratio, [0]]
];

if (_cache_info < _info_cache_ratio) then {
    ([_cache_obj] call btc_fnc_cache_nearestTerrainObjects) params ["_building_with_the_cache", "_classnames"];
    private _classname_object = tolower (selectRandom _classnames);

    if ((btc_cache_pictures pushBackUnique _classname_object) isEqualTo -1) exitWith {
        [_cache_pos, _info_cache_ratio, _isReal, _showHint] call btc_fnc_info_cacheMarker;
    };
    if (_showHint > 0) then {
        [
            [15, 14] select (_classname_object isEqualTo _building_with_the_cache),
            _classname_object
        ] remoteExecCall ["btc_fnc_show_hint", 0];
    };
    [
        _classname_object,
        _cache_n,
        _classname_object isEqualTo _building_with_the_cache
    ] remoteExecCall ["btc_fnc_info_cachePicture", [0, -2] select isDedicated, _cache_obj];
} else {
    btc_cache_info = [_cache_pos, _cache_info, _isReal, _showHint] call btc_fnc_info_cacheMarker;
};
