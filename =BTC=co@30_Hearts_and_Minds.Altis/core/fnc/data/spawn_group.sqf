
/* ----------------------------------------------------------------------------
Function: btc_fnc_data_spawn_group

Description:
    Create group previously saved by btc_fnc_data_get_group.

Parameters:
    _data_unit - All data listed above. [Array]
        _type - Type of group (3: in house group, 4: civilian with weapon, 5: suicider ...). [Number]
        _array_pos - Position on units. [Array]
        _array_type - Type of units. [Array]
        _side - Side of the group. [Side]
        _array_dam - Damage of units. [Array]
        _behaviour - Behaviour of units. [Array]
        _array_wp - Waypoints of group. [Array]
        _array_veh - Vehicle occupied by the group. [Array, String]
    _cityID - City ID. [Number]

Returns:
    leader of the group and type of group. [Array]

Examples:
    (begin example)
        _result = [] call btc_fnc_data_spawn_group;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_data_unit", [], [[]]],
    ["_cityID", 0, [0]]
];
_data_unit params [
    ["_type", 1, [0]],
    ["_array_pos", [], [[]]],
    ["_array_type", [], [[]]],
    ["_side", east, [east]],
    ["_array_dam", [], [[]]],
    ["_behaviour", [], [[]]],
    ["_array_wp", [], [[]]],
    ["_array_veh", [], [[], ""]]
];

if (_type isEqualTo 5) exitWith {
    [objNull, 100, _array_pos select 0, _array_type select 0] call btc_fnc_ied_suicider_create;
};
if (_type isEqualTo 7) exitWith {
    [objNull, 100, _array_pos select 0] call btc_fnc_ied_drone_create;
};

private _group = createGroup _side;
private _delay = 0;
if (_type isEqualTo 1) then {
    _delay = [_group, _array_veh select 0, _array_type, _array_veh select 1, _array_veh select 2, _array_veh select 3] call btc_fnc_delay_createVehicle;
} else {
    for "_i" from 0 to (count _array_pos - 1) do {
        [_group, _array_type select _i, _array_pos select _i, "CAN_COLLIDE"] call btc_fnc_delay_createUnit;
        //_u setDamage (_array_dam select _i);

        if (btc_debug_log) then {
            [format ["pos %1 in %2 ", _array_pos select _i], __FILE__, [false]] call btc_fnc_debug_message;
        };
    };
};

[{
    params ["_data_unit", "_group"];
    _data_unit params [
        ["_type", 1, [0]],
        ["_array_pos", [], [[]]],
        ["_array_type", [], [[]]],
        ["_side", east, [east]],
        ["_array_dam", [], [[]]],
        ["_behaviour", [], [[]]],
        ["_array_wp", [], [[]]],
        ["_array_veh", [], [[], ""]]
    ];

    //[waypointPosition _x,waypointType _x,waypointSpeed _x,waypointFormation _x,waypointCombatMode _x,waypointBehaviour _x]
    if !(_side isEqualTo civilian && {vehicle leader _group isEqualTo leader _group}) then {
        if (count (_array_wp select 1) > 1) then {
            {
                [_group, _x select 0, -1, _x select 1, _x select 5, _x select 4, _x select 2, _x select 3, "", [0, 0, 0], 20] call CBA_fnc_addWaypoint;
            } forEach (_array_wp select 1);
            _group setCurrentWaypoint [_group, _array_wp select 0];
        };
    };
    if (_type isEqualTo 3) then {
        [_group, nearestObject [_array_pos select 0, _array_veh]] call btc_fnc_house_addWP;
        _group setVariable ["btc_inHouse", _array_veh];
    };
    if (_type isEqualTo 4) then {[[0, 0, 0], 0, units _group] call btc_fnc_civ_get_weapons;};
    if (_type isEqualTo 6) then {
        [_group, _array_veh select 0] call btc_fnc_civ_addWP;
        _group setVariable ["btc_data_inhouse", _array_veh];
    };

    _group setBehaviour (_behaviour select 0);
    _group setCombatMode (_behaviour select 1);
    _group setFormation (_behaviour select 2);
}, [_data_unit, _group], btc_delay_createUnit + _delay] call CBA_fnc_waitAndExecute;
