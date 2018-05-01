params [
    "_group",
    ["_pos", [0, 0, 0]],
    ["_number", 0],
    ["_pos_iswater", false],
    ["_type_units", btc_type_units],
    ["_type_divers", btc_type_divers]
];

for "_i" from 0 to _number do {
    private _unit_type = if (_pos_iswater) then {
        selectRandom _type_divers;
    } else {
        selectRandom _type_units;
    };
    [_group createUnit [_unit_type, _pos, [], 0, "CARGO"]] joinSilent _group;

    if (canSuspend) then {
        sleep 1;
    };
};

_group
