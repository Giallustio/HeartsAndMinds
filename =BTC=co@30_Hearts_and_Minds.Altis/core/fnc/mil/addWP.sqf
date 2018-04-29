params ["_group", "_city", "_area", "_wp"];

private _pos = position _city;
private _rpos = [_pos, _area] call btc_fnc_randomize_pos;

switch (true) do {
    case (_wp < 0.3) : {
        private _houses = [_city, _area] call btc_fnc_getHouses;
        if !(_houses isEqualTo []) then {
            private _house = selectRandom _houses;
            [_group, _house] spawn btc_fnc_house_addWP;
            _group setVariable ["inHouse", typeOf _house];
        } else {
            [_group, _rpos, _area, 2 + floor (random 4), "MOVE", "SAFE", "RED", ["LIMITED", "NORMAL"] select ((vehicle leader _group) isKindOf "Air"), "STAG COLUMN", "", [5, 10, 20]] call CBA_fnc_taskPatrol;
        };
    };
    case (_wp > 0.3 && _wp < 0.75) : {
        [_group, _rpos, _area, 2 + floor (random 4), "MOVE", "AWARE", "RED", ["LIMITED", "NORMAL"] select ((vehicle leader _group) isKindOf "Air"), "STAG COLUMN", "", [5, 10, 20]] call CBA_fnc_taskPatrol;
    };
    case (_wp > 0.75) : {
        [_group, _rpos, 0, "SENTRY", "AWARE", "RED", "UNCHANGED", "WEDGE", "(group this) spawn btc_fnc_data_add_group;", [18000, 36000, 54000]] call CBA_fnc_addWaypoint;
    };
};

true
