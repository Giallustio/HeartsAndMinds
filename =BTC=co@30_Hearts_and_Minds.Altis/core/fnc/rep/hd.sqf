
/* ----------------------------------------------------------------------------
Function: btc_fnc_rep_hd

Description:
    Handle damage.

Parameters:
    _unit - [Object]
    _part - [String]
    _dam - [Number]
    _injurer - [Object]
    _ammo - [String]

Returns:

Examples:
    (begin example)
        [cursorObject, "body", 0.1, player] call btc_fnc_rep_hd;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]],
    ["_part", "", [""]],
    ["_dam", 0, [0]],
    ["_injurer", objNull, [objNull]],
    ["_ammo", "", [""]]
];

if (!isPlayer _injurer || {_dam <= 0.05}) exitWith {_dam};
private _isAgent = isAgent teamMember _unit;
if (
    !_isAgent && {
        _part isEqualTo "" ||
        {!(side group _unit isEqualTo civilian)}
    }
) exitWith {_dam};

if (!isServer) exitWith {
    _this remoteExecCall ["btc_fnc_rep_hd", 2];
    _dam
};

[
    [btc_rep_malus_civ_hd, btc_rep_malus_animal_hd] select _isAgent,
    _injurer
] call btc_fnc_rep_change;
if (btc_global_reputation < 600) then {[getPos _unit] call btc_fnc_rep_eh_effects;};

if (btc_debug_log) then {
    [format ["REP HD = GREP %1 THIS = %2", btc_global_reputation, _this], __FILE__, [false]] call btc_fnc_debug_message;
};

_dam
