params [["_obj", objNull]];

btc_log_obj_created pushBack _obj;
btc_curator addCuratorEditableObjects [[_obj], false];

private _type = typeOf _obj;
if (_type in btc_log_def_loadable && {getNumber (configFile >> "CfgVehicles" >> _type >> "ace_cargo_canLoad") isEqualTo 0}) then {
    [_obj, [_obj] call btc_fnc_log_get_rc] call ace_cargo_fnc_setSize;

    if (btc_debug_log) then {
	    [format ["ace_cargo_fnc_setSize to %1", _obj], __FILE__, [false]] call btc_fnc_debug_message;
	};
};

if (_type in btc_log_def_can_load && {getNumber (configFile >> "CfgVehicles" >> _type >> "ace_cargo_hasCargo") isEqualTo 0}) then {
    [_obj, [_obj] call btc_fnc_log_get_cc] call ace_cargo_fnc_setSpace;

    if (btc_debug_log) then {
	    [format ["ace_cargo_fnc_setSpace to %1", _obj], __FILE__, [false]] call btc_fnc_debug_message;
	};
};
