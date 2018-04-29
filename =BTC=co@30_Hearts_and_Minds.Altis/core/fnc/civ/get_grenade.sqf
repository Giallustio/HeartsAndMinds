params ["_pos", "_range", ["_units", []]];

if (_units isEqualTo []) then {
    _units = _pos nearEntities [btc_civ_type_units, _range];
};

_units = (_units select {side _x isEqualTo civilian});

if (_units isEqualTo []) exitWith {};

{
    if (btc_debug_log) then {diag_log format ["fnc_civ_get_grenade %1 - %2", _x, side _x];};

    _x call btc_fnc_rep_remove_eh;

    [_x] call btc_fnc_civ_add_grenade;

    [_x] joinSilent createGroup [btc_enemy_side, true];

    (group _x) setVariable ["getWeapons", true];

    (group _x) setBehaviour "AWARE";
    [group _x, _pos, 10, "GUARD", "UNCHANGED", "RED"] call CBA_fnc_addWaypoint;
} forEach [selectRandom _units];
