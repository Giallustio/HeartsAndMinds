
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
if !(_group setGroupOwner _HC) exitWith {};

//Transfert EH to HC
if (side _group isEqualTo btc_enemy_side) then {
    [_group, {
        params ["_group"];

        {
            _x call btc_fnc_mil_add_eh;
        } forEach units _group;
    }] remoteExec ["call", _HC];
};
