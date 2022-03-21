
/* ----------------------------------------------------------------------------
Function: btc_player_fnc_deserializeState

Description:
    Deserialize player slot.

Parameters:
    _unit - Unit. [Object]

Returns:

Examples:
    (begin example)
        ((value btc_player_serialize)#0) remoteExecCall ["btc_player_fnc_deserializeState", allPlayers#0]; ;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    "_previousPos",
    "_dir",
    "_loadout",
    "_flagTexture",
    "_isContaminated",
    "_medicalDeserializeState"
];

player setPosASL _previousPos;
player setDir _dir;
player setUnitLoadout _loadout;
player forceFlagTexture _flagTexture;
[ace_medical_fnc_deserializeState, [player, _medicalDeserializeState]] call CBA_fnc_execNextFrame;

if (_isContaminated) then {
    player call btc_chem_fnc_damageLoop;
};
