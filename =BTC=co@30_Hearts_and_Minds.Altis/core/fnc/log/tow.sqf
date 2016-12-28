
private ["_tower","_ground0","_ground1","_h0","_h1","_rel","_normg","_normh","_boundt","_boundb"];

_tower = _this;

btc_int_ask_data = nil;
[[4,_tower,player],"btc_fnc_int_ask_var",false] spawn BIS_fnc_MP;

waitUntil {!(isNil "btc_int_ask_data")};

if (!isNull btc_int_ask_data) exitWith {hint "This vehicle is already attached to another!"};

_boundt = boundingBoxReal _tower;
_boundb = boundingBoxReal btc_log_vehicle_selected;
_ground0 = (_boundt select 0) select 2;
_ground1 = (_boundt select 1) select 2;
_h0 = (_boundb select 0) select 2;
_h1 = (_boundb select 1) select 2;
_normg = abs(_ground1 - _ground0);
_normh = abs(_h1 - _h0);
_rel = _ground0 - _h0 - (_normh - _normg)/2;

btc_log_vehicle_selected attachTo [_tower, [0,-(sizeOf typeOf _tower)/1.5,_rel]];

[[_tower,"tow",btc_log_vehicle_selected],"btc_fnc_int_change_var",false] spawn BIS_fnc_MP;
[[btc_log_vehicle_selected,"tow",_tower],"btc_fnc_int_change_var",false] spawn BIS_fnc_MP;