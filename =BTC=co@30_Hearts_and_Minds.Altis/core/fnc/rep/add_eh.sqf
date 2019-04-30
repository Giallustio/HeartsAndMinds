
/* ----------------------------------------------------------------------------
Function: btc_fnc_rep_add_eh

Description:
    Fill me when you edit me !

Parameters:
    _civilian - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_rep_add_eh;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_civilian", objNull, [objNull]]
];

[_civilian, "HandleDamage", "btc_fnc_rep_hd"] call btc_fnc_eh_persistantOnLocalityChange;
[_civilian, "Killed", "btc_fnc_rep_killed"] call btc_fnc_eh_persistantOnLocalityChange;
[_civilian, "FiredNear", "btc_fnc_rep_firednear"] call btc_fnc_eh_persistantOnLocalityChange;
