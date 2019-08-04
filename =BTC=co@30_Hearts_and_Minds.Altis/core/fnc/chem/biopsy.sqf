
/* ----------------------------------------------------------------------------
Function: btc_fnc_chem_biopsy

Description:
    Do a biopsy to determine if the object is contaminated.

Parameters:
    _data - Data collected. [Array]
    _success - Does the biopsy has been correctly done. [Boolean]

Returns:

Examples:
    (begin example)
        [[player, "head", 50], true] call btc_fnc_chem_biopsy;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_data", [], [[]]],
    ["_success", false, [true]]
];

if !(_success) exitWith {_this};

private _obj = _data select 0;
private _contaminated = btc_int_ask_data;

([
    "Not contaminated",
    "Contaminated"
] select (_obj in _contaminated)) call CBA_fnc_notify;

_this
