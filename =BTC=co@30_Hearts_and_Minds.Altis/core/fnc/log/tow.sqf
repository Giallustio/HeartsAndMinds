
private _tower = _this;

btc_int_ask_data = nil;
[[4,_tower,player],"btc_fnc_int_ask_var",false] spawn BIS_fnc_MP;

waitUntil {!(isNil "btc_int_ask_data")};

if (!isNull btc_int_ask_data) exitWith {hint "This vehicle is already attached to another!"};

private _relative_pos = _tower worldToModel getPosATL btc_log_vehicle_selected;

btc_log_vehicle_selected attachTo [_tower, [0, _relative_pos select 1,  0.2 + ((btc_log_vehicle_selected modelToWorld [0,0,0]) select 2) - ((_tower  modelToWorld [0,0,0]) select 2)]];

[[_tower,"tow",btc_log_vehicle_selected],"btc_fnc_int_change_var",false] spawn BIS_fnc_MP;
[[btc_log_vehicle_selected,"tow",_tower],"btc_fnc_int_change_var",false] spawn BIS_fnc_MP;