
/* ----------------------------------------------------------------------------
Function: btc_fnc_debug_units

Description:
    Fill me when you edit me !

Parameters:
    _args - [Array]
    _id - [Number]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_debug_units;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_args", [], [[]]],
    ["_id", 0, [0]]
];
_args params ["_display", "_TXTunits"];

if (isNull _display || !btc_debug_graph) exitWith {
    [_id] call CBA_fnc_removePerFrameHandler;
    _display closeDisplay 1;
};

[10, objNull, "btc_units_owners"] remoteExecCall ["btc_fnc_int_ask_var", 2];
["btc_patrol_active", objNull, "btc_patrol_active"] remoteExecCall ["btc_fnc_int_ask_var", 2];
["btc_civ_veh_active", objNull, "btc_civ_veh_active"] remoteExecCall ["btc_fnc_int_ask_var", 2];
private _count_units = {(_x select 0) isKindOf "man"} count btc_units_owners;
private _count_units_own = {((_x select 1) isEqualTo 2) && ((_x select 0) isKindOf "man")} count btc_units_owners;

_TXTunits ctrlSetText format ["UNITS:%1 NOT-ON-SERVER:%2 | GROUPS:%3 | Patrol:%4 Traffic:%5", _count_units, _count_units - _count_units_own, count allGroups, count btc_patrol_active, count btc_civ_veh_active];
