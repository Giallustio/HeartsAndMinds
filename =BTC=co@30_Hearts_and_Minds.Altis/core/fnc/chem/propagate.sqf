
/* ----------------------------------------------------------------------------
Function: btc_fnc_chem_propagate

Description:
    Propagate from the item or vehicle contaminated to the item or vehicle not contaminated.

Parameters:
    _item - Item. [Object]
    _vehicle - Vehicle. [Object]

Returns:

Examples:
    (begin example)
        [cursorObject, vehicle player] call btc_fnc_chem_propagate;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_item", objNull, [objNull]],
    ["_vehicle", objNull, [objNull]]
];

private _object = if (_item in btc_chem_contaminated) then {
    _vehicle
} else {
    _item
};

if ((btc_chem_contaminated pushBackUnique _object) > -1) then {
    publicVariable "btc_chem_contaminated";
};

_this
