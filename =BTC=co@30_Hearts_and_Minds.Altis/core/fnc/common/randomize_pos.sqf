
private ["_pos","_random_area","_return_pos","_pos_x","_pos_y","_check_pos","_allowwater"];

_pos = _this select 0;
_random_area = _this select 1;

if (count _this > 2) then {
	_allowwater = _this select 2;
} else {
	_allowwater = false;
};

_return_pos = _pos;

_pos_x = _pos select 0;
_pos_y = _pos select 1;

_pos_x = _pos_x + ((random _random_area) - (random _random_area));
_pos_y = _pos_y + ((random _random_area) - (random _random_area));

_check_pos = [_pos_x, _pos_y, 0];

if ((surfaceIsWater _check_pos) && !(_allowwater)) then {
	for "_i" from 0 to 4 do {
		_return_pos = [_check_pos, 0, _random_area, 13, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
		if (count _return_pos == 2) exitWith {_return_pos = [_return_pos select 0, _return_pos select 1, 0];};
		_random_area = _random_area * 1.5;
	};
} else {_return_pos = _check_pos;};

_return_pos