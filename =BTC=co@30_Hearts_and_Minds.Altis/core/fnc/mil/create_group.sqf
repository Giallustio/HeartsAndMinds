params ["_city", "_area", "_n", "_wp"];

if (_city isEqualType objNull) then {
    _city = position _city;
};

private _rpos = [_city, _area, btc_p_sea] call btc_fnc_randomize_pos;

private _unit_type = "";
private _pos_iswater = surfaceIsWater _rpos;
if (_pos_iswater) then {
    _unit_type = selectRandom btc_type_divers;
} else {
    _unit_type = selectRandom btc_type_units;
    private _newpos = _rpos findEmptyPosition [0, 40, _unit_type];
    if !(_newpos isEqualTo []) then {
        _rpos = _newpos;
    };
    _rpos = [_rpos] call btc_fnc_findPosOutsideRock;
};

private _group = createGroup btc_enemy_side;
private _groups = [];
_groups pushBack _group;
private _structure = objNull;

switch (true) do {
    case (_wp < 0.3) : {
        private _structures = [_rpos, 70] call btc_fnc_mil_getStructures;
        if !(_structures isEqualTo []) then {
            _structure = selectRandom _structures;
            _n = count (_structure buildingPos -1);
            if (_n > 8) then {
                _n = 2;
            } else {
                _n = floor(_n/2);
            };
            [_group, _rpos, _n] call btc_fnc_mil_createUnits;
        } else {
            [_group, _rpos, 0] call btc_fnc_mil_createUnits;
            private _houses = [_rpos, 50] call btc_fnc_getHouses;
            if (_houses isEqualTo []) then {
                [_group, _rpos, _area, 2 + floor (random 4), "MOVE", "SAFE", "RED", ["LIMITED", "NORMAL"] select ((vehicle leader _group) isKindOf "Air"), "STAG COLUMN", "", [5, 10, 20]] call CBA_fnc_taskPatrol;
            } else {
                _structure = selectRandom _houses;
            };
        };
    };
    case (_wp > 0.3 && _wp < 0.75) : {
        [_group, _rpos, 0, _pos_iswater] call btc_fnc_mil_createUnits;
        [_group, _rpos, _area, 2 + floor (random 4), "MOVE", "SAFE", "RED", ["LIMITED", "NORMAL"] select ((vehicle leader _group) isKindOf "Air"), "STAG COLUMN", "", [5, 10, 20]] call CBA_fnc_taskPatrol;
    };
    case (_wp > 0.75) : {
        [_group, _rpos, 0, "SENTRY", "AWARE", "RED"] call CBA_fnc_addWaypoint;
    };
};
if (_structure isEqualTo objNull) then {
    [_group, _rpos, _n - count units _group, _pos_iswater] call btc_fnc_mil_createUnits;
} else {
    {
        private _grp = createGroup btc_enemy_side;
        [_x] joinSilent _grp;
        _grp setVariable ["inHouse", typeOf _structure];
        [_grp, _structure] call btc_fnc_house_addWP;
        _groups pushBack _grp;
    } forEach units _group;
};

if (btc_debug_log) then {
    [format ["_this = %1 ; POS %2 UNITS N %3", _this, _rpos, count units _group], __FILE__, [false]] call btc_fnc_debug_message;
};

_groups
