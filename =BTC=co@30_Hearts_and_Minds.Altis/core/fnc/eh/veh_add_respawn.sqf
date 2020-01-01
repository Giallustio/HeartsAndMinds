
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_veh_add_respawn

Description:
    Add a vehicle to the respawn system and save vehicle parameters.

Parameters:
    _vehicle - Vehicle to add inside the respawn system. [Object]
    _time - Time before respawn. [Number]
    _has_marker - Unused. [Boolean]
    _helo - Array of respawning vehicles. [Array]

Returns:
    _handle - Value of the MPEventhandle. [Number]

Examples:
    (begin example)
        [cursorObject, 30, false] call btc_fnc_eh_veh_add_respawn;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_vehicle", objNull, [objNull]],
    ["_time", 0, [0]],
    ["_has_marker", false, [false]],
    ["_helo", btc_helo, [[]]]
];

_helo pushBackUnique _vehicle;

private _type = typeOf _vehicle;
private _pos = getPosASL _vehicle;
private _dir = getDir _vehicle;
private _customization = [_vehicle] call BIS_fnc_getVehicleCustomization;
private _vector = [vectorDir _vehicle, vectorUp _vehicle];
private _isMedicalVehicle = [_vehicle] call ace_medical_treatment_fnc_isMedicalVehicle;
private _isRepairVehicle = [_vehicle] call ace_repair_fnc_isRepairVehicle;
private _fuelSource = [
    [_vehicle] call ace_refuel_fnc_getFuel,
    _vehicle getVariable ["ace_refuel_hooks", []]
];
private _pylons = getPylonMagazines _vehicle;

_vehicle setVariable ["data_respawn", [_type, _pos, _dir, _time, _has_marker, _customization, _vector, _isMedicalVehicle, _isRepairVehicle, _fuelSource, _pylons]];

if ((isNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "ace_fastroping_enabled")) && !(typeOf _vehicle isEqualTo "RHS_UH1Y_d")) then {[_vehicle] call ace_fastroping_fnc_equipFRIES};
_vehicle addMPEventHandler ["MPKilled", {if (isServer) then {[_this select 0] call btc_fnc_eh_veh_respawn};}];
