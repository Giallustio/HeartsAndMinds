
/* ----------------------------------------------------------------------------
Function: btc_fnc_mil_send

Description:
    Send a group of units to a location then call btc_fnc_data_add_group. If player is around, initiate patrol around the destination, ifnot save in database and delete units.

Parameters:
    _start - Starting point. [Object]
    _dest - Destination. [Array, Object]
    _typeOf_patrol - Infantry or motorized. [String]
    _veh_type - Vehicle type for motorized. [String]
    _infFormation - Define the infantry formation. [String]

Returns:
    _group - Created group. [Group]

Examples:
    (begin example)
        _result = [] call btc_fnc_mil_send;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_start", objNull, [objNull]],
    ["_dest", [0, 0, 0], [[], objNull]],
    ["_typeOf_patrol", 0, [0]],
    ["_veh_type", "", [""]],
    ["_infFormation", "COLUMN", [""]]
];

private _pos = getPos _start;

private _group = grpNull;
switch (_typeOf_patrol) do {
    case 0 : {
        _group = ([_pos, 150, 3 + round random 6, 1] call btc_fnc_mil_create_group) select 0;
        _group setVariable ["no_cache", true];
        [_group] call CBA_fnc_clearWaypoints;

        [_group, _dest, -1, "MOVE", "AWARE", "RED", "FULL", _infFormation, "(group this) call btc_fnc_data_add_group;", nil, 60] call CBA_fnc_addWaypoint;
    };
    case 1 : {
        _group = createGroup [btc_enemy_side, true];
        _group setVariable ["no_cache", true];

        if (_veh_type isEqualTo "") then {_veh_type = selectRandom btc_type_motorized};

        private _return_pos = [_pos, 10, 500, 13, false] call btc_fnc_findsafepos;

        private _veh = [_group, _return_pos, _veh_type] call btc_fnc_mil_createVehicle;

        [_group, _dest, -1, "MOVE", "AWARE", "RED", "NORMAL", "NO CHANGE", "(group this) call btc_fnc_data_add_group;", nil, 60] call CBA_fnc_addWaypoint;
        [_group, _dest, -1, "GETOUT", nil, nil, nil, nil, nil, nil, 60] call CBA_fnc_addWaypoint;
        [_group, _dest, -1, "SENTRY", nil, nil, nil, nil, nil, nil, 60] call CBA_fnc_addWaypoint;

    };
};

[[_group]] call btc_fnc_set_groupsOwner;

_group
