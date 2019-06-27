
/* ----------------------------------------------------------------------------
Function: btc_fnc_set_groupsowner

Description:
    Transfert groups to a headless client.

Parameters:
    _group_array - Array of groups to transfert. [Array]

Returns:

Examples:
    (begin example)
        [] call btc_fnc_set_groupsowner;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_group_array", btc_patrol_active, [[]]]
];

_group_array apply {[_x] call btc_fnc_set_groupowner;};
