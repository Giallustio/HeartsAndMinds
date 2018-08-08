params [
    ["_group_array", btc_patrol_active, [[]]]
];

_group_array apply {[_x] call btc_fnc_set_groupowner;};
