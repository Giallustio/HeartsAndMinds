
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
        _result = [] call btc_fnc_info_cache;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_isReal", true, [true]],
    ["_showHint", 0, [0]]
];

if (isNull btc_cache_obj) exitWith {};

private _pos = [btc_cache_pos, btc_cache_info] call CBA_fnc_randPos;

if !(_isReal) then {
    private _axis = getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize") / 2;
    _pos = [[_axis, _axis, 0], btc_cache_info + _axis] call CBA_fnc_randPos;
};

private _marker = createMarker [format ["%1", _pos], _pos];
_marker setMarkerType "hd_unknown";
_marker setMarkerText format ["%1m", btc_cache_info];
_marker setMarkerSize [0.5, 0.5];
_marker setMarkerColor "ColorRed";

if (_showHint > 0) then {[1] remoteExec ["btc_fnc_show_hint", 0];};

btc_cache_info = btc_cache_info - btc_info_cache_ratio;
if (btc_cache_info < btc_info_cache_ratio) then {btc_cache_info = btc_info_cache_ratio;};

btc_cache_markers pushBack _marker;
