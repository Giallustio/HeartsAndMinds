params ["_group", ["_pos", getPos leader param [0]] , ["_radius", 50]];

[_group, _pos, 0, "MOVE", "SAFE", "NO CHANGE", "LIMITED"] call CBA_fnc_addWaypoint;

private _houses = [_pos, _radius] call btc_fnc_getHouses;
if !(_houses isEqualTo []) then {
    private _house = selectRandom _houses;
    [_group, _house] call btc_fnc_house_addWP_loop;
    _houses = _houses - [_house];
};

for "_i" from 1 to 4 do {
    private _wp_pos = [_pos, _radius] call btc_fnc_randomize_pos;
    [_group, _wp_pos, 0, "MOVE"] call CBA_fnc_addWaypoint;
};

if !(_houses isEqualTo []) then {
    private _house = selectRandom _houses;
    [_group, _house] call btc_fnc_house_addWP_loop;
    _houses = _houses - [_house];
};

[_group, _pos, 0, "CYCLE"] call CBA_fnc_addWaypoint;
