
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_drone_create

Description:
    Fill me when you edit me !

Parameters:
    _city - [Object]
    _area - [Number]
    _rpos - Create the drone at this position. [Array]
    _group - Group used for drone crew. [Group]

Returns:

Examples:
    (begin example)
        _leader = [allplayers select 0, 100] call btc_fnc_ied_drone_create;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_city", objNull, [objNull]],
    ["_area", 300, [0]],
    ["_rpos", [], [[]]],
    ["_group", createGroup [btc_enemy_side, true], [grpNull]]
];

if (btc_debug_log) then {
    [format ["_name = %1 _area %2", _city getVariable ["name", "name"], _area], __FILE__, [false]] call btc_fnc_debug_message;
};

if (_rpos isEqualTo []) then {
    _rpos = [position _city, _area] call btc_fnc_randomize_pos;
};

private _drone = createVehicle ["C_IDAP_UAV_06_antimine_F", _rpos, [], 0, "FLY"];
createVehicleCrew _drone;
[driver _drone] joinSilent _group;
_group setVariable ["btc_ied_drone", true];
{_x call btc_fnc_mil_unit_create} forEach units _group;

[_group, _rpos, _area, 4] call CBA_fnc_taskPatrol;
_drone flyInHeight 10;

[driver _drone, _rpos, _area, []] call btc_fnc_ied_droneLoop;

leader _group
