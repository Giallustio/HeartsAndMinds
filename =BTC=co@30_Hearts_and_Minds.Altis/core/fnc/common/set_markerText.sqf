params [
	["_marker", ""],
	["_text", ""],
	["_arg", ""]
];
//only run on client
if (isDedicated) exitWith {};

//check parameters
if  !((typeName _marker) isEqualTo "STRING") then {_marker = str _marker;};

//check marker
if ((getMarkerPos _marker) isEqualTo [0,0,0]) exitWith {};

//check text for localization code
if ((typeName _text) isEqualTo "CODE") then {
    _text = call _text;
};

//set markerText
_marker setMarkerTextLocal format [_text, _arg];
