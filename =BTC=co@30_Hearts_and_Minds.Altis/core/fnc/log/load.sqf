
private _veh = _this;

private _veh_name = getText (configFile >> "cfgVehicles" >> typeof _veh >> "displayName");
private _obj_name = getText (configFile >> "cfgVehicles" >> typeof btc_log_object_selected >> "displayName");
if (_obj_name isEqualTo "ace_rearm_dummy_obj") then {_obj_name = getText (configfile >> "CfgMagazines" >> (btc_log_object_selected getVariable "ace_rearm_magazineClass") >> "displayName");
};

if (btc_log_object_selected distance _veh > btc_log_max_distance_load) exitWith {hint format [localize "STR_BTC_HAM_LOG_LOAD_TOOFAR", _veh_name, _obj_name];};
if (speed _veh > 3) exitWith {hint format [localize "STR_BTC_HAM_LOG_LOAD_TOOFAST", _veh_name];};


private _rc = [btc_log_object_selected] call btc_fnc_log_get_rc;
private _cc = [_veh] call btc_fnc_log_get_cc;

if (_rc > _cc) exitWith {hint format [localize "STR_BTC_HAM_LOG_LOAD_TOOBIG", _obj_name, _veh_name];};

btc_int_ask_data = nil;
[3, _veh, player] remoteExec ["btc_fnc_int_ask_var", 2];

waitUntil {!(isNil "btc_int_ask_data")};

private _cargo = btc_int_ask_data;

private _rc_tot = [_veh,_cargo] call btc_fnc_log_check_cc;

if ((_rc_tot + _rc) > _cc) exitWith {hint format [localize "STR_BTC_HAM_LOG_LOAD_NOSPACE", _obj_name,_veh_name];};

private _onFinish = {
    params ["_args"];
    _args params ["_veh", "_player", "_obj_name", "_veh_name"];
    [btc_log_object_selected, _veh] remoteExec ["btc_fnc_log_server_load", 2];
    hint format [localize "STR_BTC_HAM_LOG_LOAD_FIN", _obj_name, _veh_name];
    btc_log_object_selected = objNull;
};
private _onFail = {
    hint (localize "STR_BTC_HAM_LOG_LOAD_ABORT");
    btc_log_object_selected = objNull;
};

[5, [_veh, player, _obj_name, _veh_name], _onFinish, _onFail, format [localize "STR_BTC_HAM_LOG_LOAD_BAR", _obj_name, _veh_name]] call btc_fnc_int_action_result;
