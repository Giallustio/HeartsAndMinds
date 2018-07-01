btc_int_ask_data = nil;
["btc_fobs"] remoteExecCall ["btc_fnc_int_ask_var", 2];

waitUntil {!(isNil "btc_int_ask_data")};

_fobs = + btc_int_ask_data;
if ((_fobs select 0) isEqualTo []) exitWith {
    hint localize "STR_BTC_HAM_O_FOB_REDEPLOY_H_NOFOB"; //"No FOBs deployed"
};

private _respawn_position = [];
{
    private _positions = ((_fobs select 1) select _forEachIndex) buildingPos -1;
    _respawn_position pushBack selectRandom (_positions select [0, [count _positions, 4] select (count _positions >= 4)]);
} forEach (_fobs select 0);

private _missionsData = [];
{
    _missionsData pushBack [
        getMarkerPos _x,
        compile format ["player setPosATL %1", _respawn_position select _forEachIndex],
        _x,
        format [localize "STR_BTC_HAM_O_FOB_REDEPLOY_H_MOVING", _x], //"Moving to %1"
        "",
        "",
        1,
        []
    ]
} forEach (_fobs select 0);

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
} foreach (_fobs select 0);

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
    "Select a FOB to spawn",
    true
] call btc_fnc_strategicMapOpen;

_display displayaddeventhandler [
    "unload",
    format [
        "
            {
                _x setMarkerAlphaLocal 1;
            } foreach %1;
        ",
        _fobs select 0
    ]
];