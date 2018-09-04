
/* ----------------------------------------------------------------------------
Function: btc_fnc_set_markerTextLocal

Description:
    Fill me when you edit me !

Parameters:
    _marker - [String]
    _text - [String]
    _arg - []

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_set_markerTextLocal;
    (end)

Author:
    1kuemmel1

---------------------------------------------------------------------------- */

params [
    ["_marker", "", [""]],
    ["_text", "", [""]],
    ["_arg", "", ["", 0]]
];

//check for localized text
_text = if (isLocalized _text) then {localize _text};

//set markerText
_marker setMarkerTextLocal format [_text, _arg];
