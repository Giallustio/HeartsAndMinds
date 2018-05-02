params ["_pos", "_random_area", ["_allowwater", false]];

private _return_pos = _pos;

_pos params ["_pos_x", "_pos_y"];

_pos_x = _pos_x + (random _random_area) - (random _random_area);
_pos_y = _pos_y + (random _random_area) - (random _random_area);

private _check_pos = [_pos_x, _pos_y, 0];

if ((surfaceIsWater _check_pos) && !(_allowwater)) then {
    _return_pos = [_check_pos, 0, _random_area, 13, false] call btc_fnc_findsafepos;
} else {
    _return_pos = _check_pos;
};
_return_pos
