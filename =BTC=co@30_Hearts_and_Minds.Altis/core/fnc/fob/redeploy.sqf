
/* ----------------------------------------------------------------------------
Function: btc_fnc_fob_redeploy

Description:
    Show user interface of the map with FOB position.

Parameters:

Returns:

Examples:
    (begin example)
        [] spawn btc_fnc_fob_redeploy;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

btc_int_ask_data = nil;
["btc_fobs"] remoteExecCall ["btc_fnc_int_ask_var", 2];

waitUntil {!(isNil "btc_int_ask_data")};

private _fobs_marker = btc_int_ask_data select 0;
private _fobs_structure = btc_int_ask_data select 1;
if (_fobs_marker isEqualTo []) exitWith {
    hint localize "STR_BTC_HAM_O_FOB_REDEPLOY_H_NOFOB"; //"No FOBs deployed"
};

 private _respawn_positions = _fobs_structure apply {
    private _positions = _x buildingPos -1;
    selectRandom (_positions select {_x select 2 < 1});
};

private _missionsData = [];
{
    _missionsData pushBack [
        getMarkerPos _x,
        compile format ["player setPosATL %1", _respawn_positions select _forEachIndex],
        _x,
        format [localize "STR_BTC_HAM_O_FOB_REDEPLOY_H_MOVING", _x], //"Moving to %1"
        "",
        getText (configfile >> "CfgVehicles" >> typeOf (_fobs_structure select _forEachIndex) >> "editorPreview"),
        1,
        []
    ]
} forEach _fobs_marker;

disableserialization;
(date call BIS_fnc_sunriseSunsetTime) params ["_sunrise", "_sunset"];

private _parentDisplay = [] call bis_fnc_displayMission;
private _mapCenter = getMarkerPos btc_respawn_marker;
private _ORBAT  = [];
private _markers = [];
private _images = [];
private _overcast = overcast;
private _isNight = !((_sunrise < dayTime) && (_sunset > dayTime));
private _scale = 1;
private _simul = true;

{
    _x setMarkerAlphaLocal 0;
} forEach _fobs_marker;

private _display = [
    _parentDisplay,
    _mapCenter,
    _missionsData,
    _ORBAT,
    _markers,
    _images,
    _overcast,
    _isNight,
    _scale,
    _simul,
    localize "$STR_BTC_HAM_O_FOB_REDEPLOY_LABEL",
    true
] call btc_fnc_strategicMapOpen;

_display displayaddeventhandler [
    "unload",
    format [
        "
            {
                _x setMarkerAlphaLocal 1;
            } forEach %1;
        ",
        _fobs_marker
    ]
];
