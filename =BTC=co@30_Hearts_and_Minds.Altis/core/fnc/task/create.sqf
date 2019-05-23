
/* ----------------------------------------------------------------------------
Function: btc_fnc_task_create

Description:
    Fill me when you edit me !

Parameters:
    _task_id - [String]
    _destination - []
    _location - []

Returns:
    jipID - return the join in process

Examples:
    (begin example)
        [0, "btc_dft"] call btc_fnc_task_create;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_task_ids", "btc_dft", [""]],
    ["_description", "missionDefeat", [""]],
    ["_destination", [], [objNull, []]],
    ["_location", "", [""]]
];

_task_ids = [_task_ids];
private _type = "";
private _showNotification = true;

switch (_description) do {
    case "missionMain" : {
        _showNotification = false;
        _type = "move";
    };
    case "missionDefeat" : {
        _task_ids pushBack "btc_m";
        _type = "kill";
    };
    case "missionDestroy" : {
        _task_ids pushBack "btc_m";
        _type = "destroy";
    };
    case "missionSeize" : {
        _task_ids pushBack "btc_m";
        _type = "move";
    };
    case "sideSupplies" : {
        _type = "container";
    };
    case "sideMines" : {
        _type = "mine";
    };
    case "sideVehicle" : {
        _type = "repair";
    };
    case "sideConquer" : {
        _type = "attack";
    };
    case "sideTower" : {
        _type = "destroy";
    };
    case "sideCivTreat" : {
        _type = "heal";
    };
    case "sideCheckpoint" : {
        _type = "destroy";
    };
     case "sideCivTreatBoat" : {
        _type = "heal";
    };
     case "sideUnderwater" : {
        _type = "destroy";
    };
     case "sideConvoy" : {
        _type = "attack";
    };
     case "sideResc" : {
        _type = "heli";
    };
     case "sideCapOff" : {
        _type = "run";
    };
     case "sideHostage" : {
        _type = "exit";
    };
     case "sideHack" : {
        _type = "defend";
    };
};

[btc_player_side, _task_ids] call BIS_fnc_taskCreate;
[_task_ids, btc_player_side, _description, _destination, 2, _showNotification, false, _type] remoteExecCall ["btc_fnc_task_setDescription", [0, -2] select isDedicated, true];