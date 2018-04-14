params ["_random", "_city", "_area"];

if (isNil "btc_patrol_id") then {btc_patrol_id = 0;};

if (btc_debug_log) then {
    diag_log format ["btc_fnc_mil_patrol_create: _random = %1 _city %2 _area %3 btc_patrol_active = %4", _random, _city, _area, count btc_patrol_active];
};

if (_random isEqualTo 0) then {
    private _n = random 100;
    switch (true) do {
        case (_n < 40)            : {_random = 1;};
        case (_n > 40 && _n < 90) : {_random = 2;};
        case (_n > 90 && _n < 96) : {_random = 3;};
        case (_n > 96)            : {_random = 4;};
    };
};
private _cities = btc_city_all select {(_x distance _city < _area)};
private _usefuls = _cities select {(!(_x getVariable ["active", false]) && _x getVariable ["occupied", false])};

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
_group setVariable ["btc_patrol", true];
_group setVariable ["btc_patrol_id", btc_patrol_id, btc_debug];
btc_patrol_id = btc_patrol_id + 1;

private _pos_iswater = surfaceIsWater _pos;

sleep 5 + random 10;

switch (true) do {
    case ((_random isEqualTo 1) && !_pos_iswater) : {
        private _n_units   = 4 + (round random 8);
        _pos = [_pos, 0, 50, 10, false] call btc_fnc_findsafepos;
        [_group createUnit [btc_type_units select 0, _pos, [], 0, "NONE"]] joinSilent _group;
        (leader _group) setpos _pos;
        for "_i" from 1 to _n_units do {
            private _unit_type = selectRandom btc_type_units;
            [_group createUnit [_unit_type, _pos, [], 0, "NONE"]] joinSilent _group;
            sleep 1;
        };
        [_group, _area, _pos_iswater] spawn btc_fnc_mil_patrol_addWP;
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

        private _needdiver = getText(configfile >> "CfgVehicles" >> _veh_type >> "simulation") isEqualTo "submarinex";
        private _crewmen = "";
        if (_needdiver) then {
            _crewmen = btc_type_divers select 0
        } else {
            _crewmen = btc_type_crewmen
        };

        private _veh = createVehicle [_veh_type, _newZone, [], 0, "FLY"];
        [_veh, _group, false,"", _crewmen] call BIS_fnc_spawnCrew;
        _group selectLeader (driver _veh);
        private _cargo = (_veh emptyPositions "cargo") - 1;
        if (_cargo > 0) then {
            for "_i" from 0 to _cargo do {
                _unit_type = [selectRandom btc_type_units, selectRandom btc_type_divers] select _needdiver;
                _unit_type createUnit [_newZone, _group, "this moveinCargo _veh;this assignAsCargo _veh;"];
            };
        };
        units _group joinSilent _group;

        private _1 = _veh addEventHandler ["Fuel", {_this call btc_fnc_mil_patrol_eh}];
        _veh setVariable ["eh", [_1/*, _2, _3,4, 5*/]];
        _veh setVariable ["crews", _group];

        [_group, _area, _pos_iswater] spawn btc_fnc_mil_patrol_addWP;
    };
};

btc_patrol_active pushBack _group;

{_x call btc_fnc_mil_unit_create} forEach units _group;

//Check if HC is connected
if !((entities "HeadlessClient_F") isEqualTo []) then {
    [_group] call btc_fnc_set_groupowner;
};
