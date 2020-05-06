
/* ----------------------------------------------------------------------------
Function: btc_fnc_tow_ropeCreate

Description:
    Tow a vehicle.

Parameters:
    _tower - Vehicle. [Object]

Returns:
    _thisId - ID of the event handler. [Number]

Examples:
    (begin example)
        [cursorObject] call btc_fnc_tow_ropeCreate;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_tower", objNull, [objNull]]
];

if !((isVehicleCargo btc_log_vehicle_selected) isEqualTo objNull) exitWith {(localize "STR_BTC_HAM_LOG_TOW_ALREADYTOWED") call CBA_fnc_notify;};
if (_tower setVehicleCargo btc_log_vehicle_selected) exitWith {};

private _towing = _tower getVariable ["btc_towing", objNull];
if (!isNull _towing) exitWith {(localize "STR_BTC_HAM_LOG_TOW_ALREADYTOWED") call CBA_fnc_notify;};

private _model_rear_tower = ([_tower] call btc_fnc_tow_hitch_points) select 1;
private _model_front_selected = ([btc_log_vehicle_selected] call btc_fnc_tow_hitch_points) select 0;
private _relative_pos = - (_model_front_selected select 1) + (_model_rear_tower select 1) - ((btc_log_vehicle_selected modelToWorld _model_front_selected) distance (_tower modelToWorld _model_rear_tower));
private _attachTo_pos = if (_tower isKindOf "Ship") then {
    [0, (-(_model_front_selected select 1) + (_model_rear_tower select 1) - 3), 0]
} else {
    [0, _relative_pos, 0.2 + ((btc_log_vehicle_selected modelToWorld [0, 0, 0]) select 2) - ((_tower modelToWorld [0, 0, 0]) select 2)]
};

btc_log_vehicle_selected attachTo [_tower, _attachTo_pos];

private _pos_rear = _tower modelToWorld _model_rear_tower;
private _pos_front = btc_log_vehicle_selected modelToWorld _model_front_selected;
private _distance = 0.3 + (_pos_front distance _pos_rear);
(_tower worldToModel _pos_front) params ["_model_front_selected_x", "_model_front_selected_y", "_model_front_selected_z"];

ropeCreate [_tower, _model_rear_tower, _tower, [_model_front_selected_x - 0.4, _model_front_selected_y, _model_front_selected_z], _distance];
ropeCreate [_tower, _model_rear_tower, _tower, [_model_front_selected_x + 0.4, _model_front_selected_y, _model_front_selected_z], _distance];

_tower setVariable ["btc_towing", btc_log_vehicle_selected, true];
btc_log_vehicle_selected setVariable ["btc_towing", _tower, true];

[_tower, "RopeBreak", {
    params ["_tower", "_rope"];
    _thisArgs params ["_towed"];

    _tower removeEventHandler ["RopeBreak", _thisId];

    deTach _towed;

    (getPos _towed) params ["_x", "_y", "_z"];

    if (_z < -0.05) then {
        _towed setPosASL [_x, _y, ((getPosASL _tower) select 2) - _z];
    } else {
        [_towed, [0, 0, 0.01]] remoteExecCall ["setVelocity", _towed];
    };

    _towed setVariable ["btc_towing", objNull, true];
    _tower setVariable ["btc_towing", objNull, true];
}, [btc_log_vehicle_selected]] call CBA_fnc_addBISEventHandler;
