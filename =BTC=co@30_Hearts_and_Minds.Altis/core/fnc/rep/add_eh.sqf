
/* ----------------------------------------------------------------------------
Function: btc_fnc_rep_add_eh

Description:
    Add event handler link to the reputation system to a unit not initialised.

Parameters:
    _civilian - Unit. [Object]

Returns:

Examples:
    (begin example)
        [curosrTarget] call btc_fnc_rep_add_eh;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_civilian", objNull, [objNull]]
];

if !((_civilian getVariable ["btc_rep_eh_added", []]) isEqualTo []) exitWith {true};

private _id_d = _civilian addEventHandler ["HandleDamage", btc_fnc_rep_hd];
private _id_k = _civilian addEventHandler ["Killed", btc_fnc_rep_killed];
private _id_f = _civilian addEventHandler ["FiredNear", btc_fnc_rep_firednear];

_civilian setVariable ["btc_rep_eh_added", [_id_d, _id_k, _id_f]];

true
