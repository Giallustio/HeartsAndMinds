
/* ----------------------------------------------------------------------------
Function: btc_fnc_db_saveObjectStatus

Description:
    Save all data from an object like position, ACE cargo, inventory ...

Parameters:
    _object - Object to get data. [Object]

Returns:
    _data - Data array (type, position, direction ...). [Array]

Examples:
    (begin example)
        [cursorObject] call btc_fnc_db_saveObjectStatus;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_object", objNull, [objNull]]
];

private _data = [];
_data pushBack (typeOf _object);
_data pushBack (getPosWorld _object);
_data pushBack (getDir _object);
_data pushBack (_object getVariable ["ace_rearm_magazineClass", ""]);
//Cargo
private _cargo = [];
{
    _cargo pushBack (if (_x isEqualType "") then {
        [_x, "", [[], [], []]]
    } else {
        [
            typeOf _x,
            _x getVariable ["ace_rearm_magazineClass", ""],
            _x call btc_fnc_log_getInventory,
            _x in btc_chem_contaminated
        ]
    });
} forEach (_object getVariable ["ace_cargo_loaded", []]);
_data pushBack _cargo;
//Inventory
private _cont = _x call btc_fnc_log_getInventory;
_data pushBack _cont;
_data pushBack [vectorDir _object, vectorUp _object];
_data pushBack (_object in btc_chem_contaminated);

_data
