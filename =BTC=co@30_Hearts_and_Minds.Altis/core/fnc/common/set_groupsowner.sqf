
/* ----------------------------------------------------------------------------
Function: btc_fnc_common_set_groupsowner

Description:
    Fill me when you edit me !

Parameters:
    _group_array - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_common_set_groupsowner;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_group_array", btc_patrol_active, [[]]]
];

_group_array apply {[_x] call btc_fnc_set_groupowner;};
