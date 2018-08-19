
params ["_rpos"];

private _objects = lineIntersectsObjs [[_rpos select 0, _rpos select 1, (getTerrainHeightASL _rpos) + 1], [_rpos select 0, _rpos select 1, (getTerrainHeightASL _rpos) + 100], objNull, objNull, false, 16];

if (_objects isEqualTo []) exitWith {_rpos};

private _object = _objects select 0;
if (_object in nearestTerrainObjects [_object, ["HIDE", "ROCK", "ROCKS"], 1]) then {
    _roads = _rpos nearRoads 100;
    if (_roads isEqualTo []) then {
        _rpos = [_rpos,5,50,10,false] call btc_fnc_findsafepos;
    } else {
        _rpos = getPos (_roads select 0);
    };
};

if (btc_debug_log) then {
    _objects = lineIntersectsObjs [[_rpos select 0, _rpos select 1, (getTerrainHeightASL _rpos) + 1], [_rpos select 0, _rpos select 1, (getTerrainHeightASL _rpos) + 100], objNull, objNull, false, 16];
    if !(_objects isEqualTo []) then {
        _object = _objects select 0;
        if (_object in nearestTerrainObjects [_object, ["HIDE", "ROCK", "ROCKS"], 1]) then {
            diag_log format ["FIND POS OUTSIDE ROCK: POS %1 Still inside rock", _rpos];
            if (btc_debug) then {
                systemChat "FIND POS OUTSIDE ROCK: Still inside rock";
                private _marker = createmarker [format ["btc_inrock_%1", _rpos], _rpos];
                _marker setmarkertype "mil_unknown";
                _marker setMarkerText "In rock";
                _marker setMarkerSize [0.5, 0.5];
            };
        };
    };
};

_rpos
