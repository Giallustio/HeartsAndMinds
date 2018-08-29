
/* ----------------------------------------------------------------------------
Function: btc_fnc_info_hideout

Description:
    Fill me when you edit me !

Parameters:
    _ho - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_info_hideout;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_ho", btc_hq, [[]]]
];

if (btc_hideouts isEqualTo []) exitWith {};

if (isNull _ho) then {
    _ho = selectRandom btc_hideouts;
    btc_hq = _ho;
};

private _pos = [getPos _ho, btc_info_hideout_radius] call CBA_fnc_randPos;

private _marker = createMarker [format ["%1", _pos], _pos];
_marker setMarkerType "hd_warning";
_marker setMarkerText format ["%1m", btc_info_hideout_radius];
_marker setMarkerSize [0.5, 0.5];
_marker setMarkerColor "ColorRed";

private _array = _ho getVariable ["markers", []];

_array pushBack _marker;

_ho setVariable ["markers", _array];
