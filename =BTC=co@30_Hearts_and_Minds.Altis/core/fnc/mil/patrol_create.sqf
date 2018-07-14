params ["_random", "_city", "_area"];

if (isNil "btc_patrol_id") then {btc_patrol_id = 0;};

if (btc_debug_log) then {
    [format ["_random = %1 _city %2 _area %3 btc_patrol_active = %4", _random, _city, _area, count btc_patrol_active], __FILE__, [false]] call btc_fnc_debug_message;
};

if (_random isEqualTo 0) then {
    _random = selectRandom [1, 2];
};
private _cities = btc_city_all inAreaArray [getPosWorld _city, _area, _area];
private _usefuls = _cities select {!(_x getVariable ["active", false]) && _x getVariable ["occupied", false]};

if (_usefuls isEqualTo []) exitWith {true};

private _useful = selectRandom _usefuls;
private _pos = [];
if (_useful getVariable ["hasbeach", false]) then {
    _pos = [getPos _useful, (_useful getVariable ["RadiusX", 0]) + (_useful getVariable ["RadiusY", 0]), btc_p_sea] call btc_fnc_randomize_pos;
} else {
    _pos = getPos _useful;
};

private _group = createGroup [btc_enemy_side, true];
_group setVariable ["city", _city];
_group setVariable ["no_cache", true];
_group setVariable ["btc_patrol_id", btc_patrol_id, btc_debug];
btc_patrol_id = btc_patrol_id + 1;

private _pos_iswater = surfaceIsWater _pos;

sleep 5 + random 10;

switch (true) do {
    case ((_random isEqualTo 1) && !_pos_iswater) : {
        private _n_units = 5 + (round random 8);
        _pos = [_pos, 0, 50, 10, false] call btc_fnc_findsafepos;

        [_group, _pos, _n_units] call btc_fnc_mil_createUnits;
    };
    case ((_random isEqualTo 2) || _pos_iswater) : {
        private _newZone = _pos;
        private _veh_type = "";
        if ((_pos nearRoads 150) isEqualTo []) then {
            _newZone = [_pos, 0, 500, 13, btc_p_sea] call btc_fnc_findsafepos;
            _pos_iswater = surfaceIsWater _newZone;
            if (_pos_iswater) then {
                _veh_type = selectRandom btc_type_boats;
            } else {
                _veh_type = selectRandom (btc_type_motorized + [selectRandom btc_civ_type_veh]);
            };
        } else {
            _newZone = getPos (selectRandom (_pos nearRoads 150));
            _pos_iswater = false;
            _veh_type = selectRandom (btc_type_motorized + [selectRandom btc_civ_type_veh]);
        };

        private _veh = [_group, _newZone, _veh_type] call btc_fnc_mil_createVehicle;

        private _1 = _veh addEventHandler ["Fuel", btc_fnc_mil_patrol_eh];
        _veh setVariable ["eh", [_1/*, _2, _3,4, 5*/]];
        _veh setVariable ["crews", _group];
    };
};

[_group, _area, _pos_iswater] spawn btc_fnc_mil_patrol_addWP;

btc_patrol_active pushBack _group;

//Check if HC is connected
if !((entities "HeadlessClient_F") isEqualTo []) then {
    [_group] call btc_fnc_set_groupowner;
};
