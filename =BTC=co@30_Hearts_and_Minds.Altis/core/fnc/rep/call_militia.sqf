params ["_pos"];

btc_rep_militia_called = time;

private _players = if (isMultiplayer) then {playableUnits} else {switchableunits};

//is there an hideout close by?
private _start_pos = [];
{
    private _hideout = _x;
    if (_pos distance _hideout < 2000 && {{_x distance _hideout < 500} count _players isEqualTo 0}) then {
        _start_pos = getPos _hideout;
    };
} forEach btc_hideouts;

if (btc_debug_log) then {
    diag_log format ["fnc_rep_call_militia = _start_pos : %1 (HIDEOUTS)", _start_pos];
};

if (_start_pos isEqualTo []) then {
    {
        private _city = _x;
        if (_pos distance _city > 300 && {_pos distance _city < 2500} && {{_x distance _city < 500} count _players isEqualTo 0}) then {
            _start_pos = getPos _city;
        };
    } forEach btc_city_all;
};
if (btc_debug_log) then {diag_log format ["fnc_rep_call_militia = _start_pos : %1 (CITIES)", _start_pos];};

if (_start_pos isEqualTo []) then {
    _pos params ["_x", "_y"];

    private _random = random 8;
    switch (true) do {
        case (_random <= 1) : {_start_pos = [_x , _y + 1000, 0];};//N
        case (_random > 1 && _random <= 2) : {_start_pos = [_x + 750, _y + 750, 0];};//NE
        case (_random > 2 && _random <= 3) : {_start_pos = [_x + 1000, _y + 0, 0];};//E
        case (_random > 3 && _random <= 4) : {_start_pos = [_x + 750, _y - 750, 0];};//SE
        case (_random > 4 && _random <= 5) : {_start_pos = [_x - 1000, _y + 0, 0];};//W
        case (_random > 5 && _random <= 6) : {_start_pos = [_x - 750, _y - 750, 0];};//SW
        case (_random > 6 && _random <= 7) : {_start_pos = [_x - 750, _y + 750, 0];};//NW
        case (_random > 7) : {_start_pos = [_x, _y - 1000, 0];};//S
    };
};

if (btc_debug_log) then {
    diag_log format ["fnc_rep_call_militia = _start_pos : %1 (ULTIMA RATIO)", _start_pos];
};

private _ratio = if (_pos distance _start_pos > 1000) then {0.2} else {0.6};

if (btc_debug_log) then {
    diag_log format ["fnc_rep_call_militia = POS : %1 STARTPOS : %2 - RATIO = %3", _pos, _start_pos, _ratio];
};

if ((random 1) > _ratio) then {
    //MOT
    private _group = createGroup btc_enemy_side;
    _group setVariable ["no_cache", true];
    private _veh_type = selectRandom btc_type_motorized;
    private _veh = createVehicle [_veh_type, _start_pos, [], 0, "FLY"];
    private _gunner = _veh emptyPositions "gunner";
    private _commander = _veh emptyPositions "commander";
    private _cargo = (_veh emptyPositions "cargo") - 1;
    btc_type_crewmen createUnit [_start_pos, _group, "this moveinDriver _veh;this assignAsDriver _veh;"];
    if (_gunner > 0) then {
        btc_type_crewmen createUnit [_start_pos, _group, "this moveinGunner _veh;this assignAsGunner _veh;"];
    };
    if (_commander > 0) then {
        btc_type_crewmen createUnit [_start_pos, _group, "this moveinCommander _veh;this assignAsCommander _veh;"];
    };
    for "_i" from 0 to _cargo do {
        private _unit_type = selectRandom btc_type_units;
        _unit_type createUnit [_start_pos, _group, "this moveinCargo _veh;this assignAsCargo _veh;"];
    };

    units _group joinSilent _group;
    _group selectLeader (driver _veh);

    [_group, _pos, 60, "MOVE", "AWARE", "RED", "FULL", "NO CHANGE", "(group this) spawn btc_fnc_data_add_group;"] call CBA_fnc_addWaypoint;
    [_group, _pos, 60, "UNLOAD"] call CBA_fnc_addWaypoint;
    [_group, _pos, 60, "SAD"] call CBA_fnc_addWaypoint;

    if (btc_debug_log) then {
        diag_log format ["fnc_rep_call_militia = MOT %1/%2 POS %3", _group, _veh_type, _pos];
    };
} else {
    //INF
    private _group = ([_start_pos, 50, 8 + random 6, 1] call btc_fnc_mil_create_group) select 0;
    _group setVariable ["no_cache", true];

    [_group] call CBA_fnc_clearWaypoints;
    [_group, _pos, 60, "MOVE", "AWARE", "RED", "FULL", "WEDGE", "(group this) spawn btc_fnc_data_add_group;"] call CBA_fnc_addWaypoint;
    [_group, _pos, 60, "SAD"] call CBA_fnc_addWaypoint;

    if (btc_debug_log) then {
        diag_log format ["fnc_rep_call_militia = INF %1", _group];
    };
};
