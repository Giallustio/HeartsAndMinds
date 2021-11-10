
/* ----------------------------------------------------------------------------
Function: btc_int_fnc_horn

Description:
    Execute STOP order if player use horn.

Parameters:

Returns:

Examples:
    (begin example)
        cursorObject call btc_int_fnc_horn;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

systemChat str _this;
if (vehicle player isEqualTo player) exitWith {};
if (driver vehicle player isNotEqualTo player) exitWith {};

params ["_displayOrControl", "_button"];

if (_button isNotEqualTo 0) exitWith {};

systemChat str [_displayOrControl, _button];
[
    1,
    objNull,
    btc_int_beaconRadius,
    vehicle player
] call btc_int_fnc_orders;
