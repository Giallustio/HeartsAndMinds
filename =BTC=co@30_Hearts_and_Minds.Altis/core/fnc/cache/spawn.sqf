
private ["_n_pos","_max_pos"];

_n_pos = 0;
while {format ["%1", _this buildingPos _n_pos] != "[0,0,0]" } do {_n_pos = _n_pos + 1};
_max_pos = _n_pos;
_n_pos   = floor (random _max_pos);

btc_cache_pos = (_this buildingPos _n_pos);
if (btc_cache_pos distance [0,0,0] < 10) exitWith {[] spawn {[] call btc_fnc_cache_find_pos;};};
call btc_fnc_cache_create;