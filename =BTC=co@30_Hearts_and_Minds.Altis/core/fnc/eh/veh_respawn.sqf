
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_veh_respawn

Description:
    Fill me when you edit me !

Parameters:
    _vehicle - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_eh_veh_respawn;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_vehicle", objNull, [objNull]]
];

private _data = _vehicle getVariable ["data_respawn", []];

[_vehicle, _data] spawn {
    params ["_vehicle", "_data"];
    _data params [
        "_type",
        "_pos",
        "_dir",
        "_time",
        "_has_marker",
        ["_customization", [false, false], [[]]],
        ["_isMedicalVehicle", false, [true]],
        ["_isRepairVehicle", false, [true]],
        ["_fuelSource", [], [[]]],
        ["_pylons", [], [[]]]
    ];

    sleep _time;
    deleteVehicle _vehicle;
    sleep 1;
    private _vehicle = _type createVehicle _pos;
    [_vehicle, _customization select 0, _customization select 1] call BIS_fnc_initVehicle;
    _vehicle setDir _dir;
    _vehicle setPosASL _pos;

    if (_isMedicalVehicle && {!([_vehicle] call ace_medical_fnc_isMedicalVehicle)}) then {
        _vehicle setVariable ["ace_medical_medicclass", 1, true];
    };
    if (_isRepairVehicle && {!([_vehicle] call ace_repair_fnc_isRepairVehicle)}) then {
        _vehicle setVariable ["ACE_isRepairVehicle", _isRepairVehicle, true];
    };
    if !(_fuelSource isEqualTo []) then {
        _fuelSource params [
            ["_fuelCargo", 0, [0]],
            ["_hooks", nil, [[]]]
        ];
        if ((!isNil "_hooks") && {!(_hooks isEqualTo (_vehicle getVariable ["ace_refuel_hooks", []]))}) then {
            [_vehicle, _fuelCargo, _hooks] call ace_refuel_fnc_makeSource;
        } else {
            if (_fuelCargo != [_vehicle] call ace_refuel_fnc_getFuel) then {
                [_vehicle, _fuelCargo] call ace_refuel_fnc_makeSource;
            };
        };
    };
    if !(_pylons isEqualTo []) then {
        private _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> typeOf _vehicle >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
        {
            _vehicle removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon")
        } forEach getPylonMagazines _vehicle;
        {
            _vehicle setPylonLoadOut [_forEachIndex + 1, _x, true, _pylonPaths select _forEachIndex]
        } forEach _pylons;
    };

    [_vehicle, _time, _has_marker] spawn btc_fnc_eh_veh_add_respawn;
};
