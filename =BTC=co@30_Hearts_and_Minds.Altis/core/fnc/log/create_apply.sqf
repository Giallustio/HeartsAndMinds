
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_create_apply

Description:
    Fill me when you edit me !

Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_log_create_apply;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

private _class = lbData [72, lbCurSel 72];
closeDialog 0;
sleep 0.2;

if (_class isEqualTo btc_supplies_cargo) then {
    [[
        _class,
        getPosWorld btc_create_object_point, getDir btc_create_object_point,
        "",
        btc_supplies_mat apply {[_x, "", [[[], []], [[], []], [[], []]]]},
        [[[], []], [[], []], [[], []]],
        [vectorDir btc_create_object_point, vectorUp btc_create_object_point]
    ]] remoteExecCall ["btc_fnc_db_loadObjectStatus", 2];
} else {
    [_class] remoteExecCall ["btc_fnc_log_create_s", 2];
};
