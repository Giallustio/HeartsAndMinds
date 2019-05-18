
/* ----------------------------------------------------------------------------
Function: btc_fnc_info_troops

Description:
    Fill me when you edit me !

Parameters:
    _name - [String]
    _is_real - [Boolean]
    _text - [String]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_info_troops;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_name", "Vdauphin", [""]],
    ["_is_real", true, [true]],
    ["_text", "", [""]]
];

if (_is_real) then {
    private _array = (position player) nearEntities [btc_type_units, 2500];
    if !(_array isEqualTo []) then {
        private _man = _array select 0;
        private _dist = (player distance _man) + (random 150) - (random 150);
        private _dir = player getDir _man;
        private _card = [_dir] call btc_fnc_get_cardinal;
        _text = format [localize "STR_BTC_HAM_CON_INFO_TROOPS_TRUE", _card, round _dist];
    } else {
        _text = localize "STR_BTC_HAM_CON_INFO_TROOPS_FALSE";
    };
} else {
    if ((random 1) > 0.5) then {
        private _array = ["N", "E", "W", "S", "NW", "NE", "SE", "SW"];
        private _dir = selectRandom _array;
        private _dist = 500 + (random 1000);
        _text = format [localize "STR_BTC_HAM_CON_INFO_TROOPS_TRUE", _dir, round _dist];
    } else {
        _text = localize "STR_BTC_HAM_CON_INFO_TROOPS_FALSE";
    };
};

if (btc_debug) then {_text = _text + " - " + str _is_real};

[_name, _text] call btc_fnc_showSubtitle;
player createDiaryRecord ["btc_diarylog", [str(mapGridPosition player) + " - " + _name, _text]];