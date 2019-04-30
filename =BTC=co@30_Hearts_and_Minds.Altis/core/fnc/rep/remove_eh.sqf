
/* ----------------------------------------------------------------------------
Function: btc_fnc_rep_remove_eh

Description:
    Fill me when you edit me !

Parameters:
    _civilian - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_rep_remove_eh;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_civilian", objNull, [objNull]]
];

if (local _civilian) then {
    [_civilian, "HandleDamage", "btc_fnc_rep_hd"] call btc_fnc_eh_removePersistantOnLocalityChange;
    [_civilian, "Killed", "btc_fnc_rep_killed"] call btc_fnc_eh_removePersistantOnLocalityChange;
    [_civilian, "FiredNear", "btc_fnc_rep_firednear"] call btc_fnc_eh_removePersistantOnLocalityChange;
} else {
    _civilian remoteExecCall ["btc_fnc_rep_remove_eh", _civilian];
}
