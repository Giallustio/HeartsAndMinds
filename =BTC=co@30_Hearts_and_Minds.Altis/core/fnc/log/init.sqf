params [["_obj", objNull]];

btc_log_obj_created pushBack _obj;
btc_curator addCuratorEditableObjects [[_obj], false];

private _type = typeOf _obj;
if (_type in btc_log_def_loadable) then {
	[format ["setsize has been called %1", _obj], __FILE__, [true, true]] call btc_fnc_debug_message;
	[_obj, [_obj] call btc_fnc_log_get_rc] call ace_cargo_fnc_setSize;
};



