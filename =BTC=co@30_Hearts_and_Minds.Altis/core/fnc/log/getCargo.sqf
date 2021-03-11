
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_getCargo

Description:
    Clear cargo of all item weapon.

Parameters:
    _object - Object which cargo will be cleared. [Object]

Returns:

Examples:
    (begin example)
        [cursorObject] call btc_fnc_log_getCargo;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */
btc_fnc_log_getCargo = {
params [
    ["_object", objNull, [objNull]]
];

private _everyContainer = everyContainer _object;
{
    _x set [1, (_x select 1) call btc_fnc_log_getCargo];
} forEach _everyContainer;

[
    getMagazineCargo _object,
    weaponsItemsCargo _object,
    itemCargo _object,
    _everyContainer
]
};
[cursorObject] call btc_fnc_log_getCargo;