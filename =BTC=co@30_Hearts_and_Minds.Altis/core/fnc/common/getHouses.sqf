
private ["_pos","_radius","_useful","_buildings"];

_pos       = _this select 0;
_radius    = _this select 1;
_buildings = nearestObjects [_pos, ["Building"], _radius];
_useful    = _buildings select {(format["%1", _x buildingPos 2] != "[0,0,0]" && {damage _x == 0} && {isNil {_x getVariable "btc_house_taken"}})};
_useful