params ["_man","_isInterrogate"];

if (isNil {player getVariable "interpreter"}) exitWith {[name _man,localize "STR_BTC_HAM_CON_INFO_ASKREP_NOINTER"] spawn btc_fnc_showSubtitle;}; //I can't understand what is saying

if !(_man call ace_medical_fnc_isInStableCondition) exitWith {
    private _complain = selectRandom [
        localize "STR_BTC_HAM_CON_INFO_ASK_WOUNDED1", //Help me!
        localize "STR_BTC_HAM_CON_INFO_ASK_WOUNDED2", //I am suffering!
        localize "STR_BTC_HAM_CON_INFO_ASK_WOUNDED3", //Injure!
        localize "STR_BTC_HAM_CON_INFO_ASK_WOUNDED4"  //I have open wound!
    ];
    [name _man, _complain] spawn btc_fnc_showSubtitle;
};

if ((!isNil {_man getVariable "btc_already_asked"}) || (_man getVariable ["btc_already_interrogated",false])) exitWith {[name _man, localize "STR_BTC_HAM_CON_INFO_ASK_ALLREADYANS"] spawn btc_fnc_showSubtitle;}; //I already answered to your question!

if ((round random 3) >= 2 || !_isInterrogate) then {
    _man setVariable ["btc_already_asked",true];
    if (_isInterrogate) then {_man setVariable ["btc_already_interrogated",true,true];};
};


//NO < 200 . FAKE < 600 . REAL > 600

btc_int_ask_data = nil;
[2,nil,player] remoteExec ["btc_fnc_int_ask_var", 2];

waitUntil {!(isNil "btc_int_ask_data")};

private _rep = btc_int_ask_data;

private _chance = (random 300) + (random _rep + (_rep/2));
private _info = "";
private _info_type = "";
switch !(_isInterrogate) do {
    case (_chance < 200) : {_info_type = "NO";};
    case (_chance >= 200 && _chance < 600) : {_info_type = "FAKE";};
    case (_chance >= 600) : {_info_type = "REAL";};
};
if (_isInterrogate) then {_info_type = "REAL";};
if (_info_type == "NO") exitWith {[name _man, localize "STR_BTC_HAM_CON_INFO_ASK_NOINFO"] spawn btc_fnc_showSubtitle;}; //I've no information for you

btc_int_ask_data = nil;
[8,nil,player] remoteExec ["btc_fnc_int_ask_var", 2];

waitUntil {!(isNil "btc_int_ask_data")};

private _final_phase = btc_int_ask_data isEqualTo 0;

private _info = selectRandomWeighted [
    "TROOPS", 0.4,
    ["HIDEOUT", "TROOPS"] select _final_phase, 0.4,
    "CACHE", 0.2
];

switch (_info_type) do {
    case "REAL" : {
        switch (_info) do {
            case "TROOPS" : {
                [(name _man),true] spawn btc_fnc_info_troops;
            };
            case "HIDEOUT" : {
                [(name _man),true] spawn btc_fnc_info_hideout_asked;
            };
            case "CACHE" : {
                [name _man, localize "STR_BTC_HAM_CON_INFO_ASK_CACHEMAP"] spawn btc_fnc_showSubtitle; //I'll show you some hint on the map
                sleep 2;
                [true,1] remoteExec ["btc_fnc_info_cache", 2];
            };
        };
    };
    case "FAKE" : {
        switch (_info) do {
            case "TROOPS" : {
                [(name _man),false] spawn btc_fnc_info_troops;
            };
            case "HIDEOUT" : {
                [(name _man),false] spawn btc_fnc_info_hideout_asked;
            };
            case "CACHE" : {
                [name _man, localize "STR_BTC_HAM_CON_INFO_ASK_CACHEMAP"] spawn btc_fnc_showSubtitle; //I'll show you some hint on the map
                sleep 2;
                [false,1] remoteExec ["btc_fnc_info_cache", 2];
            };
        };
    };
};
