params ["_object_selected"];

btc_log_object_selected = _object_selected;

private _displayName = getText (configFile >> "cfgVehicles" >> typeOf btc_log_object_selected >> "displayName");
if (_displayName isEqualTo "ace_rearm_dummy_obj") then {
    _displayName = getText (configFile >> "CfgMagazines" >> (btc_log_object_selected getVariable "ace_rearm_magazineClass") >> "displayName");
};

hint parseText format [localize "STR_BTC_HAM_LOG_SEL_HINT", _displayName, [btc_log_object_selected] call btc_fnc_log_get_rc]; //%1 selected<br/>CR: %2<br/>Interact with a vehicle to load it in!
