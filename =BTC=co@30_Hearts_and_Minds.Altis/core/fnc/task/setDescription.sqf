
/* ----------------------------------------------------------------------------
Function: btc_fnc_task_setDescription

Description:
    Fill me when you edit me !

Parameters:
    _task_id - [String]
    _destination - []
    _location - []

Returns:

Examples:
    (begin example)
        [0, "btc_dft"] call btc_fnc_task_setDescription;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_task_ids", [], ["", []]],
    ["_side", west, [west]],
    ["_description", 0, [0]],
    ["_destination", [], [objNull, []]],
    ["_priority", 2, [0]],
    ["_showNotification", true, [true]],
    ["_location", "", [""]]
];

private _type = "";
switch (_description) do {
    case -1 : {
        _description = ["Must be accomplish", "Main tasks", "Main tasks"];
        _type = "move";
    };
    case 0 : {
        _description = [localize "STR_BTC_HAM_MISSION_DEFEAT_DESC", localize "STR_BTC_HAM_MISSION_DEFEAT_TITLE", localize "STR_BTC_HAM_MISSION_DEFEAT_TITLE"];
        _type = "kill";
    };
    case 1 : {
        _description = [localize "STR_BTC_HAM_MISSION_DESTORY_DESC", localize "STR_BTC_HAM_MISSION_DESTORY_TITLE", localize "STR_BTC_HAM_MISSION_DESTORY_TITLE"];
        _type = "destroy";
    };
    case 2 : {
        _description = [localize "STR_BTC_HAM_MISSION_SEIZE_DESC", localize "STR_BTC_HAM_MISSION_SEIZE_TITLE", localize "STR_BTC_HAM_MISSION_SEIZE_MRK"];
        _type = "move";
    };
    case 3 : {
        _description = [format [localize "STR_BTC_HAM_SIDE_SUPPLIES_DESC", _location], format [localize "STR_BTC_HAM_SIDE_SUPPLIES_TITLE", _location], format [localize "STR_BTC_HAM_SIDE_SUPPLIES_TITLE", _location]];
        _type = "container";
    };
    case 4 : {
        _description = [format [localize "STR_BTC_HAM_SIDE_MINES_DESC", _location], format [localize "STR_BTC_HAM_SIDE_MINES_TITLE", _location], format [localize "STR_BTC_HAM_SIDE_MINES_TITLE", _location]];
        _type = "mine";
    };
    case 5 : {
        _description = [format [localize "STR_BTC_HAM_SIDE_VEHICLE_DESC", _location], format [localize "STR_BTC_HAM_SIDE_VEHICLE_TITLE", _location], format [localize "STR_BTC_HAM_SIDE_VEHICLE_TITLE", _location]];
        _type = "repair";
    };
    case 6 : {
        _description = [format [localize "STR_BTC_HAM_SIDE_CONQUER_DESC", _location], format [localize "STR_BTC_HAM_SIDE_CONQUER_TITLE", _location], format [localize "STR_BTC_HAM_SIDE_CONQUER_TITLE", _location]];
        _type = "attack";
    };
    case 7 : {
        _description = [format [localize "STR_BTC_HAM_SIDE_TOWER_DESC", _location], format [localize "STR_BTC_HAM_SIDE_TOWER_TITLE", _location], format [localize "STR_BTC_HAM_SIDE_TOWER_TITLE", _location]];
        _type = "destroy";
    };
    case 8 : {
        _description = [format [localize "STR_BTC_HAM_SIDE_CIVTREAT_DESC", _location], format [localize "STR_BTC_HAM_SIDE_CIVTREAT_TITLE", _location], format [localize "STR_BTC_HAM_SIDE_CIVTREAT_TITLE", _location]];
        _type = "heal";
    };
    case 9 : {
        _description = [format [localize "STR_BTC_HAM_SIDE_CHECKPOINT_DESC", _location], format [localize "STR_BTC_HAM_SIDE_CHECKPOINT_TITLE", _location], format [localize "STR_BTC_HAM_SIDE_CHECKPOINT_TITLE", _location]];
        _type = "destroy";
    };
    case 10 : {
        _description = [format [localize "STR_BTC_HAM_SIDE_CIVTREATBOAT_DESC", _location], format [localize "STR_BTC_HAM_SIDE_CIVTREATBOAT_TITLE", _location], format [localize "STR_BTC_HAM_SIDE_CIVTREATBOAT_TITLE", _location]];
        _type = "heal";
    };
    case 11 : {
        _description = [format [localize "STR_BTC_HAM_SIDE_UNDERWATER_DESC", _location], format [localize "STR_BTC_HAM_SIDE_UNDERWATER_TITLE", _location], format [localize "STR_BTC_HAM_SIDE_UNDERWATER_TITLE", _location]];
        _type = "destroy";
    };
    case 12 : {
        _description = [format [localize "STR_BTC_HAM_SIDE_CONVOY_DESC", _location], format [localize "STR_BTC_HAM_SIDE_CONVOY_TITLE", _location], format [localize "STR_BTC_HAM_SIDE_CONVOY_TITLE", _location]];
        _type = "attack";
    };
    case 13 : {
        _description = [format [localize "STR_BTC_HAM_SIDE_RESC_DESC", _location], format [localize "STR_BTC_HAM_SIDE_RESC_TITLE", _location], format [localize "STR_BTC_HAM_SIDE_RESC_TITLE", _location]];
        _type = "heli";
    };
    case 14 : {
        _description = [format [localize "STR_BTC_HAM_SIDE_CAPOFF_DESC", _location], localize "STR_BTC_HAM_SIDE_CAPOFF_TITLE", localize "STR_BTC_HAM_SIDE_CAPOFF_TITLE"];
        _type = "run";
    };
    case 15 : {
        _description = [format [localize "STR_BTC_HAM_SIDE_HOSTAGE_DESC", _location], format [localize "STR_BTC_HAM_SIDE_HOSTAGE_TITLE", _location], format [localize "STR_BTC_HAM_SIDE_HOSTAGE_TITLE", _location]];
        _type = "exit";
    };
    case 16 : {
        _description = [format [localize "STR_BTC_HAM_SIDE_HACK_DESC", _location], format [localize "STR_BTC_HAM_SIDE_HACK_TITLE", _location], format [localize "STR_BTC_HAM_SIDE_HACK_TITLE", _location]];
        _type = "defend";
    };
    case 17 : {
        _description = ["Open terminal to launch the hack", "Open terminal", "Open terminal"];
        _type = "intel";
    };
};

[
    _task_ids, _side, _description, _destination,
    _task_id call BIS_fnc_taskState,
    _priority, false, false, _type
] call BIS_fnc_setTask;

if !(_showNotification) exitWith {};

private _task_id = if (_task_ids isEqualType []) then {
    _task_ids select 0
} else {
    _task_ids
};
[
    {!isNull player && {scriptDone btc_intro_done}},
    {
        params ["_task_id"];

        if !(_task_id call BIS_fnc_taskCompleted) then {
            _task_id call BIS_fnc_taskHint;
        };
    },
    _task_id
] call CBA_fnc_waitUntilAndExecute;
