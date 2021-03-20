
/* ----------------------------------------------------------------------------
Function: btc_fnc_door_break

Description:
    Break lock door action.

Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_door_break;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

([2] call ace_interaction_fnc_getDoor) params ["_house", "_door"];
if (_door isEqualTo "") exitWith {
    "No door" call CBA_fnc_notify;
};

["Breaking door lock...", btc_door_breaking_time, {
    [player, objNull, ["isnotinside"]] call ace_common_fnc_canInteractWith
}, {
    params ["_args"];
    _args call btc_fnc_door_broke;
}, {}, [_house, _door]] call CBA_fnc_progressBar;
