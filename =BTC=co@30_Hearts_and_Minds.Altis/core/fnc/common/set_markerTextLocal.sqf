params [
    ["_marker", "", [""]],
    ["_text", "", [""]],
    ["_arg", "", ["", 0]]
];

//check for localized text
_text = if (isLocalized _text) then {localize _text};

//set markerText
_marker setMarkerTextLocal format [_text, _arg];
