
/* ----------------------------------------------------------------------------
Function: btc_fnc_rep_foodRemoved

Description:
    Change reputation if food is removed.

Parameters:
    _caller - Caller (player). [Object]
    _unit - Target. [Object]
    _listOfItemsToRemove - Classnames. [Array]

Returns:

Examples:
    (begin example)
        [player, cursorObject, ["ACE_Banana"]] call btc_fnc_rep_foodRemoved;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params ["_caller", "_target", "_listOfItemsToRemove"];

if (
    (side group _target) isEqualTo civilian &&
    {"ACE_Banana" in _listOfItemsToRemove}
) then {
    if (isServer) then {
        [btc_rep_bonus_removeFood, _caller] call btc_fnc_rep_change;
    } else {
        [btc_rep_bonus_removeFood, _caller] remoteExecCall ["btc_fnc_rep_change", 2];
    };
};
