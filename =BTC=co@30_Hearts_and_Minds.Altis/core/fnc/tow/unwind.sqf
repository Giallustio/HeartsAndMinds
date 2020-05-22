
/* ----------------------------------------------------------------------------
Function: btc_fnc_tow_unwind

Description:
    Unwind rope until the pitch is increased by 3°.

Parameters:
    _flat - Object carrying the towed vehicle. [Object]
    _rope1 - Rope to unwind. [Object]
    _rope2 - Rope to unwind. [Object]
    _initialPitch - Initial pitch and bank. [Number]

Returns:

Examples:
    (begin example)
        [] call btc_fnc_tow_unwind;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

[{
    ropeUnwound (_this select 1) &&
    ropeUnwound (_this select 2)
}, {
    params ["_flat", "_rope1", "_rope2", "_initialPitch"];

    private _actualPitch = (_flat call BIS_fnc_getPitchBank) select 0;
    if (0.5 in ([_rope1, _rope2] apply {ropeLength _x})) exitWith {};
    if (_actualPitch - _initialPitch > 3) exitWith {
        [{
            params ["_flat", "_rope1", "_rope2", "_initialPitch"];

            private _actualPitch = (_flat call BIS_fnc_getPitchBank) select 0;
            _actualPitch - _initialPitch < 3
        }, {
            _this call btc_fnc_tow_unwind;
        }, _this, 1, {
            ["btc_tow_unwindDone", _this] call CBA_fnc_localEvent;
        }] call CBA_fnc_waitUntilAndExecute;
    };

    ropeUnwind [_rope1, 0.2, -0.02, true];
    ropeUnwind [_rope2, 0.2, -0.02, true];
    _this call btc_fnc_tow_unwind;
}, _this] call CBA_fnc_waitUntilAndExecute;
