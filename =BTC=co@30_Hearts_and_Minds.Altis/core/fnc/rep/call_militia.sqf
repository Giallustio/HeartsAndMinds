
/* ----------------------------------------------------------------------------
Function: btc_fnc_rep_call_militia

Description:
    Call militia to a position.

Parameters:
    _pos - Position to calling for militia. [Array]

Returns:

Examples:
    (begin example)
        [getPos player] call btc_fnc_rep_call_militia;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_pos", [0, 0, 0], [[]]]
];

btc_rep_militia_called = time;

private _players = if (isMultiplayer) then {playableUnits} else {switchableunits};

//is there an hideout close by?
private _start_pos = [];
{
    private _hideout = _x;
    if (_hideout inArea [_pos, 2000, 2000, 0, false] && {_players inAreaArray [getPosWorld _hideout, 500, 500] isEqualTo []}) then {
        _start_pos = getPos _hideout;
    };
} forEach btc_hideouts;

if (btc_debug_log) then {
    [format ["_start_pos : %1 (HIDEOUTS)", _start_pos], __FILE__, [false]] call btc_fnc_debug_message;
};

if (_start_pos isEqualTo []) then {
    _start_pos = [_pos, btc_city_all select {!(_x getVariable ["active", false]) && _x getVariable ["type", ""] != "NameMarine"}, false] call btc_fnc_find_closecity;
    _start_pos = getPos _start_pos;
};

if (btc_debug_log) then {
    [format ["_start_pos : %1 (CITIES)", _start_pos], __FILE__, [false]] call btc_fnc_debug_message;
};

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
    [format ["_start_pos : %1 (ULTIMA RATIO)", _start_pos], __FILE__, [false]] call btc_fnc_debug_message;
};

private _ratio = if (_pos distance _start_pos > 1000) then {0.2} else {0.6};

if (btc_debug_log) then {
    [format ["POS : %1 STARTPOS : %2 - RATIO = %3", _pos, _start_pos, _ratio], __FILE__, [false]] call btc_fnc_debug_message;
};

if ((random 1) > _ratio) then {
    //MOT
    private _group = createGroup btc_enemy_side;
    _group setVariable ["no_cache", true];
    private _veh = [_group, _start_pos] call btc_fnc_mil_createVehicle;

    [_group, _pos, 60, "MOVE", "AWARE", "RED", "FULL", "NO CHANGE", "(group this) spawn btc_fnc_data_add_group;"] call CBA_fnc_addWaypoint;
    [_group, _pos, 60, "UNLOAD"] call CBA_fnc_addWaypoint;
    [_group, _pos, 60, "SAD"] call CBA_fnc_addWaypoint;

    if (btc_debug_log) then {
        [format ["MOT %1/%2 POS %3", _group, typeOf _veh, _pos], __FILE__, [false]] call btc_fnc_debug_message;
    };
} else {
    //INF
    private _group = ([_start_pos, 50, 8 + round random 6, 1] call btc_fnc_mil_create_group) select 0;
    _group setVariable ["no_cache", true];

    [_group] call CBA_fnc_clearWaypoints;
    [_group, _pos, 60, "MOVE", "AWARE", "RED", "FULL", "WEDGE", "(group this) spawn btc_fnc_data_add_group;"] call CBA_fnc_addWaypoint;
    [_group, _pos, 60, "SAD"] call CBA_fnc_addWaypoint;

    if (btc_debug_log) then {
        [format ["INF %1", _group], __FILE__, [false]] call btc_fnc_debug_message;
    };
};
