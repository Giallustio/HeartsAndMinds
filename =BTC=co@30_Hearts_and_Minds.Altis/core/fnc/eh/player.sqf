
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_player

Description:
    Add event handler to player.

Parameters:
    _player - Player to add event. [Object]

Returns:
    _eventHandleID - ID of the WeaponAssembled event handle. [Number]

Examples:
    (begin example)
        _eventHandleID = [player] call btc_fnc_eh_player;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_player", objNull, [objNull]]
];

_player addEventHandler ["Respawn", format ["[%1] call btc_fnc_eh_player_respawn", getPosASL player]];
_player addEventHandler ["CuratorObjectPlaced", btc_fnc_eh_CuratorObjectPlaced];
["ace_treatmentSucceded", btc_fnc_rep_treatment] call CBA_fnc_addEventHandler;
_player addEventHandler ["WeaponAssembled", btc_fnc_civ_add_leaflets];
_player addEventHandler ["WeaponAssembled", {
    params [
        ["_player", objNull, [objNull]],
        ["_rallyPoint", objNull, [objNull]]
    ];

    if !(_rallyPoint isKindOf "Camping_base_F") exitWith {_this};

    [_rallyPoint] remoteExecCall ["btc_fnc_fob_init", [0, 2] select isDedicated];

    _this
}];
_player addEventHandler ["GetInMan", {_this call btc_fnc_ied_deleteLoop}];
_player addEventHandler ["GetOutMan", {
    if (btc_ied_deleteOn > -1) then {
        [btc_ied_deleteOn] call CBA_fnc_removePerFrameHandler;
        btc_ied_deleteOn = -1;
    };
}];
_player addEventHandler ["WeaponAssembled", {
    params [
        ["_player", objNull, [objNull]],
        ["_static", objNull, [objNull]]
    ];

    if !(_static isKindOf "StaticWeapon") exitWith {_this};
    [_static] remoteExecCall ["btc_fnc_log_init", 2];
}];
["ace_csw_deployWeaponSucceeded", {
    _this remoteExecCall ["btc_fnc_log_init", [0, 2] select isDedicated];
}] call CBA_fnc_addEventHandler;

if (btc_p_chem) then {
     // Add biopsy
    [missionnamespace, "probingEnded", btc_fnc_chem_biopsy] call BIS_fnc_addScriptedEventHandler;

     // Disable BI shower
    ["DeconShower_01_F", "init", {(_this select 0) setVariable ['bin_deconshower_disableAction', true];}] call CBA_fnc_addClassEventHandler;
    ["DeconShower_02_F", "init", {(_this select 0) setVariable ['bin_deconshower_disableAction', true];}] call CBA_fnc_addClassEventHandler;

    [] call btc_fnc_chem_ehDetector;
};

if (btc_p_spect) then {
    ["weapon", {_this call btc_fnc_spect_updateDevice}] call CBA_fnc_addPlayerEventHandler;
    ["vehicle", {
        params ["_unit", "_newVehicle"];
        [] call btc_fnc_spect_disableDevice;
        [_unit, currentWeapon _unit] call btc_fnc_spect_updateDevice;
    }] call CBA_fnc_addPlayerEventHandler;
};

["btc_tow_unwindDone", {(localize "STR_BTC_HAM_TOW_DONE") call CBA_fnc_notify}] call CBA_fnc_addEventHandler;
