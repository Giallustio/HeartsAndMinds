
private _towed = _this;

btc_log_vehicle_selected = _towed;

private _string_array = "";
{
	_string_array = _string_array + ", " + _x;
} forEach (([_towed] call btc_fnc_log_get_nottowable) - ["Truck_F"]);

hint format ["Interact with a vehicle to tow it! (This vehicle can't tow %1)", _string_array];