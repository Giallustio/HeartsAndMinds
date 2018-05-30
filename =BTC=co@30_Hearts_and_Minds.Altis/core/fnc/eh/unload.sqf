params ["_item", "_vehicle", ["_unloader", objNull]];

private _emptyPosAGL = [_vehicle, _item, _unloader] call btc_fnc_log_findUnloadPosition;

if (btc_debug) then {
    [format ["Corrected position = %1 Old position = %2", _emptyPosAGL distance _vehicle, _vehicle distance _item], __FILE__, [btc_debug, false]] call btc_fnc_debug_message;
};

["ace_cargo_serverUnload", [_item, _emptyPosAGL]] call CBA_fnc_serverEvent;
