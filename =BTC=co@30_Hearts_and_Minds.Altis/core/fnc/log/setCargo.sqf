
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_setCargo

Description:
    Clear cargo of all item weapon.

Parameters:
    _object - Object which cargo will be cleared. [Object]

Returns:

Examples:
    (begin example)
        [cursorObject, [cursorObject] call btc_fnc_log_getCargo] call btc_fnc_log_setCargo;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */
btc_fnc_log_setCargo = {
params [
    ["_object", objNull, [objNull]],
    ["_inventory", [], [[]]]
];

clearWeaponCargoGlobal _object;
clearItemCargoGlobal _object;
clearMagazineCargoGlobal _object;
clearBackpackCargoGlobal _object;

_inventory params [
    ["_magazines", [], [[]]],
    ["_weapons", [], [[]]],
    ["_items", [], [[]]],
    ["_everyContainer", [], [[]]]
];

{
    _object addMagazineCargoGlobal [_x, (_magazines select 1) select _forEachIndex];
} forEach (_magazines select 0);

{
    _object addWeaponWithAttachmentsCargoGlobal [_weapons, 1];
} forEach _weapons;

{
    private _containerType = _x select 0;
    if (_containerType in _items) then {
        _object addItemCargoGlobal [_containerType, 1];
        _items deleteAt (_items find _containerType);
    } else {
        _object addBackpackCargoGlobal [_containerType, 1];
    };
    private _newContainer = everyContainer _object;
    [(_newContainer select (count _newContainer -1)) select 1, _x select 1] call btc_fnc_log_setCargo;
} forEach _everyContainer;

{
    _object addItemCargoGlobal [_x, 1];
} forEach _items;

};
[cursorObject, [cursorObject] call btc_fnc_log_getCargo] call btc_fnc_log_setCargo;
