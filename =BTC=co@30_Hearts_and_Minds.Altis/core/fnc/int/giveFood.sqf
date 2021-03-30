
/* ----------------------------------------------------------------------------
Function: btc_fnc_int_giveFood

Description:
    Give food to a unit.

Parameters:
    _player - Player. [Object]
    _target - Target. [Object]

Returns:

Examples:
    (begin example)
        [player, cursorObject] call btc_fnc_int_giveFood;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_player", player, [objNull]],
    ["_target", objNull, [objNull]]
];

private _hadFood = "ACE_Banana" in items _target;
if (
    [player, "ACE_Banana"] call CBA_fnc_removeItem &&
    {[_target, "ACE_Banana", true] call CBA_fnc_addItem}
) then {
    if (_hadFood) then {
        systemChat "Thank you but I already have food";
    } else {
        systemChat "Thank you";
        [btc_rep_bonus_giveFood, _player] remoteExecCall ["btc_fnc_rep_change", 2];
    };
};
