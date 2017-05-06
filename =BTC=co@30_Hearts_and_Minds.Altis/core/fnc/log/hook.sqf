
private _tower = _this;

btc_log_vehicle_selected = _tower;

private _string_array = "";
{
	_string_array = _string_array + "," + _x;
} forEach ([_tower] call btc_fnc_log_get_nottowable);

hint format ["Interact with a vehicle to tow it! You can't tow %1", _string_array];