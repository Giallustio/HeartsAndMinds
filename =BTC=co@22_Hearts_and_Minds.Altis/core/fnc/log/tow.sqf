closeDialog 0;

_tower = _this;

_ground = (boundingBoxReal _tower select 0) select 2;
_h = ((boundingBoxReal btc_log_vehicle_selected select 1) select 2) - 0.065;
_rel = _ground + _h;

btc_log_vehicle_selected attachTo [_tower, [0,-10,_rel]];


[[_tower,"tow",btc_log_vehicle_selected],"btc_fnc_int_change_var",false] spawn BIS_fnc_MP;
[[btc_log_vehicle_selected,"tow",_tower],"btc_fnc_int_change_var",false] spawn BIS_fnc_MP;