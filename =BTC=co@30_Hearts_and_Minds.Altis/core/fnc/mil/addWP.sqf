params ["_group", "_city", "_area", "_wp"];

private _pos = position _city;
private _rpos = [_pos, _area] call btc_fnc_randomize_pos;

private _in_house = false;

switch (true) do {
    case (_wp < 0.3) : {
        private _houses = [_city, _area] call btc_fnc_getHouses;
        if !(_houses isEqualTo []) then {
            _in_house = true;
            private _house = selectRandom _houses;
            [_group, _house] spawn btc_fnc_house_addWP;
            _group setVariable ["inHouse", typeOf _house];
        } else {
            [_group, _rpos, _area, "SAFE"] call btc_fnc_task_patrol;
        };
    };
    case (_wp > 0.3 && _wp < 0.75) : {
        [_group, _rpos, _area, "AWARE"] call btc_fnc_task_patrol;
    };
    case (_wp > 0.75) : {
        private _wpa = _group addWaypoint [_rpos, 0];
        _wpa setWaypointType "SENTRY";
        _wpa setWaypointCombatMode "RED";
        _wpa setWaypointBehaviour "AWARE";
        _wpa setWaypointFormation "WEDGE";
        _wpa setWaypointTimeout [18000, 36000, 54000];
        _wpa setWaypointStatements ["true", "(group this) spawn btc_fnc_data_add_group;"];
    };
};

true
