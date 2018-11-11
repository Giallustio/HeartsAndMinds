
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_veh_add_respawn

Description:
    Fill me when you edit me !

Parameters:
    _vehicle - [Object]
    _time - [Number]
    _has_marker - [Boolean]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_eh_veh_add_respawn;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_vehicle", objNull, [objNull]],
    ["_time", 0, [0]],
    ["_has_marker", false, [false]]
];

private _type = typeOf _vehicle;
private _pos = getPosASL _vehicle;
private _dir = getDir _vehicle;
private _customization = [_vehicle] call BIS_fnc_getVehicleCustomization;
_vehicle setVariable ["data_respawn", [_type, _pos, _dir, _time, _has_marker, _customization]];

if ((isNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "ace_fastroping_enabled")) && !(typeOf _vehicle isEqualTo "RHS_UH1Y_d")) then {[_vehicle] call ace_fastroping_fnc_equipFRIES};
_vehicle addMPEventHandler ["MPKilled", {if (isServer) then {_this call btc_fnc_eh_veh_respawn};}];
