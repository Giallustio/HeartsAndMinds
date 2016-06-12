
private ["_return_pos","_check_pos","_random_area","_allow_water"];

_check_pos = _this select 0;
_mindist = _this select 1;
_random_area = _this select 2;
_objdist = _this select 3;
_allow_water = _this select 4;

for "_i" from 0 to 4 do {
	_return_pos = [_check_pos, _mindist, _random_area, _objdist, [0,1] select _allow_water, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
	if (count _return_pos == 2) exitWith {_return_pos = [_return_pos select 0, _return_pos select 1, 0];};
	_random_area = _random_area * 1.5;
};
_return_pos