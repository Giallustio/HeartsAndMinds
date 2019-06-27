
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
[_class] remoteExecCall ["btc_fnc_log_create_s", 2];
