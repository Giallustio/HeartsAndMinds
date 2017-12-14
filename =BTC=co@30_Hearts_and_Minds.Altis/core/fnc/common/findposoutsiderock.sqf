
params ["_rpos"];

private _rposASL = [_rpos select 0, _rpos select 1, getTerrainHeightASL _rpos];

private _objects = lineIntersectsObjs [[_rposASL select 0 , _rposASL select 1 , (_rposASL select 2) + 1], [_rposASL select 0 , _rposASL select 1 , (_rposASL select 2) + 100],objNull,objNull,false,16];

if (_objects isEqualTo []) exitWith {_rpos};

private _object = _objects select 0;

if (_object in nearestTerrainObjects [_object, ["Rock"], 1]) then {

	_roads = _rpos nearRoads 100;
	if (_roads isEqualTo []) then {
		_rpos = [_rpos,5,50,10,false] call btc_fnc_findsafepos;
	} else {
		_rpos = getPos (_roads select 0);
	};
};

if (btc_debug) then {
	private _objects = lineIntersectsObjs [[_rposASL select 0 , _rposASL select 1 , (_rposASL select 2) + 1], [_rposASL select 0 , _rposASL select 1 , (_rposASL select 2) + 100],objNull,objNull,false,16];
	private _object = _objects select 0;
	if (_object in nearestTerrainObjects [_object, ["Rock"], 1]) then {
			systemChat "FIND POS OUTSIDE ROCK: Still inside rock";
			createmarker [format ["btc_inrock_%1", _rpos], _rpos];
			format ["btc_inrock_%1", _rpos] setmarkertype "mil_unknown";
			format ["btc_inrock_%1", _rpos] setMarkerText "In rock";
			format ["btc_inrock_%1", _rpos] setMarkerSize [0.5, 0.5];
	};
};

_rpos
