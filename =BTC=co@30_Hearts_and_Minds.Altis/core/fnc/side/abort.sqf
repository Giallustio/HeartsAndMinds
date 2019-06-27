
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_abort

Description:
    Fill me when you edit me !

Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_abort;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

if (isServer) then {
    btc_side_aborted = true;
} else {
    [] remoteExec ["btc_fnc_side_abort", 2];
};
