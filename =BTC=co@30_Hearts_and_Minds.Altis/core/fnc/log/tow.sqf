
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_tow

Description:
    Fill me when you edit me !

Parameters:
    _tower - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_log_tow;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_tower", objNull, [objNull]]
];

btc_int_ask_data = nil;
[4, _tower] remoteExecCall ["btc_fnc_int_ask_var", 2];

waitUntil {!(isNil "btc_int_ask_data")};

if (!isNull btc_int_ask_data) exitWith {hint localize "STR_BTC_HAM_LOG_TOW_ALREADYTOWED";}; //This vehicle is already attached to another!

private _model_rear_tower = ([_tower] call btc_fnc_log_hitch_points) select 1;
private _model_front_selected = ([btc_log_vehicle_selected] call btc_fnc_log_hitch_points) select 0;
private _relative_pos = - (_model_front_selected select 1) + (_model_rear_tower select 1) - ((btc_log_vehicle_selected modelToWorld _model_front_selected) distance (_tower modelToWorld _model_rear_tower));

btc_log_vehicle_selected attachTo [_tower, [0, _relative_pos,  0.2 + ((btc_log_vehicle_selected modelToWorld [0, 0, 0]) select 2) - ((_tower modelToWorld [0, 0, 0]) select 2)]];

private _pos_rear = _tower modelToWorld _model_rear_tower;
private _pos_front = btc_log_vehicle_selected modelToWorld _model_front_selected;
private _distance = 0.3 + (_pos_front distance _pos_rear);
(_tower worldToModel _pos_front) params ["_model_front_selected_x", "_model_front_selected_y", "_model_front_selected_z"];

ropeCreate [_tower, _model_rear_tower, _tower, [_model_front_selected_x - 0.4, _model_front_selected_y, _model_front_selected_z], _distance];
ropeCreate [_tower, _model_rear_tower, _tower, [_model_front_selected_x + 0.4, _model_front_selected_y, _model_front_selected_z], _distance];

private _eh = _tower addEventHandler ["RopeBreak", {
    params ["_rope"];

    _rope removeEventHandler ["RopeBreak", _thisEventHandler];
    _rope setVariable ["btc_eh", nil];
    _rope spawn btc_fnc_log_unhook;
}];
_tower setVariable ["btc_eh", _eh];

[_tower, ["tow", btc_log_vehicle_selected]] remoteExec ["setVariable", 2];
[btc_log_vehicle_selected, ["tow", _tower]] remoteExec ["setVariable", 2];
