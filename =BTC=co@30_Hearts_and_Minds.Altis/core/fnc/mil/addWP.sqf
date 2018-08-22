params [
    ["_group", grpNull, [grpNull]],
    ["_city", objNull, [objNull]],
    ["_area", 0, [0]],
    ["_wp", 0, [0]],
    ["_wp_ratios", [btc_p_en_in_house, 1.05 - btc_p_en_in_house], [[]]]
];
_wp_ratios params ["_wp_house_probability", "_wp_sentry_probability"];

private _pos = position _city;
private _rpos = [_pos, _area] call btc_fnc_randomize_pos;

switch (true) do {
    case (_wp <= _wp_house_probability) : {
        private _houses = [_city, _area] call btc_fnc_getHouses;
        if !(_houses isEqualTo []) then {
            private _house = selectRandom _houses;
            [_group, _house] spawn btc_fnc_house_addWP;
            _group setVariable ["btc_inHouse", typeOf _house];
        } else {
            [_group, _rpos, _area, 2 + floor (random 4), "MOVE", "SAFE", "RED", ["LIMITED", "NORMAL"] select ((vehicle leader _group) isKindOf "Air"), "STAG COLUMN", "", [5, 10, 20]] call CBA_fnc_taskPatrol;
        };
    };
    case (_wp > _wp_house_probability && _wp <= _wp_sentry_probability) : {
        [_group, _rpos, _area, 2 + floor (random 4), "MOVE", "AWARE", "RED", ["LIMITED", "NORMAL"] select ((vehicle leader _group) isKindOf "Air"), "STAG COLUMN", "", [5, 10, 20]] call CBA_fnc_taskPatrol;
    };
    case (_wp > _wp_sentry_probability) : {
        [_group, _rpos, 0, "SENTRY", "AWARE", "RED", "UNCHANGED", "WEDGE", "(group this) spawn btc_fnc_data_add_group;", [18000, 36000, 54000]] call CBA_fnc_addWaypoint;
    };
};

true
