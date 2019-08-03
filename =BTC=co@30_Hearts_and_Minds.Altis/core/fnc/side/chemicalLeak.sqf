
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_chemicalLeak

Description:
    Fill me when you edit me !

Parameters:
    _taskID - Unique task ID. [String]

Returns:

Examples:
    (begin example)
        [false, "btc_fnc_side_chemicalLeak"] spawn btc_fnc_side_create;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_taskID", "btc_side", [""]]
];

private _useful = btc_city_all select {!((_x getVariable ["type", ""]) in ["NameLocal", "Hill", "NameMarine"])};
if (_useful isEqualTo []) then {_useful = + btc_city_all;};

private _city = selectRandom _useful;
private _pos = [getPos _city, 0, 500, 30, false] call btc_fnc_findsafepos;

[_taskID, 4, _pos, _city getVariable "name"] call btc_fnc_task_create;

private _distance_between_fences = 8.1;
private _number_of_fences = 2 + floor random 2;
private _area_size = _distance_between_fences * _number_of_fences;
private _offset = _area_size + _distance_between_fences/2;

//// Randomise composition \\\\
private _cone = selectRandom btc_type_cones;
private _fences = + btc_type_fences;
_fences pushBack _cone;
private _fence = selectRandom _fences;

private _offset_door = - 60 + _offset;
private _sas = -24 + _offset;
private _doorCenter = (9.47217 - 5.86768)/2 + 5.86768;
private _composition_pattern = [
    [_cone, random 360 ,[60.3545 + _offset_door,5.86768,0]],
    [_cone, random 360 ,[60.3755 + _offset_door,9.47217,0]],
    [selectRandom btc_type_portable_light,40,[61.1982 + _offset_door,3.28906,0]],
    [selectRandom btc_type_portable_light,37,[60.7373 + _offset_door,11.856,0]],
    [selectRandom btc_type_body_bags,332,[62.4473 + _offset_door,0.76416,0]],
    [selectRandom btc_type_medicals,0,[65.4448 + _offset_door,1.52734,0]],
    [selectRandom btc_type_first_aid_kits,0,[65.6187 + _offset_door,0.109863,0]],
    [selectRandom btc_type_power,223,[63.9292 + _offset_door,14.8687,0]],
    [selectRandom (btc_type_barrel + btc_type_canister),0,[66.4707 + _offset_door,0.0717773,0]],
    ["DeconShower_01_F",0,[23 + _sas,_doorCenter,0]],
    ["Tarp_01_Small_Yellow_F",0,[23 + _sas,_doorCenter,0]],
    ["Land_ConnectorTent_01_white_open_F",270,[16.188 + _sas,_doorCenter,0]],
    ["Land_TentLamp_01_standing_F",0,[18.5591 + _sas,_doorCenter + 4.89123,0]],
    ["Land_ConnectorTent_01_NATO_cross_F",270,[19.7534 + _sas,_doorCenter,0]],
    ["Land_ConnectorTent_01_AAF_closed_F",180,[19.6768 + _sas,_doorCenter - 3.45134,0]],
    ["Land_ConnectorTent_01_AAF_closed_F",0,[19.7354 + _sas, _doorCenter + 3.72136,0]],
    ["DeconShower_01_F",360,[12.7 + _sas,_doorCenter,0]],
    ["TrashBagHolder_01_F", random [0, 0, 10],[12.7 + _sas, _doorCenter -1.93781,0]],
    ["TrashBagHolder_01_F", random [0, 0, 10],[12.7 + _sas, _doorCenter + 2.23615,0]],
    ["Tarp_01_Small_Black_F",0,[12.7 + _sas,_doorCenter,0]]
];

for "_i" from -_number_of_fences to _number_of_fences do {
    _composition_pattern append [
        [_fence, 0, [_i * _distance_between_fences, -_offset, 0]],
        [_fence, 0, [_i * _distance_between_fences, _offset, 0]],
        [_fence, 90, [ -_offset, _i * _distance_between_fences, 0]]
    ];
    if !(_i isEqualTo 1) then {
        _composition_pattern pushBack [_fence, 90, [_offset, _i * _distance_between_fences, 0]];
    };

    if (random 1 > 0.7) then {
        _composition_pattern append [
            [selectRandom btc_type_portableLamp, 180, [_i * _distance_between_fences, -_offset + 1, 0]],
            [selectRandom btc_type_portableLamp, 90, [_offset - 1, _i * _distance_between_fences, 0]],
            [selectRandom btc_type_portableLamp, 270, [ -_offset + 1, _i * _distance_between_fences, 0]]
        ];
    };
};

private _composition_objects = [_pos, random 360, _composition_pattern] call btc_fnc_create_composition;

private _chemical = [];
for "_i" from 1 to (5 + round random 5) do {
    private _m_pos = [_pos, _area_size - 10] call btc_fnc_randomize_pos;
    private _hazmat = createVehicle [selectRandom btc_type_hazmat, _m_pos, [], 10, "CAN_COLLIDE"];
    [_hazmat] call btc_fnc_log_init;
    _chemical pushBack _hazmat;
};

btc_chem_contaminated append _chemical;
btc_chem_decontaminate append (_composition_objects select {_x isKindOf "DeconShower_01_F"});

waitUntil {sleep 5; (
    _taskID call BIS_fnc_taskCompleted ||
    _chemical select {!isNull _x} isEqualTo []
)};

if (_taskID call BIS_fnc_taskState isEqualTo "CANCELED") exitWith {
    [[], _composition_objects, _chemical] call btc_fnc_delete;
};

30 call btc_fnc_rep_change;

[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;

[[], _composition_objects] call btc_fnc_delete;
