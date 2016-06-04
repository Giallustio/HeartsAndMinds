
private ["_displayName"];

btc_log_object_selected = _this;

_displayName = getText (configFile >> "cfgVehicles" >> typeof btc_log_object_selected >> "displayName");
if (_displayName isEqualTo "ace_rearm_dummy_obj") then {_displayName = getText (configfile >> "CfgMagazines" >> (btc_log_object_selected getVariable "ace_rearm_magazineClass") >> "displayName");
};

hint parseText format ["%1 selected<br/>CR: %2<br/>Interact with a vehicle to load it in!",_displayName,[btc_log_object_selected] call btc_fnc_log_get_rc];