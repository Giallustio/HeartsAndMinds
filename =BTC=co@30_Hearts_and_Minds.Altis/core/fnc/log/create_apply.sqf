
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
    btc_supplies_mat params ["_food", "_water"];
    private _position_world = getPosWorld btc_create_object_point;
    _position_world params ["_xx", "_yy", "_zz"];
    [[
        btc_supplies_cargo,
        [_xx, _yy, _zz + 1.5], getDir btc_create_object_point,
        "",
        [selectRandom _food, selectRandom _water] apply {[_x, "", [[[], []], [[], []], [[], []]]]},
        [[[], []], [[], []], [[], []]],
        [vectorDir btc_create_object_point, vectorUp btc_create_object_point]
    ]] remoteExecCall ["btc_fnc_db_loadObjectStatus", 2];
} else {
    [_class] remoteExecCall ["btc_fnc_log_create_s", 2];
};
