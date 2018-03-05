
if (!Dialog) exitWith {};

private _obj_type = lbData [991, lbCurSel 991];

private _veh = btc_log_veh_selected;

closeDialog 0;

private _obj_name = getText (configFile >> "cfgVehicles" >> _obj_type >> "displayName");
if (_obj_name isEqualTo "ace_rearm_dummy_obj") then {_obj_name = "Ammo";};

private _totalTime = 5;
if (vehicle player != player && {_veh isKindOf "Air"}) then {
    _totalTime = [5,1] select (((getPos _veh) select 2) > 5);
};

private _onFinish = {
    params ["_args"];
    _args params ["_veh", "_player", "_obj_type", "_obj_name"];
    [_obj_type,_veh] remoteExec ["btc_fnc_log_server_unload", 2];
    hint format [localize "STR_BTC_HAM_LOG_UNLOAD_FIN", _obj_name, getText (configFile >> "cfgVehicles" >> typeOf _veh >> "displayName")];
};
private _onFail = {
    hint (localize "STR_BTC_HAM_LOG_UNLOAD_ABORT");
};

[_totalTime, [_veh, player, _obj_type, _obj_name], _onFinish, _onFail, format [localize "STR_BTC_HAM_LOG_UNLOAD_BAR", _obj_name]] call btc_fnc_int_action_result;
