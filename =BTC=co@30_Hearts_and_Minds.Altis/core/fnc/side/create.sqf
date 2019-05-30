
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_create

Description:
    Fill me when you edit me !

Parameters:
    _cycle - Cycle side mission. [Boolean]
    _side - Number of the side mission to start. [Number]

Returns:

Examples:
    (begin example)
        [false, 11] spawn btc_fnc_side_create;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

if (btc_side_list_use isEqualTo []) then {btc_side_list_use = + btc_side_list;};

params [
    ["_cycle", false, [false]],
    ["_side", selectRandom btc_side_list_use, [0]]
];

btc_side_ID = btc_side_ID + 1;
private _sideID = format ["btc_%1", btc_side_ID];
if ([_sideID] call BIS_fnc_taskExists) exitWith {
    _this call btc_fnc_side_create;
};

btc_side_list_use = btc_side_list_use - [_side];

switch (_side) do {
    case 0 : {[_sideID] call btc_fnc_side_supply;};
    case 1 : {[_sideID] call btc_fnc_side_mines;};
    case 2 : {[_sideID] call btc_fnc_side_vehicle;};
    case 3 : {[_sideID] call btc_fnc_side_get_city;};
    case 4 : {[_sideID] call btc_fnc_side_tower;};
    case 5 : {[_sideID] call btc_fnc_side_civtreatment;};
    case 6 : {[_sideID] call btc_fnc_side_checkpoint;};
    case 7 : {[_sideID] call btc_fnc_side_civtreatment_boat;};
    case 8 : {[_sideID] call btc_fnc_side_underwater_generator;};
    case 9 : {[_sideID] call btc_fnc_side_convoy;};
    case 10 : {[_sideID] call btc_fnc_side_rescue;};
    case 11 : {[_sideID] call btc_fnc_side_capture_officer;};
    case 12 : {[_sideID] call btc_fnc_side_hostage;};
    case 13 : {[_sideID] call btc_fnc_side_hack;};
};

if (_cycle) then {
    [true] spawn btc_fnc_side_create;
};
