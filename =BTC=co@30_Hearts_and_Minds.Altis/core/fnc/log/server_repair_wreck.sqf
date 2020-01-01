
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_server_repair_wreck

Description:
    Repair wreck.

Parameters:
    _veh - Vehicle to repair. [Object]

Returns:

Examples:
    (begin example)
        _veh = [my_vehicle] call btc_fnc_log_server_repair_wreck;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_veh", objNull, [objNull]]
];

private _type = typeOf _veh;
(getPosASL _veh) params ["_x", "_y", "_z"];
private _dir = getDir _veh;
private _customization = [_veh] call BIS_fnc_getVehicleCustomization;
private _marker = _veh getVariable ["marker", ""];
private _isMedicalVehicle = [_veh] call ace_medical_treatment_fnc_isMedicalVehicle;
private _isRepairVehicle = [_veh] call ace_repair_fnc_isRepairVehicle;
private _fuelSource = [
    [_veh] call ace_refuel_fnc_getFuel,
    _veh getVariable ["ace_refuel_hooks", []]
];
private _pylons = getPylonMagazines _veh;

btc_vehicles = btc_vehicles - [_veh];

if (_marker != "") then {
    deleteMarker _marker;
    remoteExec ["", _marker];
};
deleteVehicle _veh;
sleep 1;
_veh = [_type, [_x, _y, 0.5 + _z], _dir, _customization, _isMedicalVehicle, _isRepairVehicle, _fuelSource, _pylons] call btc_fnc_log_createVehicle;

_veh
