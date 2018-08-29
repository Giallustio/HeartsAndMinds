
/* ----------------------------------------------------------------------------
Function: btc_fnc_civ_add_weapons

Description:
    Fill me when you edit me !

Parameters:
    _unit - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_civ_add_weapons;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]]
];

private _playableUnits = playableUnits inAreaArray [getPosWorld _unit, 50, 50];
_hgun = _playableUnits findIf {[_x, _unit] call btc_fnc_check_los} != -1;

private _weapon = [btc_w_civs select 1, btc_w_civs select 3] select _hgun;
private _magazine = [btc_w_civs select 2, btc_w_civs select 4] select _hgun;

(uniformContainer _unit) addMagazineCargo [_magazine, 10];
_unit addWeapon _weapon;
_unit selectWeapon _weapon;
