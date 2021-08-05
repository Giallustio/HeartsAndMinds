
/* ----------------------------------------------------------------------------
Function: btc_fob_fnc_forceRespawn

Description:
    Force player respawn.

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
forceRespawn player;
