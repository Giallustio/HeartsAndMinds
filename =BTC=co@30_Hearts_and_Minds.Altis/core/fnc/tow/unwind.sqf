
/* ----------------------------------------------------------------------------
Function: btc_fnc_tow_unwind

Description:
    Tow a vehicle.

Parameters:
    _tower - Vehicle. [Object]

Returns:
    _thisId - ID of the event handler. [Number]

Examples:
    (begin example)
        [cursorObject] call btc_fnc_tow_unwind;
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
