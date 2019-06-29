
/* ----------------------------------------------------------------------------
Function: btc_fnc_fob_create_s

Description:
    Fill me when you edit me !

Parameters:
    _pos - [Array]
    _direction - Direction of the FOB between 0 to 360 degree. [Number]
    _FOB_name - [String]
    _fob_structure - [Array]
    _fob_flag - [Array]
    _fobs - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_fob_create_s;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_pos", [], [[]]],
    ["_direction", 0, [0]],
    ["_FOB_name", "FOB ", [""]],
    ["_fob_structure", btc_fob_structure, [[]]],
    ["_fob_flag", btc_fob_flag, [[]]],
    ["_fobs", btc_fobs, [[]]]
];

private _flag = createVehicle [_fob_flag, _pos, [], 0, "CAN_COLLIDE"];
private _struc = createVehicle [_fob_structure, _pos, [], 0, "CAN_COLLIDE"];

_struc setDir _direction;

private _marker = createMarker [_FOB_name, _pos];
_marker setMarkerSize [1, 1];
_marker setMarkerType "b_hq";
_marker setMarkerText _FOB_name;
_marker setMarkerColor "ColorBlue";
_marker setMarkerShape "ICON";

[_struc, _flag, _marker] call btc_fnc_fob_init;

_struc addEventHandler ["Killed", btc_fnc_eh_FOB_killed];

[_marker, _struc, _flag]
