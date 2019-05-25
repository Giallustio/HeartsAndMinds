
/* ----------------------------------------------------------------------------
Function: btc_fnc_show_hint

Description:
    Show hint.

Parameters:
    _type - Type of CBA_fnc_notify to show. [Number]
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

private _text = switch (_type) do {
    case 0 : {
        localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_0"; //Cache destroyed!
    };
    case 1 : {
        [
            [localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_1"],
            [localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_MU"],
            ["<img size='1' image='\A3\ui_f\data\map\markers\handdrawn\unknown_CA.paa' align='center' color='#ff0000'/>"]
        ]; //Intel about an ammo cache found! Map updated
    };
    case 2 : {
        format [localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_2", _custom]; //Hideout destroyed! %1 remaining
    };
    case 3 : {
        localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_3"; //This body does not have any intel
    };
    case 5 : {
        [
            [localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_5"],
            [localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_MU"],
            ["<img size='1' image='\A3\ui_f\data\map\markers\handdrawn\warning_CA.paa' align='center' color='#ff0000'/>"]
        ]; //Intel about an hideout found! Map updated
    };
    case 6 : {
        localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_6"; //In the last hideout we found important intel about all the cities occupied by the Oplitas! Size the last positions held by the enemies and defeat them once and for all
    };
    case 7 : {
        format [localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_7", _custom]; // has been deployed!
    };
    case 8 : {
        localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_8"; //Saving in progress...Please wait
    };
    case 9 : {
        localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_9"; //Game has been saved!
    };
    case 10 : {
        localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_10"; //Database deleted!
    };
    case 11 : {
        localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_11"; //One checkpoint destroyed!
    };
    case 12 : {
        localize "STR_BTC_HAM_SIDE_CONVOY_STARTCHAT"; //Convoy has left the starting point!
    };
    case 14 : {
        [
            [localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_14"],
            [format ["<img size='5' image='%1' align='center'/>", getText (configfile >> "CfgVehicles" >> _custom >> "editorPreview")]],
            [" "]
        ];
    };
    case 15 : {
        [
            [localize "STR_BTC_HAM_O_COMMON_SHOWHINTS_15"],
            [format ["<img size='5' image='%1' align='center'/>", getText (configfile >> "CfgVehicles" >> _custom >> "editorPreview")]],
            [" "]
        ];
    };
};

_text call CBA_fnc_notify;
