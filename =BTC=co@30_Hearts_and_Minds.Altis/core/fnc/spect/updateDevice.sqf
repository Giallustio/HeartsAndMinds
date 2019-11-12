
/* ----------------------------------------------------------------------------
Function: btc_fnc_spect_updateDevice

Description:
    Refresh spectrum device depend on UAV distance.

Parameters:
    _objt - Weapon type. [String]

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

private _CfgWeapons = configFile >> "CfgWeapons";

if !(((_player weaponAccessories _weapon) select 0) isKindOf ["muzzle_antenna_base_01_F", _CfgWeapons]) exitWith {};

{missionNamespace setVariable _x} forEach [
    ["#EM_FMin", 390],
    ["#EM_FMax", 500],
    ["#EM_SMin", 0],
    ["#EM_SMax", 100],
    ["#EM_SelMin", 390],
    ["#EM_SelMax", 400],
    ["#EM_Values", []],
    ["#EM_Transmit", false],
    ["#EM_Progress", 0]
];

[{
    params ["_arguments", "_idPFH"];
    _arguments params [
        ["_player", objNull, [objNull]],
        ["_weapon", "", [""]],
        ["_CfgWeapons", configNull, [configNull]]
    ];

    if !(((_player weaponAccessories currentWeapon _player) select 0) isKindOf ["muzzle_antenna_base_01_F", _CfgWeapons]) exitWith {
        [_idPFH] call CBA_fnc_removePerFrameHandler;

        {missionNamespace setVariable _x} forEach [
            ["#EM_FMin", nil],
            ["#EM_FMax", nil],
            ["#EM_SMin", nil],
            ["#EM_SMax", nil],
            ["#EM_SelMin", nil],
            ["#EM_SelMax", nil],
            ["#EM_Values", nil],
            ["#EM_Transmit", nil],
            ["#EM_Progress", nil]
        ];
    };

    private _signalFrequencies = [];
    {
        private _distance = _player distance _x;
        private _level = 100 - 100 * (_distance / btc_spect_range);
        private _angle = _player getRelDir _x;
        if (_level < 0 || (_angle < 90 && _angle > 270)) then {
            _level = 0;
        } else {
            _level = _level * (cos _angle);
        };

        private _offsetFreq = switch (side _x) do {
            case (west) : {0};
            case (east) : {10};
            case (independent) : {20};
            default {40};
        };

        _signalFrequencies append [
            (count typeOf _x) + _offsetFreq + 385, // Generate a custom frequency base on UAV type and side
            _level
        ];
    } forEach allUnitsUAV;
    missionNamespace setVariable ["#EM_Values", _signalFrequencies];

}, 1, [_player, _weapon, _CfgWeapons]] call CBA_fnc_addPerFrameHandler;
