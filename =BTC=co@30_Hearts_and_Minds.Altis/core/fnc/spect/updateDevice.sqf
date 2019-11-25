
/* ----------------------------------------------------------------------------
Function: btc_fnc_spect_updateDevice

Description:
    Refresh spectrum device depend on UAV and EMP distance and angle.

Parameters:
    _player - Player. [Object]
    _weapon - Weapon use by player. [Object]

Returns:

Examples:
    (begin example)
        [player, currentWeapon player] call btc_fnc_spect_updateDevice;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_player", objNull, [objNull]],
    ["_weapon", "", [""]]
];

if (btc_spect_updateOn > -1) exitWith {};

private _accessorie = (_player weaponAccessories _weapon) select 0;

if !(_accessorie isKindOf ["muzzle_antenna_base_01_F", configFile >> "CfgWeapons"]) exitWith {};

private _freq = [[385, 505], [77, 90]] select (_accessorie isEqualTo "muzzle_antenna_01_f");

private _EM = [
    ["#EM_FMin", _freq select 0],
    ["#EM_FMax", _freq select 1],
    ["#EM_SMin", 0],
    ["#EM_SMax", 100],
    ["#EM_Values", []],
    ["#EM_Transmit", false],
    ["#EM_Progress", 0]
];

if (
    _freq select 0 > missionNamespace getVariable ["#EM_SelMin", 0] ||
    _freq select 1 < missionNamespace getVariable ["#EM_SelMin", 0]
) then {
    _EM append [
        ["#EM_SelMin", _freq select 0],
        ["#EM_SelMax", ((_freq select 1) - (_freq select 0)) / 16 + (_freq select 0)]
    ];
};
{missionNamespace setVariable _x} forEach _EM;

btc_spect_updateOn = [{
    params ["_arguments", "_idPFH"];
    _arguments params [
        ["_player", objNull, [objNull]],
        ["_accessorie", "", [""]]
    ];

    if !(((_player weaponAccessories currentWeapon _player) select 0) isEqualTo _accessorie) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
        btc_spect_updateOn = -1;

        {missionNamespace setVariable _x} forEach [
            ["#EM_FMin", nil],
            ["#EM_FMax", nil],
            ["#EM_SMin", nil],
            ["#EM_SMax", nil],
            ["#EM_Values", nil],
            ["#EM_Transmit", nil],
            ["#EM_Progress", nil],
            ["#EM_Prev", nil],
            ["#EM_Spectrum", nil]
        ];
        [_player, currentWeapon _player] call btc_fnc_spect_updateDevice;
    };

    private _signalFrequencies = [_player, allUnitsUAV] call btc_fnc_spect_frequencies;
    _signalFrequencies append ([_player, btc_spect_emp select {damage _x < 1}, [78, 89]] call btc_fnc_spect_frequencies);
    missionNamespace setVariable ["#EM_Values", _signalFrequencies];
}, 1, [_player, _accessorie]] call CBA_fnc_addPerFrameHandler;
