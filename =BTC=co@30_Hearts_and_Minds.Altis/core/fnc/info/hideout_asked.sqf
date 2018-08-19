params ["_name","_is_real",["_text",""]];

if (_is_real) then {
    btc_int_ask_data = nil;
    [1,[],player] remoteExec ["btc_fnc_int_ask_var", 2];

    waitUntil {!(isNil "btc_int_ask_data")};

    if (!isNull btc_int_ask_data) then {
        private _hideout = btc_int_ask_data;
        private _dist = (player distance _hideout) + ((random 500) - (random 500));
        private _dir = player getDir _hideout;
        private _card = [_dir] call btc_fnc_get_cardinal;
        _text = format [localize "STR_BTC_HAM_CON_INFO_ASKHIDEOUT_TRUE", _card,round _dist]; //I saw a lot of militia activity towards %2, %3 meter from here. Probably there is an hideout!
    } else {
        _text = localize "STR_BTC_HAM_CON_INFO_ASKHIDEOUT_FALSE"; //There are no hideout around here!
    };
} else {
    if ((random 1) > 0.5) then {
        private _array = ["N","E","W","S","NW","NE","SE","SW"];
        private _dir = selectRandom _array;
        private _dist = 300 + (random 2000);
        _text = format [localize "STR_BTC_HAM_CON_INFO_ASKHIDEOUT_TRUE", _dir,round _dist]; //I saw a lot of militia activity towards %2, %3 meter from here. Probably there is an hideout!
    } else {
        _text = localize "STR_BTC_HAM_CON_INFO_ASKHIDEOUT_FALSE"; //There are no hideout around here!
    };
};

if (btc_debug) then {_text = _text + " - " + str(_is_real)};

[_name, _text] spawn btc_fnc_showSubtitle;
player createDiaryRecord [localize "STR_BTC_HAM_CON_INFO_ASKHIDEOUT_DIARYLOG", [str(mapGridPosition player) + " - " + _name, _text]]; //Diary log
