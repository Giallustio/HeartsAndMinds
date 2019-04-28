
/* ----------------------------------------------------------------------------
Function: btc_fnc_set_groupowner

Description:
    Transfert group to a headless client and apply local eventhandler.

Parameters:
    _group - Group to transfert. [Group]

Returns:

Examples:
    (begin example)
        [] call btc_fnc_set_groupowner;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_group", grpNull, [grpNull]]
];

//Choose a HC
private _HC = owner ((entities "HeadlessClient_F") select 0);

//Transfert GROUP to HC
_group setGroupOwner _HC;
