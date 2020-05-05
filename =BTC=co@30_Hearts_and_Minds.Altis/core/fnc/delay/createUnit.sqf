
/* ----------------------------------------------------------------------------
Function: btc_fnc_delay_createUnit

Description:
    Create unit when all previous units have been created. btc_delay_createUnit define the time (in second) when the unit will be created.

Parameters:
    _group - Group to add unit. [Group]
    _unit_type - Type of units to create. [Array]
    _pos - Position of creation. [Array]
    _special - Unit placement special. [String]

Returns:

Examples:
    (begin example)
        [createGroup (side player), typeOf player, getPosATL player] call btc_fnc_delay_createUnit;
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

    if (isNull _group) exitWith {
        [format ["isNull _group _this = %1", _this], __FILE__, [btc_debug, btc_debug_log, true]] call btc_fnc_debug_message;
        btc_delay_createUnit = btc_delay_createUnit - 0.3;
    };

    private _unit = _group createUnit [_unit_type, _pos, [], 0, _special];
    [_unit] joinSilent _group;

    private _vehicle = assignedVehicle leader _group;
    if (!isNull _vehicle && {isNull assignedVehicle _unit}) then {
        if !(_unit moveInAny _vehicle) then {
            deleteVehicle _unit;
        };
    };

    btc_delay_createUnit = btc_delay_createUnit - 0.3;
}, _this, btc_delay_createUnit - 0.01] call CBA_fnc_waitAndExecute;
