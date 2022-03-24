
/* ----------------------------------------------------------------------------
Function: btc_player_fnc_serializeState

Description:
    Serialize player slot.

Parameters:
    _unit - Unit. [Object]

Returns:

Examples:
    (begin example)
        [allPlayers#0] call btc_player_fnc_serializeState;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]]
];

if (
    isNil {_unit getVariable "btc_player_slotName"}
) exitWith {};

if (btc_debug || btc_debug_log) then {
    [format ["Saved %1", _unit], __FILE__, [btc_debug, btc_debug_log, true]] call btc_debug_fnc_message;
};

private _data = [
    getPosASL _unit,
    getDir _unit,
    getUnitLoadout _unit,
    getForcedFlagTexture _unit,
    _unit in btc_chem_contaminated,
    [_unit] call ace_medical_fnc_serializeState,
    vehicle _unit
];
btc_players_serialized set [_unit getVariable ["btc_player_slotName", [0, 0, 0]], _data];
