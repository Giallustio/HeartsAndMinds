params ["_check_pos", "_mindist", "_random_area", "_objdist", "_allow_water"];

private _return_pos = [];
for "_i" from 0 to 4 do {
    _return_pos = [_check_pos, _mindist, _random_area, _objdist, [0, 1] select _allow_water, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    if (count _return_pos isEqualTo 2) exitWith {
        _return_pos = [_return_pos select 0, _return_pos select 1, 0];
    };

    _random_area = _random_area * 1.5;
};
_return_pos
