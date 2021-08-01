
/* ----------------------------------------------------------------------------
Function: btc_fob_fnc_forceRespawn

Description:
    Force player respawn without decreasing tickets

Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_fob_fnc_forceRespawn;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

player setPos [10, 10, 10];
player hideObject true;
player enableSimulation false;
if ([btc_player_side] call BIS_fnc_respawnTickets isNotEqualTo 0) then {
    [btc_player_side, 1] call BIS_fnc_respawnTickets;
};
forceRespawn player;
