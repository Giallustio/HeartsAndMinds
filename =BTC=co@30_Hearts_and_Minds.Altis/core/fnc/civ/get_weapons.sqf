
/* ----------------------------------------------------------------------------
Function: btc_fnc_civ_get_weapons

Description:
    Fill me when you edit me !

Parameters:
    _pos - [Array]
    _range - [Number]
    _units - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_civ_get_weapons;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_pos", [0, 0, 0], [[]]],
    ["_range", 300, [0]],
    ["_units", [], [[]]]
];

if (_units isEqualTo []) then {
    _units = _pos nearEntities [btc_civ_type_units, _range];
};

_units = _units select {side _x isEqualTo civilian};

{
    if (btc_debug_log) then {
        [format ["%1 - %2", _x, side _x], __FILE__, [false]] call btc_fnc_debug_message;
    };

    _x call btc_fnc_rep_remove_eh;
    [_x, "", 2] call ace_common_fnc_doAnimation;
    [_x] call btc_fnc_civ_add_weapons;

    [_x] joinSilent createGroup [btc_enemy_side, true];

    (group _x) setVariable ["getWeapons", true];

    (group _x) setBehaviour "AWARE";
    [group _x, getPos _x, 10, "GUARD", "UNCHANGED", "RED"] call CBA_fnc_addWaypoint;
} forEach _units;
