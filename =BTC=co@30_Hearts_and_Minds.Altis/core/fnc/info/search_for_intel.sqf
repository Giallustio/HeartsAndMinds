
/* ----------------------------------------------------------------------------
Function: btc_fnc_info_search_for_intel

Description:
    Fill me when you edit me !

Parameters:
    _target - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_info_search_for_intel;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_target", objNull, [objNull]]
];

private _onFinish = {
    params ["_args"];
    _args params ["_target", "_player"];

    [_target, _player] remoteExec ["btc_fnc_info_has_intel", 2];
};

[btc_int_search_intel_time, [_target, player], _onFinish, {}, localize "STR_BTC_HAM_CON_INFO_SEARCH_BAR"] call btc_fnc_int_action_result;
