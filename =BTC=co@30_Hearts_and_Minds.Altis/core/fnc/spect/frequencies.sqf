
/* ----------------------------------------------------------------------------
Function: btc_fnc_spect_frequencies

Description:
    Generate an array of frequency and amplitude based on object type and position.

Parameters:
    _player - Player. [Object]
    _objects - Liste of objects emmiting electromagnetic field. [Array]
    _freq - Frequency range. [Array]

Returns:

Examples:
    (begin example)
        [player, allUnitsUAV] call btc_fnc_spect_frequencies;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_player", objNull, [objNull]],
    ["_objects", [], [[]]],
    ["_freq", [390, 500], [[]]]
];

private _frequencyRange = ((_freq select 1) - (_freq select 0)) / 110;
private _signalFrequencies = [];
{
    private _distance = _player distance _x;
    private _level = 100 - 100 * (_distance / btc_spect_range);
    private _angle = _player getRelDir _x;
    if (_level < 0 || (_angle > 90 && _angle < 270)) then {
        _level = 0;
    } else {
        _level = _level * (cos _angle);
    };

    private _offsetFreq = switch (side _x) do {
        case (west) : {0};
        case (east) : {10};
        case (independent) : {20};
        default {40};
    };

    _signalFrequencies append [
        ((count typeOf _x) + _offsetFreq) * _frequencyRange + (_freq select 0), // Generate a custom frequency base on UAV type and side
        _level
    ];
} forEach _objects;

_signalFrequencies
