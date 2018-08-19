params ["_name","_is_real",["_text",""]];

if (_is_real) then {
    private _array = (position player) nearEntities [btc_type_units, 2500];
    if (count _array > 0) then {
        private _man = _array select 0;
        private _dist = (player distance _man) + ((random 150) - (random 150));
        private _dir = player getDir _man;
        private _card = [_dir] call btc_fnc_get_cardinal;
        _text = format [localize "STR_BTC_HAM_CON_INFO_TROOPS_TRUE", _card,round _dist]; //I saw some militia movement %2, %3 meter from here
    } else {
        _text = localize "STR_BTC_HAM_CON_INFO_TROOPS_FALSE"; //I didn't see any militia movement in this area!
    };
} else {
    if ((random 1) > 0.5) then {
        private _array = ["N","E","W","S","NW","NE","SE","SW"];
        private _dir = selectRandom _array;
        private _dist = 500 + (random 1000);
        _text = format [(localize "STR_BTC_HAM_CON_INFO_TROOPS_TRUE"), _dir,round _dist]; //I saw some militia movement %2, %3 meter from here
    } else {
        _text = localize "STR_BTC_HAM_CON_INFO_TROOPS_FALSE"; //I didn't see any militia movement in this area!
    };
};

if (btc_debug) then {_text = _text + " - " + str(_is_real)};

[_name, _text] spawn btc_fnc_showSubtitle;
player createDiaryRecord [localize "STR_BTC_HAM_CON_INFO_ASKHIDEOUT_DIARYLOG", [str(mapGridPosition player) + " - " + _name, _text]]; //Diary log
