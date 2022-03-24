
/* ----------------------------------------------------------------------------
Function: btc_player_fnc_deserializeState

Description:
    Deserialize player slot.

Parameters:
    _previousPos - Position of the player. [Array]
    _dir - Direction of the player. [Number]
    _loadout - Loadout of the player. [Array]
    _flagTexture - Flag raised. [String]
    _isContaminated - Chemically contaminated. [Boolean]
    _medicalDeserializeState - Medical ACE state. [String]
    _vehicle - Vehicle occupied by player. [Object]

Returns:

Examples:
    (begin example)
        (btc_players_serialized getOrDefault [(keys btc_players_serialized)#0, []]) remoteExecCall ["btc_player_fnc_deserializeState", allPlayers#0];
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

[{
    params [
        "_previousPos",
        "_dir",
        "_loadout",
        "_flagTexture",
        "_isContaminated",
        "_medicalDeserializeState",
        ["_vehicle", objNull, [objNull]]
    ];

    if (
        player distance ASLToAGL _previousPos > 50 || // Don't set loadout when near main base
        btc_p_autoloadout isEqualTo 0
    ) then { 
        [{player setUnitLoadout _this;}, _loadout] call CBA_fnc_execNextFrame;
    };
    if ((isNull _vehicle) || {!(player moveInAny _vehicle)}) then {
        player setPosASL _previousPos;
    };
    player setDir _dir;
    player forceFlagTexture _flagTexture;
    [player, _medicalDeserializeState] call ace_medical_fnc_deserializeState;

    if (_isContaminated) then {
        player call btc_chem_fnc_damageLoop;
    };
}, _this] call CBA_fnc_execNextFrame;
