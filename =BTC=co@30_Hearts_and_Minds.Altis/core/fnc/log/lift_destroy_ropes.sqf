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
