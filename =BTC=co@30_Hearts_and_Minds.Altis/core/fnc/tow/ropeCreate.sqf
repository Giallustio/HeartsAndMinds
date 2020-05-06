
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
    ["_vehicle_selected", btc_tow_vehicleSelected, [objNull]]
];

if !([_tower, _vehicle_selected] call btc_fnc_tow_check) exitWith {};
if (_tower setVehicleCargo _vehicle_selected) exitWith {};

"Towing in progress, please wait..." call CBA_fnc_notify;

// Find the position of the Flat object
private _vectorUp = vectorUp _vehicle_selected;
private _dirSelected = getDir _vehicle_selected;
private _model_selected = (0 boundingBoxReal _vehicle_selected) select 1;
private _model_front_selected = ([_vehicle_selected] call btc_fnc_log_get_corner_points) select 2;
private _offset = if (_model_selected select 1 > 3.06) then {
    (_model_selected select 1) - 3.06
} else {
    (_model_front_selected select 1) - (_model_selected select 1)
};
private _posFlat = _vehicle_selected getPos [_offset, _dirSelected];
_posFlat set [2, (getPosATL _vehicle_selected) select 2];

private _flatType = ["Truck_01_Rack_F", "Truck_01_Rack_tropic_F"] select (worldName in ["Tanoa", "lingor3", "chernarus", "Enoch", "sara"]);
private _flat = if (_tower isKindOf "Ship") then {
    _tower
} else {
    createVehicle [_flatType, _posFlat, [], 0, "CAN_COLLIDE"]
};
_flat setDir _dirSelected;
_flat setVectorUp _vectorUp;

private _model_corners_tower = [_tower] call btc_fnc_log_get_corner_points;
private _model_corners_flat = [_flat] call btc_fnc_log_get_corner_points;
private _model_flat = (0 boundingBoxReal _flat) select 1;
private _attachTo = [
    0,
    [(_model_flat select 1) - (_model_selected select 1), -(_model_flat select 1) -(_model_selected select 1)] select (_flat isEqualTo _tower),
    (_model_selected select 2) - (_model_flat select 2)
];

_vehicle_selected attachTo [_flat, _attachTo];

private _ropeTowerRelPos1 = (_model_corners_tower select 0) vectorAdd [0, -1, 2];
private _ropeTowerRelPos2 = (_model_corners_tower select 1) vectorAdd [0, -1, 2];
private _ropeFlatRelPos1 = (_model_corners_flat select 2) vectorAdd [0, 0.05, 0.6];
private _ropeFlatRelPos2 = (_model_corners_flat select 3) vectorAdd [0, 0.05, 0.6];

private _rope1 = ropeCreate [_tower, _ropeTowerRelPos1,
    [_flat, _vehicle_selected] select (_tower isKindOf "Ship"),
    _ropeFlatRelPos1,
    (_tower modelToWorld _ropeTowerRelPos1) distance (_flat modelToWorld _ropeFlatRelPos1)
];
private _rope2 = ropeCreate [_tower, _ropeTowerRelPos2,
    [_flat, _vehicle_selected] select (_tower isKindOf "Ship"),
    _ropeFlatRelPos2,
    (_tower modelToWorld _ropeTowerRelPos2) distance (_flat modelToWorld _ropeFlatRelPos2)
];
private _shortRope = [_rope1, _rope2] select (ropeLength _rope1 > ropeLength _rope2);
ropeUnwind [_shortRope, 2, ropeLength _rope1 max ropeLength _rope2, false];

_tower setVariable ["btc_towing", _vehicle_selected, true];
_vehicle_selected setVariable ["btc_towing", _tower, true];
btc_tow_vehicleSelected = objNull;

[_tower, "RopeBreak", {
    params ["_tower", "_rope", "_flat"];
    _thisArgs params ["_vehicle_selected", "_safeDistance"];

    _tower removeEventHandler ["RopeBreak", _thisId];

    deTach _vehicle_selected;

    // Handle flipped vehicle
    if ((vectorUp _vehicle_selected) select 2 < 0) then {
        _flat setPos [0, 0, 0]; // Avoid collision with _vehicle_selected
        private _towerDir = getDir _tower;
        private _selectedSafePos = _tower getPos [- _safeDistance, _towerDir];
        _selectedSafePos set [2, 0.5 + (_selectedSafePos select 2)];
        _vehicle_selected setPos _selectedSafePos;
        _vehicle_selected setDir _towerDir;
    };
    _vehicle_selected setVectorUp surfaceNormal position _vehicle_selected;

    if !(_tower isKindOf "Ship") then {
        deleteVehicle _flat;
    };

    _vehicle_selected setVariable ["btc_towing", objNull, true];
    _tower setVariable ["btc_towing", objNull, true];
}, [_vehicle_selected, 2 + (_model_selected select 1) - (_model_corners_tower select 0 select 1)]] call CBA_fnc_addBISEventHandler;

if (_tower isKindOf "Ship") exitWith {"Towing done." call CBA_fnc_notify};

[{
    params ["_flat", "_rope1", "_rope2"];

    [_flat, _rope1, _rope2,
         (_flat call BIS_fnc_getPitchBank) select 0
    ] call btc_fnc_tow_unwind;
}, [_flat, _rope1, _rope2], 2] call CBA_fnc_waitAndExecute;
