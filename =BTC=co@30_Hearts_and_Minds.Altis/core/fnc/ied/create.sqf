
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_create

Description:
    Fill me when you edit me !

Parameters:
    _pos - [Array]
    _type - [String]
    _dir - [Number]
    _active - [Boolean]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_ied_create;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_pos", [0, 0, 0], [[]]],
    ["_type", "", [""]],
    ["_dir", 0, [0]],
    ["_active", false, [false]]
];

if (btc_debug_log) then {
    [format ["%1", _this], __FILE__, [false]] call btc_fnc_debug_message;
};

private _wreck = createSimpleObject [_type, _pos];
_wreck setPosATL [_pos select 0, _pos select 1, 0];
_wreck setDir _dir;
_wreck setVectorUp surfaceNormal _pos;

if !(_active) exitWith {[_wreck, _type, objNull]};

private _ied = createMine [selectRandom btc_type_ieds_ace, [_pos select 0, _pos select 1, btc_ied_offset], [], 2];
_ied setVectorUp surfaceNormal _pos;
[_wreck, _ied] call btc_fnc_ied_fired_near;

[_wreck, _type, _ied]
