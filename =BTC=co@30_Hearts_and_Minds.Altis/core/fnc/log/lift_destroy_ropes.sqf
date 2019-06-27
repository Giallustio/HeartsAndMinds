
/* ----------------------------------------------------------------------------
Function: btc_fnc_log_lift_destroy_ropes

Description:
    Fill me when you edit me !

Parameters:
    _heli - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_log_lift_destroy_ropes;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_heli", vehicle player, [objNull]]
];

btc_ropes_deployed = false;
btc_log_hud = false;
btc_lifted = false;

player removeAction btc_lift_action;
player removeAction btc_lift_action_hud;

if !(ropes _heli isEqualTo []) then {
    {
        ropeDestroy _x;
    } forEach ropes _heli;
};

_heli setVariable ["cargo", nil];
