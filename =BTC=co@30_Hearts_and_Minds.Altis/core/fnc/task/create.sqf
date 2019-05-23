
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
    ["_task_type", 0, [0, ""]],
    ["_task_id", "", [""]],
    ["_destination", [], [objNull, []]],
    ["_location", "", [""]]
];

private _description = _task_id;
private _type = "";
switch (_task_type) do {
    case 0 : {
        _description = "missionDefeat";
        _type = "kill";
    };
    case 1 : {
        _description = "missionDestroy";
        _type = "destroy";
    };
    case 2 : {
        _description = "missionSeize";
        _type = "move";
    };
    case 3 : {
        _description = "sideSupplies";
        _type = "container";
    };
    case 4 : {
        _description = "sideMines";
        _type = "mine";
    };
    case 5 : {
        _description = "sideVehicle";
        _type = "repair";
    };
    case 6 : {
        _description = "sideConquer";
        _type = "attack";
    };
    case 7 : {
        _description = "sideTower";
        _type = "destroy";
    };
    case 8 : {
        _description = "sideCivTreat";
        _type = "heal";
    };
    case 9 : {
        _description = "sideCheckpoint";
        _type = "destroy";
    };
    case 10 : {
        _description = "sideCivTreatBoat";
        _type = "heal";
    };
    case 11 : {
        _description = "sideUnderwater";
        _type = "destroy";
    };
    case 12 : {
        _description = "sideConvoy";
        _type = "attack";
    };
    case 13 : {
        _description = "sideResc";
        _type = "heli";
    };
    case 14 : {
        _description = "sideCapOff";
        _type = "run";
    };
    case 15 : {
        _description = "sideHostage";
        _type = "exit";
    };
    case 16 : {
        _description = "sideHack";
        _type = "defend";
    };
};

[btc_player_side, [_task_id]] call BIS_fnc_taskCreate;
[[_task_id], btc_player_side, _description, _destination, 2, false, _type] remoteExecCall ["btc_fnc_task_setDescription", [0, -2] select isDedicated, true];