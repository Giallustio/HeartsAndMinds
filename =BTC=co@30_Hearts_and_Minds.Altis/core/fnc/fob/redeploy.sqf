
private ["_fobs","_idc","_fob","_marker","_pos","_text"];

btc_int_ask_data = nil;

[[6,nil,player],"btc_fnc_int_ask_var",false] spawn BIS_fnc_MP;

waitUntil {!(isNil "btc_int_ask_data")};

_fobs = +(btc_int_ask_data select 0);
if (count _fobs == 0) exitWith {hint "No FOBs deployed";};
_fobs pushBack btc_respawn_marker;

private _missionsData = _fobs apply {
	private _pos = getMarkerPos _x;
	[
		_pos,
		compile format ["player setPosATL [%1 select 0,%1 select 1,0.45]",		_pos],
		_x,
		"To " + _x,
		"",
		"",
		1,
		[]
	]
};

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

[
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
/*
_nul = [] spawn {
	waitUntil {!isNull (findDisplay 506)};

	_display = findDisplay 506;
	_background = _display displayCtrl 1000;

	_background ctrlSetBackgroundColor [1,1,1,1];
};
*/