
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
    "_medicalDeserializeState",
    ["_vehicle", objNull, [objNull]]
];

if (player distance _previousPos > 100) then {
    player setUnitLoadout _loadout;
};
if ((isNull _vehicle) || {!(player moveInAny _vehicle)}) then {
    player setPosASL _previousPos;
};
player setDir _dir;
player forceFlagTexture _flagTexture;
[ace_medical_fnc_deserializeState, [player, _medicalDeserializeState], 0.1] call CBA_fnc_waitAndExecute;

if (_isContaminated) then {
    player call btc_chem_fnc_damageLoop;
};
