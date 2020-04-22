
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

private _towing = _tower getVariable ["btc_towing", objNull];
if (
    !((isVehicleCargo btc_log_vehicle_selected) isEqualTo objNull) ||
    !isNull _towing
) exitWith {(localize "STR_BTC_HAM_LOG_TOW_ALREADYTOWED") call CBA_fnc_notify;};
if (_tower setVehicleCargo btc_log_vehicle_selected) exitWith {};

private _flat = createVehicle ["Truck_01_Rack_F", getPosATL btc_log_vehicle_selected, [], 0, "CAN_COLLIDE"];
_flat setDir getDir btc_log_vehicle_selected;
//_flat setObjectTextureGlobal [0, ""];
//_flat setObjectTextureGlobal [1, ""];

private _model_corners_tower = [_tower] call btc_fnc_log_get_corner_points;
private _model_corners_flat = [_flat] call btc_fnc_log_get_corner_points;
private _model_selected = (0 boundingBoxReal btc_log_vehicle_selected) select 1;
private _model_flat = (0 boundingBoxReal _flat) select 1;
private _attachTo = [0, (_model_flat select 1) - (_model_selected select 1), (_model_selected select 2) - (_model_flat select 2) + 0.2];

btc_log_vehicle_selected attachTo [_flat, _attachTo];
private _rope1 = ropeCreate [_tower, (_model_corners_tower select 0) vectorAdd [0, -2, 2], _flat, (_model_corners_flat select 2) vectorAdd [0.2, 0.05, 0.6]];
private _rope2 = ropeCreate [_tower, (_model_corners_tower select 1) vectorAdd [0, -2, 2], _flat, (_model_corners_flat select 3) vectorAdd [-0.2, 0.05, 0.6]];
private _shortRope = [_rope1, _rope2] select (ropeLength _rope1 > ropeLength _rope2);
ropeUnwind [_shortRope, 2, ropeLength _rope1 max ropeLength _rope2, false];

_tower setVariable ["btc_towing", btc_log_vehicle_selected, true];
btc_log_vehicle_selected setVariable ["btc_towing", _tower, true];

[_tower, "RopeBreak", {
    params ["_tower", "_rope", "_flat"];
    _thisArgs params ["_vehicle_selected"];

    _tower removeEventHandler ["RopeBreak", _thisId];

    deleteVehicle _flat;
    deTach _vehicle_selected;
    _vehicle_selected setVectorUp surfaceNormal position _vehicle_selected;

    _vehicle_selected setVariable ["btc_towing", objNull, true];
    _tower setVariable ["btc_towing", objNull, true];
}, [btc_log_vehicle_selected]] call CBA_fnc_addBISEventHandler;

[{
    params ["_flat", "_rope1", "_rope2"];

    [_flat, _rope1, _rope2,
         (_flat call BIS_fnc_getPitchBank) select 0
    ] call btc_fnc_tow_unwind;
}, [_flat, _rope1, _rope2], 2] call CBA_fnc_waitAndExecute;

btc_log_vehicle_selected = objNull;
