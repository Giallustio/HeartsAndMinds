
// _tower ----rope--- (hook)_towed
params ["_tower","_towed"];

private _array = [_tower] call btc_fnc_log_get_nottowable;

if !({_towed isKindOf _x} count _array == 0) exitWith {false};

private _can_tow = false;

private _model_rear = ([_tower] call btc_fnc_log_hitch_points) select 1;
private _model_front = ([_towed] call btc_fnc_log_hitch_points) select 0;
private _distance = (_towed modeltoworld _model_front) distance (_tower modeltoworld _model_rear);

if ((_distance > 1) && (_distance < 5)) then {_can_tow = true;};

_can_tow