
/* ----------------------------------------------------------------------------
Function: btc_fnc_tow_ViV

Description:
    Move selected vehicle in the tower cargo with an hiden vehicle.

Parameters:
    _vehicle_selected - Vehicle to store in the tower cargo. [Object]
    _tower - Tower vehicle with cargo space to handle the hiden vehicle. [Object]

Returns:

Examples:
    (begin example)
        [btc_tow_vehicleSelected, cursorObject] call btc_fnc_tow_ViV;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_vehicle_selected", objNull, [objNull]],
    ["_tower", objNull, [objNull]]
];

private _hideVehicle = createVehicle ["B_T_LSV_01_unarmed_F", _vehicle_selected, [], 0, "CAN_COLLIDE"];
_hideVehicle hideObjectGlobal true;

private _model_selected = (0 boundingBoxReal _vehicleSelected) select 1;
private _model_flat = (0 boundingBoxReal _hideVehicle) select 1;
private _attachTo = [
    0,
    (_model_flat select 1) - (_model_selected select 1),
    (_model_selected select 2) - (_model_flat select 2)
];
_vehicle_selected attachTo [_hideVehicle, _attachTo];

if (_tower setVehicleCargo _hideVehicle) then {
    [{isNull isVehicleCargo _this}, {
        deleteVehicle _this;
    }, _hideVehicle] call CBA_fnc_waitUntilAndExecute;
} else {
    deleteVehicle _hideVehicle;
};
