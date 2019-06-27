
/* ----------------------------------------------------------------------------
Function: btc_fnc_show_hint

Description:
    Show hint.

Parameters:
    _type - Type of hint to show. [Number]
    _custom - Argument for custom text. [String, Number]

Returns:

Examples:
    (begin example)
        [0] call btc_fnc_show_hint;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

if (isDedicated) exitWith {};

params [
    ["_type", 0, [0]],
    ["_custom", 0, [0, ""]]
];

switch (_type) do {
    case 0 : {
        hint localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_0"; //Cache destroyed!
    };
    case 1 : {
        hint localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_1"; //Intel about an ammo cache found! Map updated
    };
    case 2 : {
        hint format [localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_2", _custom]; //Hideout destroyed! %1 remaining
    };
    case 3 : {
        hint localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_3"; //This body does not have any intel
    };
    case 4 : {
        hint localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_4"; //Found intels about an ammo cache and an hideout! Map updated
    };
    case 5 : {
        hint localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_5"; //Intel about an hideout found! Map updated
    };
    case 6 : {
        hint localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_6"; //In the last hideout we found important intel about all the cities occupied by the Oplitas! Size the last positions held by the enemies and defeat them once and for all
    };
    case 7 : {
        hint format [localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_7", _custom]; // has been deployed!
    };
    case 8 : {
        hint localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_8"; //Saving in progress...Please wait
    };
    case 9 : {
        hint localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_9"; //Game has been saved!
    };
    case 10 : {
        hint localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_10"; //Database deleted!
    };
    case 11 : {
        hint localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_11"; //One checkpoint destroyed!
    };
    case 12 : {
        hint localize "STR_BTC_HAM_SIDE_CONVOY_STARTCHAT"; //Convoy has left the starting point!
    };
    case 13 : {
        hint localize "STR_BTC_HAM_SIDE_HACK_STARTCHAT"; //Defend the terminal until the missile is hacked!
    };
};
