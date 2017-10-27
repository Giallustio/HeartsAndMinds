
private _tower = _this;

btc_int_ask_data = nil;
[4,_tower,player] remoteExec ["btc_fnc_int_ask_var", 2];

waitUntil {!(isNil "btc_int_ask_data")};

if (!isNull btc_int_ask_data) exitWith {hint "This vehicle is already attached to another!"};

private _relative_pos = _tower worldToModel getPosATL btc_log_vehicle_selected;
private _model_rear_tower = ([_tower] call btc_fnc_log_hitch_points) select 1;
private _model_front_selected = ([btc_log_vehicle_selected] call btc_fnc_log_hitch_points) select 0;
private _pos_rear = _tower modelToWorld _model_rear_tower;
private _pos_front = btc_log_vehicle_selected modelToWorld _model_front_selected;

btc_log_vehicle_selected attachTo [_tower, [0, _relative_pos select 1,  0.2 + ((btc_log_vehicle_selected modelToWorld [0,0,0]) select 2) - ((_tower modelToWorld [0,0,0]) select 2)]];

ropeCreate [_tower, _model_rear_tower, btc_log_vehicle_selected, [(_model_front_selected select 0) - 0.4, _model_front_selected select 1, _model_front_selected select 2], _pos_front distance _pos_rear ];
ropeCreate [_tower, _model_rear_tower, btc_log_vehicle_selected, [(_model_front_selected select 0) + 0.4, _model_front_selected select 1, _model_front_selected select 2], _pos_front distance _pos_rear ];

_tower addEventHandler ["RopeBreak", {
	(_this select 0) removeEventHandler ["RopeBreak", _thisEventHandler];
	(_this select 0) spawn btc_fnc_log_unhook;
}];

[_tower,"tow",btc_log_vehicle_selected] remoteExec ["btc_fnc_int_change_var", 2];
[btc_log_vehicle_selected,"tow",_tower] remoteExec ["btc_fnc_int_change_var", 2];