params [
    ["_units", [], [[]]],
    ["_dir", 0, [0]],
    ["_order", 0, [0]],
    ["_wp_pos", [], [[]]]
];

_units = _units select {!(group _x getVariable ["suicider", false]) && ((side _x) isEqualTo civilian)};

{
    private _wp_pos_i = if ((_order isEqualTo 3) && (_wp_pos isEqualTo [])) then {
        [getPos _x, 200, _dir, 40] call CBA_fnc_randPos
    } else {
        _wp_pos
    };
    [_x, _order, _wp_pos_i] spawn btc_fnc_int_orders_behaviour;
} forEach _units;

true
