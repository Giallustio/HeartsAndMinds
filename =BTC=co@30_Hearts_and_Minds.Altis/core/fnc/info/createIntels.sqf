
/* ----------------------------------------------------------------------------
Function: btc_fnc_info_createIntels

Description:
    Create intels in a city.

Parameters:
    _city - City to create intels. [Object]

Returns:

Examples:
    (begin example)
        [] call btc_fnc_info_createIntels;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_city", objNull, [objNull]]
];

private _houses = +(_city getVariable ["btc_city_houses", []]);

_houses = _houses select [0, count _houses];

private _intels = _houses apply {
    createVehicle [selectRandom btc_info_intels, ASLToATL AGLToASL selectRandom (_x buildingPos -1), [], 0, "CAN_COLLIDE"];
};
_city setVariable ["btc_city_intels", _intels];
