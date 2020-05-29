
/* ----------------------------------------------------------------------------
Function: btc_fnc_fob_redeploy

Description:
    Show A3 respawn menu.

Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_fnc_fob_redeploy;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

if !(player call ace_medical_status_fnc_isInStableCondition) exitWith {
    [[localize "STR_BTC_HAM_O_FOB_CANTREPLOY"], [localize "STR_BTC_HAM_O_FOB_REPLOYNOTSTABLE"]] call CBA_fnc_notify;
};

if (
    ["leftarm", "rightarm", "leftleg", "rightleg"] findIf {
        [player, player, _x] call ace_medical_treatment_fnc_canSplint
    } > -1
) exitWith {
    [[localize "STR_BTC_HAM_O_FOB_CANTREPLOY"], [localize "STR_BTC_HAM_O_FOB_REPLOYSPLINT"]] call CBA_fnc_notify;
};

player setPos [10, 10, 10];
player hideObject true;
player enableSimulation false;
forceRespawn player;
