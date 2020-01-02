
/* ----------------------------------------------------------------------------
Function: btc_fnc_createUnit

Description:
    Create unit when all previous units have been created. btc_delay_createUnit define the time (in second) when the unit will be created.

Parameters:
    _group - [Group]
    _unit_type - [Array]
    _pos - [Array]

Returns:

Examples:
    (begin example)
        [createGroup (side player), typeOf player, getPosATL player] call btc_fnc_createUnit;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

btc_delay_createUnit = btc_delay_createUnit + 0.3;

[{
    params [
        ["_group", grpNull, [grpNull]],
        ["_unit_type", "", [""]],
        ["_pos", [0, 0, 0], [[]]],
        ["_special", "CARGO", [""]]
    ];

    if (btc_debug_log) then {
        if (isNull _group) then {
            [format ["_this = %1", _this], __FILE__, [false]] call btc_fnc_debug_message;
        };
    };

    private _unit = _group createUnit [_unit_type, _pos, [], 0, _special];
    [_unit] joinSilent _group;

    btc_delay_createUnit = btc_delay_createUnit - 0.3;
}, _this, btc_delay_createUnit] call CBA_fnc_waitAndExecute;
