
/* ----------------------------------------------------------------------------
Function: btc_fnc_fob_create

Description:
    Create user interface for FOB creation.

Parameters:
    _mat - Object "containing" the FOB. [Object]

Returns:

Examples:
    (begin example)
        [cursorObject] call btc_fnc_fob_create;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_mat", objNull, [objNull]]
];

// "Area is not flat enough!"
if (((position _mat) isFlatEmpty [1, 0, 0.9, 1, 0, false, _mat]) isEqualTo []) exitWith {hint localize "STR_BTC_HAM_O_FOB_CREATE_H_AREA";};

//"Too close at the main base!"
if (_mat inArea [getMarkerPos "btc_base", 2000, 2000, 0, false]) exitWith {hint localize "STR_BTC_HAM_O_FOB_CREATE_H_DBASE";};

//"Clear the area before mounting the FOB, %1"
if ((nearestObjects [position _mat, ["LandVehicle", "Air"], 10]) findIf {!(_x isKindOf "ace_fastroping_helper")} != -1) exitWith {
    hint format [localize "STR_BTC_HAM_O_FOB_CREATE_H_CAREA", (nearestObjects [position _mat, ["LandVehicle", "Air"], 10]) apply {typeOf _x}]
};

closeDialog 0;

btc_fob_dlg = false;

createDialog "btc_fob_create";

waitUntil {dialog};

while {!btc_fob_dlg} do {
    if !(dialog) then {
        hint localize "STR_BTC_HAM_O_FOB_CREATE_H_ESC"; //"Do not close the dialog with esc"
        createDialog "btc_fob_create";
    };
    sleep 0.1;
};

if (ctrlText 777 == "") exitWith {
    closeDialog 0;
    hint localize "STR_BTC_HAM_O_FOB_CREATE_H_NAME"; // "Name your FOB!"
    _mat spawn btc_fnc_fob_create;
};

private _name = ctrlText 777;

private _FOB_name = "FOB " + _name;
private _name_to_check = toUpper _FOB_name;
private _array_markers = allMapMarkers apply {toUpper _x};

if (_name_to_check in _array_markers) exitWith {
    closeDialog 0;
    hint localize "STR_BTC_HAM_O_FOB_CREATE_H_NAMENOTA"; //"Name already in use!"
    _mat spawn btc_fnc_fob_create;
};

hint localize "STR_BTC_HAM_O_FOB_CREATE_H_WIP";//"Get back! Mounting FOB"

closeDialog 0;

[{
    params ["_pos", "_mat", "_name"];

    if (isNull _mat) exitWith {};

    deleteVehicle _mat;
    private _FOB_name = "FOB " + _name;
    [_pos, _FOB_name] remoteExecCall ["btc_fnc_fob_create_s", 2];
    [7, _FOB_name] remoteExecCall ["btc_fnc_show_hint", [0, -2] select isDedicated];
}, [getPos _mat, _mat, _name], 5] call CBA_fnc_waitAndExecute;
