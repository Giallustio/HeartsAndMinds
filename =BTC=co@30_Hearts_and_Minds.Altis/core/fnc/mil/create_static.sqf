
/* ----------------------------------------------------------------------------
Function: btc_fnc_mil_create_static

Description:
    Create a static.

Parameters:
    _pos - Position of creation. [Array]
    _statics_type - Type of static available. [Array]
    _dir - Direction of the static. [Number]

Returns:
    _static - Created static. [Object]

Examples:
    (begin example)
        _static = [getPosATL player] call btc_fnc_mil_create_static;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_pos", [0, 0, 0], [[]]],
    ["_statics_type", btc_type_mg, [[]]],
    ["_dir", 0, [0]]
];

private _group = createGroup btc_enemy_side;
private _static = [_group, _pos, selectRandom _statics_type, _dir] call btc_fnc_mil_createVehicle;

_group setBehaviour "COMBAT";
_group setCombatMode "RED";

if (btc_debug_log) then {
    [format ["POS %1 _type %2", _pos, typeOf _static], __FILE__, [false]] call btc_fnc_debug_message;
};

_static
