
/* ----------------------------------------------------------------------------
Function: btc_slot_fnc_serializeState

Description:
    Serialize player slot.

Parameters:
    _unit - Unit. [Object]

Returns:

Examples:
    (begin example)
        [allPlayers#0] call btc_slot_fnc_serializeState;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]]
];

if (
    isNil {_unit getVariable "btc_slot_key"}
) exitWith {};

private _data = [
    getPosASL _unit,
    getDir _unit,
    getUnitLoadout _unit,
    getForcedFlagTexture _unit,
    _unit in btc_chem_contaminated,
    [_unit] call ace_medical_fnc_serializeState,
    vehicle _unit
];

if (btc_debug || btc_debug_log) then {
    [format ["%1", name _unit], __FILE__, [btc_debug, btc_debug_log, true]] call btc_debug_fnc_message;
};

btc_slots_serialized set [_unit getVariable ["btc_slot_key", [0, 0, 0]], _data];
