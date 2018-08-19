params ["_man"];

if (isNil {player getVariable "interpreter"}) exitWith {[name _man,localize "STR_BTC_HAM_CON_INFO_ASKREP_NOINTER"] spawn btc_fnc_showSubtitle;}; //I can't understand what is saying

btc_int_ask_data = nil;

[2,nil,player] remoteExec ["btc_fnc_int_ask_var", 2];

waitUntil {!(isNil "btc_int_ask_data")};

private _rep = btc_int_ask_data;

private "_ho_left";
if ((round random 1) isEqualTo 1) then {
    btc_int_ask_data = nil;
    [8,nil,player] remoteExec ["btc_fnc_int_ask_var", 2];

    waitUntil {!(isNil "btc_int_ask_data")};

    _ho_left = format [localize "STR_BTC_HAM_CON_INFO_ASKREP_HIDEOUTS", btc_int_ask_data]; //I heard about %1 hideouts left.
} else {
    _ho_left = "";
};

private _info_type = switch (true) do {
    case (_rep < 200): {localize "STR_BTC_HAM_CON_INFO_ASKREP_VLOW"}; //very low
    case (_rep >= 200 && _rep < 500): {localize "STR_BTC_HAM_CON_INFO_ASKREP_LOW"}; //low
    case (_rep >= 500 && _rep < 750): {localize "STR_BTC_HAM_CON_INFO_ASKREP_NORMAL"}; //normal
    case (_rep >= 750): {localize "STR_BTC_HAM_CON_INFO_ASKREP_HIGH"}; //high
};

private _text = selectRandom [
    localize "STR_BTC_HAM_CON_INFO_ASKREP_ASK1", //Sir, your reputation is
    localize "STR_BTC_HAM_CON_INFO_ASKREP_ASK2", //Hello ! Your reputation is
    localize "STR_BTC_HAM_CON_INFO_ASKREP_ASK3"  //I think your reputation is
];

[name _man,format ["%1 %2. %3", _text, _info_type, _ho_left]] spawn btc_fnc_showSubtitle;
