
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_setCargo

Description:
    Clear cargo of all item weapon.

Parameters:
    _object - Object which cargo will be cleared. [Object]

Returns:

Examples:
    (begin example)
        [vehicle player] call btc_fnc_log_setCargo;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_objects", objNull, [objNull]],
    ["_inventory", [], [[]]]
];

clearWeaponCargoGlobal _objects;
clearItemCargoGlobal _objects;
clearMagazineCargoGlobal _objects;

_inventory params [
    ["_weap_obj", [], [[]]],
    ["_mags_obj", [], [[]]],
    ["_items_obj", [], [[]]]
];

if !(_weap_obj isEqualTo []) then {
    for "_i" from 0 to ((count (_weap_obj select 0)) - 1) do {
        _objects addWeaponCargoGlobal [(_weap_obj select 0) select _i, (_weap_obj select 1) select _i];
    };
};

if !(_mags_obj isEqualTo []) then {
    for "_i" from 0 to ((count (_mags_obj select 0)) - 1) do {
        _objects addMagazineCargoGlobal [(_mags_obj select 0) select _i, (_mags_obj select 1) select _i];
    };
};

if !(_items_obj isEqualTo []) then {
    for "_i" from 0 to ((count (_items_obj select 0)) - 1) do {
        _objects addItemCargoGlobal [(_items_obj select 0) select _i, (_items_obj select 1) select _i];
    };
};
