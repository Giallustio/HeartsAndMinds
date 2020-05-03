
/* ----------------------------------------------------------------------------
Function: btc_fnc_tow_check

Description:
    _tower ----rope--- (hook)_towed

Parameters:
    _tower - Tower vehicle. [Object]
    _towed - Tower vehicle. [Object]

Returns:
    _canTow - . [Array]

Examples:
    (begin example)
        _canTow = [cursorObject, btc_log_vehicle_selected] call btc_fnc_tow_check;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_tower", objNull, [objNull]],
    ["_towed", objNull, [objNull]]
];

private _array = [_tower] call btc_fnc_log_get_nottowable;

if ((_array findIf {_towed isKindOf _x}) != -1) exitWith {[false, false]};

private _model_rear = ([_tower] call btc_fnc_tow_hitch_points) select 1;
private _model_front = ([_towed] call btc_fnc_tow_hitch_points) select 0;
private _distance = (_towed modeltoworld _model_front) distance (_tower modeltoworld _model_rear);

[_distance > 1.3, _distance < 5]
