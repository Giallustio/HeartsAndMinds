
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_createVehicle

Description:
    Creates an empty object of given classname type.

Parameters:
    _type - Vehicle className. [String]
    _pos -  Desired placement position. If the exact position is occupied, nearest empty position is used. [Array]
    _dir - Desired direction. [Number]
    _customization - Customized appearance [Array]
    _isMedicalVehicle - Set the ACE parameter is a medical vehicle. [Boolean]
    _isRepairVehicle - Set the ACE parameter is a repair vehicle. [Boolean]
    _fuelSource - Define the ACE cargo fuel source. [Array]
    _pylons - Set pylon loadout. [Array]

Returns:

Examples:
    (begin example)
        _veh = ["vehicle_class_name", getPos player] call btc_fnc_log_createVehicle;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_type", "", [""]],
    ["_pos", [0, 0, 0], [[]]],
    ["_dir", 0, [0]],
    ["_customization", [false, false], [[]]],
    ["_isMedicalVehicle", false, [true]],
    ["_isRepairVehicle", false, [true]],
    ["_fuelSource", [], [[]]],
    ["_pylons", [], [[]]]
];

private _veh  = createVehicle [_type, ASLToATL _pos, [], 0, "CAN_COLLIDE"];
_veh setDir _dir;
_veh setPosASL _pos;
[_veh, _customization select 0, _customization select 1] call BIS_fnc_initVehicle;
if (_isMedicalVehicle && {!([_veh] call ace_medical_treatment_fnc_isMedicalVehicle)}) then {
    _veh setVariable ["ace_medical_isMedicalVehicle", _isMedicalVehicle, true];
};
if (_isRepairVehicle && {!([_veh] call ace_repair_fnc_isRepairVehicle)}) then {
    _veh setVariable ["ACE_isRepairVehicle", _isRepairVehicle, true];
};
if !(_fuelSource isEqualTo []) then {
    _fuelSource params [
        ["_fuelCargo", 0, [0]],
        ["_hooks", nil, [[]]]
    ];
    if ((!isNil "_hooks") && {!(_hooks isEqualTo (_veh getVariable ["ace_refuel_hooks", []]))}) then {
        [_veh, _fuelCargo, _hooks] call ace_refuel_fnc_makeSource;
    } else {
        if (_fuelCargo != [_veh] call ace_refuel_fnc_getFuel) then {
            [_veh, _fuelCargo] call ace_refuel_fnc_makeSource;
        };
    };
};
if !(_pylons isEqualTo []) then {
    private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
    {
        _veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon")
    } forEach getPylonMagazines _veh;
    {
        _veh setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]
    } forEach _pylons;
};

_veh setVariable ["btc_dont_delete", true];

if (getNumber(configFile >> "CfgVehicles" >> typeOf _veh >> "isUav") isEqualTo 1) then {
    createVehicleCrew _veh;
};

_veh call btc_fnc_db_add_veh;

_veh
