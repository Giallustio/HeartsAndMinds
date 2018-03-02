/*
    Author: Thomas Ryan, updated by Karel Moricky
        Modified: kuemmel

    Description:
        Displays a subtitle at the bottom of the screen.

    CHANGED:
        - added optional line break
        - added optional color for 'speaker' and 'content'
        - changed position
        - added optional font selection
        - added background handling (WIP)

    Parameters:
        _this select 0: STRING - Name of the person speaking
        _this select 1: STRING - Contents of the subtitle
        _this select 2: BOOL   - Add a line break (Optional - default: false)
        _this select 3: HEX color for speaker (#RGB or #ARGB): - (Optional- default: "#d4cd00")
        _this select 4: HEX color for content (#RGB or #ARGB): - (Optional- default: "#FFFFFF")
        _this select 5: STRING - Font (https://community.bistudio.com/wiki/FXY_File_Format#Available_Fonts)

    Examples:
        ["Some Guy","How do yo do?"] spawn btc_fnc_showSubtitle;
        ["Darth Vader","Come to the dark side. We have cookies!", false, "#ed2939"] spawn btc_fnc_showSubtitle;
        ["Luke Skywalker","Whhhhhhyyyyyyyy", true, "#1768d3", nil, "PuristaBold"] spawn btc_fnc_showSubtitle;
*/

#define WAIT         10
#define POS_W        (0.4 * safeZoneW)
#define POS_H        (safeZoneH)
#define POS_X        (0.5 - POS_W / 2)
#define POS_Y        (safeZoneY + (6/8) * safeZoneH)
#define POS_Y_CAM    (safeZoneY + (31/32) * safeZoneH)

params [
    ["_from", "", [""]],
    ["_text", "", [""]],
    ["_lineBreak", false , [false]],
    ["_colorFrom", "#d4cd00" , [""]], //default color: gold
    ["_colorText", "#FFFFFF" , [""]], //default color: white
    ["_fontText", "RobotoCondensedBold", [""]]
];

disableSerialization;

// Create display and control
"btc_fnc_showSubtitle" cutRsc ["RscDynamicText", "PLAIN"];
private "_display";
waitUntil {_display = uiNamespace getVariable "BIS_dynamicText"; !(isNull _display)};
private _ctrl = _display ctrlCreate ["RscStructuredText",-1];
uiNamespace setVariable ["BIS_dynamicText", displayNull];

_ctrl ctrlSetBackgroundColor (["Subtitles","Background"] call bis_fnc_displayColorGet);
//_ctrl ctrlSetBackgroundColor [0, 0, 0, 0.5]; //optional? - for better readability
_ctrl ctrlSetTextColor (["Subtitles","Text"] call bis_fnc_displayColorGet);
_ctrl ctrlSetPosition [POS_X,POS_Y,POS_W,POS_H];
_ctrl ctrlCommit 0;

// Show subtitle
_ctrl ctrlSetStructuredText parseText format [
    if (_from == "") then {
        "<t align='center' shadow='1' color='%5' size='%3' font=%6>%2</t>"
    } else {
        if (_lineBreak) then {
            "<t align='center' shadow='1' color='%4' size='%3' font=%6>%1: <br /></t><t align='center' color='%5' shadow='1' size='%3' font=%6>%2</t>"
        } else {
            "<t align='center' shadow='1' color='%4' size='%3' font=%6>%1: </t><t align='center' color='%5' shadow='1' size='%3' font=%6>%2</t>"
        };
    },
    toUpper _from, _text,    (safezoneH * 0.65) max 1, _colorFrom, _colorText,_fontText
];

private _textHeight = ctrlTextHeight _ctrl;
_ctrl ctrlSetPosition [POS_X,POS_Y - _textHeight,POS_W,_textHeight];
_ctrl ctrlcommit 0;

sleep WAIT;

// Hide subtitle
_ctrl ctrlSetFade 1;
_ctrl ctrlCommit 0.5;
