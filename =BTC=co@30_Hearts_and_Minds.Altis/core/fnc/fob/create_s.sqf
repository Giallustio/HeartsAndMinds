
/* ----------------------------------------------------------------------------
Function: btc_fnc_fob_create_s

Description:
    Fill me when you edit me !

Parameters:
    _pos - [Array]
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
    ["_FOB_name", "FOB ", [""]],
    ["_fob_structure", btc_fob_structure, [[]]],
    ["_fob_flag", btc_fob_flag, [[]]],
    ["_fobs", btc_fobs, [[]]]
];

private _flag = createVehicle [_fob_flag, _pos, [], 0, "CAN_COLLIDE"];
private _struc = createVehicle [_fob_structure, _pos, [], 0, "CAN_COLLIDE"];

private _marker = createMarker [_FOB_name, _pos];
_marker setMarkerSize [1, 1];
_marker setMarkerType "b_hq";
_marker setMarkerText _FOB_name;
_marker setMarkerColor "ColorBlue";
_marker setMarkerShape "ICON";

(_fobs select 0) pushBack _FOB_name;
(_fobs select 1) pushBack _struc;
_flag setVariable ["btc_fob", _FOB_name];

[_FOB_name, _struc, _flag]
