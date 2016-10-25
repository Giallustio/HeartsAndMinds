
private ["_fobs","_idc","_fob","_marker","_pos","_text"];

btc_int_ask_data = nil;

[[6,nil,player],"btc_fnc_int_ask_var",false] spawn BIS_fnc_MP;

waitUntil {!(isNil "btc_int_ask_data")};

_fobs = +(btc_int_ask_data select 0);
if (count _fobs == 0) exitWith {hint "No FOBs deployed";};
_fobs pushBack "respawn_west";

_missionsData = _fobs apply {
	_pos = getMarkerPos _x;
	[_pos, compile format ["player setPosATL [%1 select 0,%1 select 1,0.45]", _pos], _x,"To " + _x,"","",1,[]]
};

disableserialization;

_parentDisplay     = [] call bis_fnc_displayMission;
_mapCenter     = getmarkerpos "respawn_west";
_ORBAT         = [];
_markers   = [];
_images    = [];
_overcast  = overcast;
_isNight   = !((dayTime > 6) && (dayTime < 20));
_scale     = 1;
_simul     = true;

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