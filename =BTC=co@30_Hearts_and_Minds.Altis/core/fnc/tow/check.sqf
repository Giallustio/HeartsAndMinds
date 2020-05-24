
/* ----------------------------------------------------------------------------
Function: btc_fnc_tow_check

Description:
    _tower ----rope--- (hook)_towed, Show feedback message when trying to tow a vehicle.

Parameters:
    _tower - Tower vehicle. [Object]
    _towed - Towed vehicle. [Object]

Returns:
    _canTow - Can tow or not. [Boolean]

Examples:
    (begin example)
        _canTow = [cursorObject, btc_tow_vehicleSelected] call btc_fnc_tow_check;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_tower", objNull, [objNull]],
    ["_towed", objNull, [objNull]]
];

private _array = [_tower] call btc_fnc_log_get_nottowable;

if ((_array findIf {_towed isKindOf _x}) != -1) exitWith {
    private _string_array = "";
    {
        _string_array = _string_array + ", " + _x;
    } forEach (([_tower] call btc_fnc_log_get_nottowable) - ["Truck_F"]);

    (format [localize "STR_BTC_HAM_TOW_CANT", _string_array]) call CBA_fnc_notify;
    false
};

private _model_rear = ([_tower] call btc_fnc_tow_hitch_points) select 1;
private _model_front = ([_towed] call btc_fnc_tow_hitch_points) select 0;
private _distance = (_towed modelToWorld _model_front) distance (_tower modelToWorld _model_rear);

private _safeDistance = [_distance > 1.3, _distance < [5, 24] select (_tower isKindOf "Ship")];
if (_safeDistance isEqualTo [true, false]) exitWith {
    (localize "STR_BTC_HAM_TOW_TFAR") call CBA_fnc_notify;
    false
};
if (_safeDistance isEqualTo [false, true]) exitWith {
    (localize "str_a3_showcase_vtol_x11_taruclose_xia_0") call CBA_fnc_notify;
    false
};

if (
    !(isNull (isVehicleCargo _towed)) ||
    !isNull (_tower getVariable ["btc_towing", objNull])
) exitWith {
    (localize "STR_BTC_HAM_TOW_ALREADYTOWED") call CBA_fnc_notify;
    false
};

true
