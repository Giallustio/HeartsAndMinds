
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_allahu_akbar

Description:
    Fill me when you edit me !

Parameters:
    _trigger - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_ied_allahu_akbar;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_trigger", objNull, [objNull]]
];

private _suicider = _trigger getVariable "suicider";

private _soundPath = [str missionConfigFile, 0, -15] call BIS_fnc_trimString;
private _soundToPlay = _soundPath + "core\sounds\allahu_akbar.ogg";
if (alive _suicider && [_suicider] call ace_common_fnc_isAwake) then {
    playSound3d [_soundToPlay, _suicider, false, getPosASL _suicider, 40, random [0.9, 1, 1.2], 100];
};

[{
    params ["_suicider"];

    [_suicider, btc_player_side, 10, selectRandom [0, 1, 2], false] call ace_zeus_fnc_moduleSuicideBomber;
}, [_suicider], 1.4] call CBA_fnc_waitAndExecute;
