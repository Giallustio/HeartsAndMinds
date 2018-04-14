params ["_veh"];

if (isNull _veh) exitWith {};

btc_log_veh_selected = _veh;

btc_int_ask_data = nil;
[3, _veh, player] remoteExec ["btc_fnc_int_ask_var", 2];

waitUntil {!(isNil "btc_int_ask_data")};
closeDialog 0;
disableSerialization;
createDialog "btc_log_dlg";

waitUntil {Dialog};

private _ui = uiNamespace getVariable "btc_log_dlg";

private _cargo = btc_int_ask_data;
private _text = format [localize "STR_BTC_HAM_LOG_CHECKC_VEHICLE", getText (configFile >> "cfgVehicles" >> typeOf _veh >> "displayName"), [_veh, _cargo] call btc_fnc_log_check_cc, [_veh] call btc_fnc_log_get_cc]; //Vehicle: %1  | CC: %2/%3

(_ui displayCtrl 990) ctrlSetText _text;

{
    private _displayName = getText (configFile >> "cfgVehicles" >> typeOf _x >> "displayName");
    if (_displayName isEqualTo "ace_rearm_dummy_obj") then {
        _displayName = getText (configFile >> "CfgMagazines" >> (_x getVariable "ace_rearm_magazineClass") >> "displayName");
    };
    private _index = lbAdd [991, _displayName];
    lbSetData [991, _index, typeOf _x];
    lbSetTooltip [991, _index, _displayName];
} forEach _cargo;

lbSetCurSel [991, 0];

waitUntil {!Dialog};

btc_log_veh_selected = objNull;
