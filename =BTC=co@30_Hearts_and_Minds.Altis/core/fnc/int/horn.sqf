
/* ----------------------------------------------------------------------------
Function: btc_int_fnc_horn

Description:
    Execute STOP order if player use horn.

Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_int_fnc_horn;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

private _veh = vehicle player;
if (
    _veh isEqualTo player || 
    {visibleMap} ||
    {driver _veh isNotEqualTo player} ||
    {time < btc_int_hornDelay + 1}
) exitWith {};

params ["_displayOrControl", "_button"];
if (_button isNotEqualTo 0) exitWith {};

private _weapon = currentWeapon _veh;
if (
    _weapon isNotEqualTo "" &&
    {!(_weapon isKindOf ["CarHorn", configFile >> "CfgWeapons"])}
) exitWith {};
 
btc_int_hornDelay = time;
[
    1,
    objNull,
    btc_int_hornRadius,
    _veh
] call btc_int_fnc_orders;
