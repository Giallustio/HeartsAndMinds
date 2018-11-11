
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_drone_fire

Description:
    Fill me when you edit me !

Parameters:
    _trigger - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_ied_drone_fire;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_trigger", objNull, [objNull]]
];
private _driver_drone = _trigger getVariable "btc_ied_drone";

_driver_drone forceWeaponFire ["BombDemine_01_F", "BombDemine_01_F"];
