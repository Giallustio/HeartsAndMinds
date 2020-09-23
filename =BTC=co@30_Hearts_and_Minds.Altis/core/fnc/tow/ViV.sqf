
/* ----------------------------------------------------------------------------
Function: btc_fnc_tow_ViV

Description:
    Move selected vehicle in the tower cargo with an hiden vehicle.

Parameters:
    _vehicleSelected - Vehicle to store in the tower cargo. [Object]
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
    ["_vehicleSelected", objNull, [objNull]],
    ["_tower", objNull, [objNull]]
];

private _hideVehicle = createVehicle ["Land_Cargo10_red_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_hideVehicle hideObjectGlobal true;

private _model_selected = (0 boundingBoxReal _vehicleSelected) select 1;
private _model_hide = (0 boundingBoxReal _hideVehicle) select 1;
private _attachTo = [
    0,
    ((_model_hide select 1) - (_model_selected select 1)) + 0.9,
    (_model_selected select 2) - (_model_hide select 2) - 0.2
];
_vehicleSelected attachTo [_hideVehicle, _attachTo];

if (_tower setVehicleCargo _hideVehicle) then {
    [{isNull isVehicleCargo (_this select 0)}, {
        params ["_hideVehicle", "_vehicleSelected"];

        private _pos = getPosWorld _vehicleSelected;
        _pos set [2, (_pos select 2) + 0.3];

        detach _vehicleSelected;
        deleteVehicle _hideVehicle;

        _vehicleSelected setPosWorld _pos;
        [_vehicleSelected, [0, 0, 0.01]] remoteExecCall ["setVelocity", _vehicleSelected]; // Activate physic
    }, [_hideVehicle, _vehicleSelected]] call CBA_fnc_waitUntilAndExecute;
} else {
    deleteVehicle _hideVehicle;
};
