
/* ----------------------------------------------------------------------------
Function: btc_fnc_debug_message

Description:
    Fill me when you edit me !

Parameters:
    _message - [String]
    _folder - [String]
    _type - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_debug_message;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_message", "BTC Message debug", [""]],
    ["_folder", __FILE__, [""]],
    ["_type", [], [[]]]
];
_type params [["_systemchat", btc_debug], ["_rtp", btc_debug_log], ["_global", false]];

private _startPosition = _folder find "fnc";
if (_startPosition isEqualTo -1) then {
    _startPosition = (_folder find worldName) + count worldName;
};

[_message, _folder select [_startPosition, (_folder find ".sqf") - _startPosition], _type] call CBA_fnc_debug;
