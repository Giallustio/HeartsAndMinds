
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

private _useful = btc_city_all select {!(_x getVariable ["occupied", false]) && !((_x getVariable ["type", ""]) in ["NameLocal", "Hill", "NameMarine"])};
if (_useful isEqualTo []) then {_useful = + btc_city_all;};

private _city = selectRandom _useful;
private _pos = [getPos _city, 0, 500, 30, false] call btc_fnc_findsafepos;

[_taskID, 30, getPos _city, _city getVariable "name"] call btc_fnc_task_create;

private _distance_between_fences = 3;
private _number_of_fences = 2 * (3 + floor random 2);
private _area_size = _distance_between_fences * _number_of_fences;
private _offset = _area_size + _distance_between_fences/2;

//// Randomise composition \\\\
private _cone = selectRandom btc_type_cones;
private _barrier = selectRandom btc_type_barrier;

private _doorCenter = 0;
private _composition_pattern = [];
for "_i" from -_number_of_fences to _number_of_fences do {
    _composition_pattern append [
        [_barrier, 0, [_i * _distance_between_fences, -_offset, 0]],
        [_barrier, 0, [_i * _distance_between_fences, _offset, 0]],
        [_barrier, 90, [ -_offset, _i * _distance_between_fences, 0]]
    ];
    if !(_i isEqualTo 3) then {
        _composition_pattern pushBack [_barrier, 90, [_offset, _i * _distance_between_fences, 0]];
        if (random 1 > 0.7) then {
            _composition_pattern append [
                [selectRandom btc_type_portableLamp, 180, [_i * _distance_between_fences, -_offset + 1, 0]],
                [selectRandom btc_type_portableLamp, 90, [_offset - 1, _i * _distance_between_fences, 0]],
                [selectRandom btc_type_portableLamp, 270, [ -_offset + 1, _i * _distance_between_fences, 0]]
            ];
        };
    } else {
        _doorCenter = _i * _distance_between_fences;
    };
};

private _offset_door = - 60 + _offset;
private _sas = -24 + _offset;
_composition_pattern append [
    [_cone, random 360 ,[60.3545 + _offset_door,_doorCenter + 2,0]],
    [_cone, random 360 ,[60.3755 + _offset_door,_doorCenter - 2,0]],
    [selectRandom btc_type_portable_light,40,[61.1982 + _offset_door,_doorCenter - 4,0]],
    [selectRandom btc_type_portable_light,37,[60.7373 + _offset_door,_doorCenter + 5,0]],
    [selectRandom btc_type_body_bags,332,[63 + _offset_door,_doorCenter - 4.7,0.1]],
    [selectRandom btc_type_medicals,0,[65.4448 + _offset_door,_doorCenter - 3,0]],
    [selectRandom btc_type_first_aid_kits,0,[65.6187 + _offset_door,_doorCenter - 4.1,0]],
    [selectRandom btc_type_power,random [180, 223, 260],[63.9292 + _offset_door,_doorCenter + 7,0]],
    [selectRandom (btc_type_barrel + btc_type_canister), random 360,[66.4707 + _offset_door, _doorCenter - 4.3,0]],
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
    ["Tarp_01_Small_Black_F",0,[12.7 + _sas,_doorCenter,0]],
    [selectRandom btc_type_spill,random 360,[-1.96582,1.60091 - _doorCenter/2,0]],
    [selectRandom btc_type_spill,random 360,[4,3.95 - _doorCenter/2,0]],
    [selectRandom btc_type_spill,random 360,[3.47607,-4.70143 - _doorCenter/2,0]],
    [selectRandom btc_type_cargo_ruins,random 360,[6.31689,0.373489 - _doorCenter/2,0]],
    [selectRandom btc_type_cargo_ruins,random 360,[-4,7.95 - _doorCenter/2,0]],
    [selectRandom btc_type_spill,random 360,[0,11.95 - _doorCenter/2,0]]
];
if (random 1 > 0.5) then {
    _composition_pattern pushBack [selectRandom btc_type_cargo_ruins,random 360,[-5.12109,-6.19316 - _doorCenter/2,0]];
};
if (random 1 > 0.5) then {
    _composition_pattern pushBack [selectRandom btc_type_spill,random 360,[-4,-4.05 - _doorCenter/2,0]];
};

private _composition_objects = [_pos, random 360, _composition_pattern] call btc_fnc_create_composition;
btc_chem_decontaminate append (_composition_objects select {_x isKindOf "DeconShower_01_F"});

private _chemical = [];
for "_i" from 1 to (5 + round random 5) do {
    private _m_pos = [_pos, _area_size - 10] call btc_fnc_randomize_pos;
    private _hazmat = createVehicle [selectRandom btc_type_hazmat, _m_pos, [], 10, "NONE"];
    _hazmat setVectorUp [random 1, random 1, 1];
    [_hazmat] call btc_fnc_log_init;
    _chemical pushBack _hazmat;
    if (random 1 > 0.5) then {
        btc_chem_contaminated pushBack _hazmat;
    };
};

private _bring_taskID = _taskID + "br";
[[_bring_taskID, _taskID], 31, _pos, btc_containers_mat select 0] call btc_fnc_task_create;

waitUntil {sleep 5; (_taskID call BIS_fnc_taskCompleted || !((nearestObjects [_pos, btc_containers_mat, 200]) isEqualTo []))};

if (_taskID call BIS_fnc_taskState isEqualTo "CANCELED") exitWith {[[], _composition_objects + _chemical] call btc_fnc_delete;};

[_bring_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;

private _locate_taskID = _taskID + "lc";
[[_locate_taskID, _taskID], 32, _pos, typeOf(_chemical select 0)] call btc_fnc_task_create;

private _clean_taskID = _taskID + "cl";
[[_clean_taskID, _taskID], 33, btc_bigShower, typeOf btc_bigShower] call btc_fnc_task_create;

waitUntil {sleep 5; (
    _taskID call BIS_fnc_taskCompleted ||
    (_chemical arrayIntersect btc_chem_contaminated) select {!isNull _x} isEqualTo []
)};

[[], _composition_objects + _chemical] call btc_fnc_delete;

if (_taskID call BIS_fnc_taskState isEqualTo "CANCELED") exitWith {};

30 call btc_fnc_rep_change;

[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
