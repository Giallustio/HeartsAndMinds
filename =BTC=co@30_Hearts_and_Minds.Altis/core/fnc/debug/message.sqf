params [
    ["_message", "BTC Message debug"],
    ["_folder", __FILE__],
    ["_type", [btc_debug, btc_debug_log, false]]
];

private _startPosition = _folder find "fnc";

[_message, _folder select [_startPosition, (_folder find ".sqf") - _position], _type] call CBA_fnc_debug;
