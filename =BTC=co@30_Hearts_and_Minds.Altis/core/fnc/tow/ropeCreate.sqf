
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
    ["_tower", objNull, [objNull]],
    ["_vehicle_selected", btc_log_vehicle_selected, [objNull]]
];

private _distanceCheck = [_tower, _vehicle_selected] call btc_fnc_tow_check;
if (false in _distanceCheck) exitWith {
    switch (_distanceCheck) do {
        case [true, false]: {
            "too far" call CBA_fnc_notify;
        };
        case [false,true]: {
            "too close" call CBA_fnc_notify;
        };
        default {
            private _string_array = "";
            {
                _string_array = _string_array + ", " + _x;
            } forEach (([_tower] call btc_fnc_log_get_nottowable) - ["Truck_F"]);

            (format [localize "STR_BTC_HAM_LOG_HOOK_HINFO", _string_array]) call CBA_fnc_notify;
        };
    };
};

private _towing = _tower getVariable ["btc_towing", objNull];
if (
    !((isVehicleCargo _vehicle_selected) isEqualTo objNull) ||
    !isNull _towing
) exitWith {(localize "STR_BTC_HAM_LOG_TOW_ALREADYTOWED") call CBA_fnc_notify;};
if (_tower setVehicleCargo _vehicle_selected) exitWith {};

"Towing in progress, please wait..." call CBA_fnc_notify;

private _vectorUp = vectorUp _vehicle_selected;
private _dirSelected = getDir _vehicle_selected;
private _model_selected = (0 boundingBoxReal _vehicle_selected) select 1;
private _model_front_selected = ([_vehicle_selected] call btc_fnc_log_get_corner_points) select 2;
private _posFlat = _vehicle_selected getPos [(_model_front_selected select 1) - (_model_selected select 1), _dirSelected];
_posFlat set [2, (getPosATL _vehicle_selected) select 2];

private _flat = createVehicle ["Truck_01_Rack_F", _posFlat, [], 0, "CAN_COLLIDE"];
_flat setDir _dirSelected;
_flat setVectorUp _vectorUp;

private _model_corners_tower = [_tower] call btc_fnc_log_get_corner_points;
private _model_corners_flat = [_flat] call btc_fnc_log_get_corner_points;
private _model_flat = (0 boundingBoxReal _flat) select 1;
private _attachTo = [0, (_model_flat select 1) - (_model_selected select 1), (_model_selected select 2) - (_model_flat select 2)];

_vehicle_selected attachTo [_flat, _attachTo];
private _rope1 = ropeCreate [_tower, (_model_corners_tower select 0) vectorAdd [0, -1, 2], _flat, (_model_corners_flat select 2) vectorAdd [0, 0.05, 0.6]];
private _rope2 = ropeCreate [_tower, (_model_corners_tower select 1) vectorAdd [0, -1, 2], _flat, (_model_corners_flat select 3) vectorAdd [0, 0.05, 0.6]];
private _shortRope = [_rope1, _rope2] select (ropeLength _rope1 > ropeLength _rope2);
ropeUnwind [_shortRope, 2, ropeLength _rope1 max ropeLength _rope2, false];

_tower setVariable ["btc_towing", _vehicle_selected, true];
_vehicle_selected setVariable ["btc_towing", _tower, true];

[_tower, "RopeBreak", {
    params ["_tower", "_rope", "_flat"];
    _thisArgs params ["_vehicle_selected"];

    _tower removeEventHandler ["RopeBreak", _thisId];

    deleteVehicle _flat;
    deTach _vehicle_selected;
    _vehicle_selected setVectorUp surfaceNormal position _vehicle_selected;

    _vehicle_selected setVariable ["btc_towing", objNull, true];
    _tower setVariable ["btc_towing", objNull, true];
}, [_vehicle_selected]] call CBA_fnc_addBISEventHandler;

[{
    params ["_flat", "_rope1", "_rope2"];

    [_flat, _rope1, _rope2,
         (_flat call BIS_fnc_getPitchBank) select 0
    ] call btc_fnc_tow_unwind;
}, [_flat, _rope1, _rope2], 2] call CBA_fnc_waitAndExecute;

btc_log_vehicle_selected = objNull;
