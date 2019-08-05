
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

if (_part in ["body", "wheel_1_1_steering", "wheel_1_2_steering", "wheel_2_1_steering", "wheel_2_2_steering", "palivo", "engine", "glass1", "glass2", "glass3", "glass4", "karoserie", "palivo", "fuel_hitpoint", "engine_hitpoint", "body_hitpoint"]) then {
    if (isPlayer _injurer && {_dam > 0.01}) then    {
        if (!isServer) exitWith {
            _this remoteExecCall ["btc_fnc_rep_hd", 2];
        };

        btc_rep_malus_civ_hd call btc_fnc_rep_change;

        if (btc_global_reputation < 600) then {[getPos _unit] spawn btc_fnc_rep_eh_effects;};
        if (btc_debug_log) then {
            [format ["REP HD = GREP %1 THIS = %2", btc_global_reputation, _this], __FILE__, [false]] call btc_fnc_debug_message;
        };
    };
};

_dam
