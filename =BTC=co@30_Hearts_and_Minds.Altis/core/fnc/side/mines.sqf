
private _useful = btc_city_all select {(_x getVariable ["type",""] != "NameLocal") && {_x getVariable ["type",""] != "Hill"} && (_x getVariable ["type",""] != "NameMarine")};

if (_useful isEqualTo []) then {_useful = + btc_city_all;};

private _city = selectRandom _useful;
private _pos = [getPos _city, 0, 500, 30, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;publicVariable "btc_side_assigned";

[4, _pos, _city getVariable "name"] remoteExec ["btc_fnc_task_create", 0];

btc_side_jip_data = [4, _pos, _city getVariable "name"];

private _distance_between_fences = 8.1;
private _number_of_fences = 3 + floor random 4;
private _area_size = _distance_between_fences * _number_of_fences;
private _offset = _area_size + _distance_between_fences/2;

private _area = createmarker [format ["sm_%1", _pos], _pos];
_area setMarkerShape "RECTANGLE";
_area setMarkerBrush "SolidBorder";
_area setMarkerSize [_offset, _offset];
_area setMarkerAlpha 0.3;
_area setmarkercolor "colorBlue";

private _marker = createmarker [format ["sm_2_%1", _pos], _pos];
_marker setmarkertype "hd_flag";
[_marker, "STR_BTC_HAM_SIDE_MINES_MRK"] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker]; //Mines
_marker setMarkerSize [0.6, 0.6];

//// Randomise composition \\\\
private _cone = selectRandom btc_type_cones;
private _fences = + btc_type_fences;
_fences pushBack _cone;
private _fence = selectRandom _fences;

private _offset_door = - 60 + _offset;
private _composition_pattern = [
    [selectRandom btc_type_bloods,81,[56.0991 + _offset_door,5.71729,0]],
    [_cone,0,[60.3545 + _offset_door,5.86768,0]],
    [_cone,0,[60.3755 + _offset_door,9.47217,0]],
    [selectRandom btc_type_portable_light,101,[61.1982 + _offset_door,3.28906,0]],
    [selectRandom btc_type_portable_light,37,[60.7373 + _offset_door,11.856,0]],
    [selectRandom btc_type_bloods,131,[61.9722 + _offset_door,5.49609,0]],
    [selectRandom btc_type_body_bags,332,[62.4473 + _offset_door,0.76416,0]],
    [selectRandom btc_type_bloods,94,[62.3799 + _offset_door,8.66309,0]],
    [selectRandom btc_type_bloods,0,[65.3276 + _offset_door,1.97803,0]],
    [selectRandom btc_type_medicals,0,[65.4448 + _offset_door,1.52734,0]],
    [selectRandom btc_type_first_aid_kits,0,[65.6187 + _offset_door,0.109863,0]],
    [selectRandom btc_type_power,223,[63.9292 + _offset_door,14.8687,0]],
    [selectRandom (btc_type_barrel + btc_type_canister),0,[66.4707 + _offset_door,0.0717773,0]]
];

for "_i" from -_number_of_fences to _number_of_fences do {
    _composition_pattern append [
        [_fence, 0, [_i * _distance_between_fences, -_offset, 0]],
        [_fence, 0, [_i * _distance_between_fences, _offset, 0]],
        [_fence, 90, [ -_offset, _i * _distance_between_fences, 0]]
    ];
    if !(_i isEqualTo 1) then {
        _composition_pattern pushBack [_fence, 90, [ _offset, _i * _distance_between_fences, 0]];
    };

    if (random 1 > 0.7) then {
        _composition_pattern append [
            [selectRandom btc_type_signs, 180, [_i * _distance_between_fences, _offset - 1, 0]],
            [selectRandom btc_type_signs, 0, [_i * _distance_between_fences, -_offset + 1, 0]],
            [selectRandom btc_type_signs, 270, [ _offset - 1, _i * _distance_between_fences, 0]],
            [selectRandom btc_type_signs, 90, [ -_offset + 1, _i * _distance_between_fences, 0]]
        ];
    };
};

private _composition_objects = [_pos, selectRandom [0, 90, 180, 270], _composition_pattern] call btc_fnc_create_composition;

private _mines = [];
for "_i" from 1 to (5 + round random 5) do {
    private _type = "ATMine";
    if (random 1 > 0.6) then {_type = selectRandom btc_type_mines;};
    private _m_pos = [_pos, _area_size - 10] call btc_fnc_randomize_pos;
    _mines pushBack createMine [_type, _m_pos, [], 0];

    if (random 1 > 0.8) then {
        _m_pos = [_pos, _area_size - 10] call btc_fnc_randomize_pos;
        private _s = createVehicle [selectRandom btc_type_signs, _m_pos, [], 10, "CAN_COLLIDE"];
        _s setDir random 360;
        _composition_objects pushBack _s;
    };
};

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || ({_x distance _pos < 100} count playableUnits > 0))};

private _closest = [_city,btc_city_all select {!(_x getVariable ["active",false])}, false] call btc_fnc_find_closecity;
for "_i" from 1 to (round random 2) do {
    [_closest, _pos, 1, selectRandom btc_type_motorized] spawn btc_fnc_mil_send;
};

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || ({!isNull _x} count _mines == 0))};

btc_side_assigned = false;publicVariable "btc_side_assigned";
if (btc_side_aborted || btc_side_failed) exitWith {
    4 remoteExec ["btc_fnc_task_fail", 0];
    [[_area,_marker], _mines + _composition_objects, [], []] call btc_fnc_delete;
};

30 call btc_fnc_rep_change;

4 remoteExec ["btc_fnc_task_set_done", 0];

[[_area,_marker], _composition_objects, [], []] call btc_fnc_delete;
