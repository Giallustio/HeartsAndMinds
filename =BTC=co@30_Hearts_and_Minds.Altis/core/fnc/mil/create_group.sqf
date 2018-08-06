params [
    ["_city", objNull, [objNull, []]],
    ["_area", 300, [0]],
    ["_n", 0, [0]],
    ["_wp", 0, [0]],
    ["_type_divers", btc_type_divers, [[]]],
    ["_type_units", btc_type_units, [[]]],
    ["_p_sea", btc_p_sea, [true]]
];

// Find a position
if (_city isEqualType objNull) then {
    _city = position _city;
};

private _rpos = [_city, _area, _p_sea] call btc_fnc_randomize_pos;

private _unit_type = "";
private _pos_iswater = surfaceIsWater _rpos;
if (_pos_iswater) then {
    _unit_type = selectRandom _type_divers;
} else {
    _unit_type = selectRandom _type_units;
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

if (_wp < 0.3) then {
    // Find a house/structure
    private _structures = [_rpos, 70] call btc_fnc_mil_getStructures;
    if (_structures isEqualTo []) then {
        private _houses = [_rpos, 50] call btc_fnc_getHouses;
        if (_houses isEqualTo []) then {
            _wp = 0.4;
        } else {
            _structure = selectRandom _houses;
            _n = 0;
        };
    } else {
        _structure = selectRandom _structures;
        _n = count (_structure buildingPos -1);
        if (_n > 8) then {
            _n = 2;
        } else {
            _n = floor (_n/2);
        };
    };
};

// Handle different case of wp
switch (true) do {
    case (_wp < 0.3) : {
        for "_i" from 0 to _n do {
            private _grp = createGroup btc_enemy_side;
            [_grp, _rpos, 0] call btc_fnc_mil_createUnits;
            _grp setVariable ["btc_inHouse", typeOf _structure];
            [_grp, _structure] call btc_fnc_house_addWP;
            _groups pushBack _grp;
        };
    };
    case (_wp > 0.3 && _wp < 0.75) : {
        [_group, _rpos, _n, _pos_iswater] call btc_fnc_mil_createUnits;
        [_group, _rpos, _area, 2 + floor (random 4), "MOVE", "SAFE", "RED", "LIMITED", "STAG COLUMN", "", [5, 10, 20]]call CBA_fnc_taskPatrol;
    };
    case (_wp > 0.75) : {
        [_group, _rpos, _n, _pos_iswater] call btc_fnc_mil_createUnits;
        [_group, _rpos, 0, "SENTRY", "AWARE", "RED"] call CBA_fnc_addWaypoint;
    };
};

if (btc_debug_log) then {
    [format ["_this = %1 ; POS %2 UNITS N %3", _this, _rpos, _n], __FILE__, [false]] call btc_fnc_debug_message;
};

_groups
