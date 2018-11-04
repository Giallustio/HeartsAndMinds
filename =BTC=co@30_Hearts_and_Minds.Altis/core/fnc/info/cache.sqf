
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

if (btc_cache_info < btc_info_cache_ratio) then {
    btc_cache_info = btc_info_cache_ratio;

    private _building_cache = typeOf nearestBuilding btc_cache_obj;
    private _classnames = (nearestTerrainObjects [btc_cache_obj, [], 5, false]) apply {
        private _model = (getModelInfo _x) select 0;
        format ["Land_%1", _model select [0, _model find ".p3d"]]
    };
    _classnames select {isText (configfile >> "CfgVehicles" >> _x >> "editorPreview")};
    _classname_object = selectRandom _classnames;

    btc_cache_DiaryRecord = [
        "Cache building picture",
        ["Is around the cache.", "We got a picture of the building where the cache is."] select (_building_cache isEqualTo _classname_object),
        getText (configfile >> "CfgVehicles" >> _classname_object >> "editorPreview"), nil, name player
    ];
    ["btc_cache_DiaryRecord", "diary"] spawn BIS_fnc_initIntelObject;
} else {
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

    btc_cache_markers pushBack _marker;

    if (_showHint > 0) then {[1] remoteExec ["btc_fnc_show_hint", 0];};
};

btc_cache_info = btc_cache_info - btc_info_cache_ratio;
