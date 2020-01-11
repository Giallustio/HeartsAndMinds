
/* ----------------------------------------------------------------------------
Function: btc_fnc_data_spawn_group

Description:
    Create group previously saved by btc_fnc_data_get_group.

Parameters:
    _type - Type of group (3: in house group, 4: civilian with weapon, 5: suicider ...). [Number]
    _array_pos - Position on units. [Array]
    _array_type - Type of units. [Array]
    _side - Side of the group. [Side]
    _array_dam - Damage of units. [Array]
    _behaviour - Behaviour of units. [Array]
    _array_wp - Waypoints of group. [Array]
    _array_veh - Vehicle occupied by the group. [Array, String]

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
    ["_type", 1, [0]],
    ["_array_pos", [], [[]]],
    ["_array_type", [], [[]]],
    ["_side", east, [east]],
    ["_array_dam", [], [[]]],
    ["_behaviour", [], [[]]],
    ["_array_wp", [], [[]]],
    ["_array_veh", [], [[], ""]]
];

private _group = createGroup _side;

for "_i" from 0 to (count _array_pos - 1) do {
    private _u = _group createUnit [_array_type select _i, _array_pos select _i, [], 0, "NONE"];
    _u enableSimulation false;
    _u setPosATL (_array_pos select _i);
    _u setDamage (_array_dam select _i);

    if (btc_debug_log) then {
        [format ["pos %1 in %2 ", _array_pos select _i, getPos _u], __FILE__, [false]] call btc_fnc_debug_message;
    };
};

if (_type isEqualTo 1) then {
    private _veh = createVehicle [_array_veh select 0, _array_veh select 1, [], 0, "FLY"];
    if !(_veh isKindOf "Plane") then {
        _veh setPosATL (_array_veh select 1);
        _veh setDir (_array_veh select 2);
    };
    _veh setFuel (_array_veh select 3);
    {
        private _assigned = false;
        if (!_assigned && _veh emptyPositions "driver" > 0) then {
            _x moveInDriver _veh;
            _x assignAsDriver _veh;
            _assigned = true;
        };
        if (!_assigned && _veh emptyPositions "gunner" > 0) then {
            _x moveinGunner _veh;
            _x assignAsGunner _veh;
            _assigned = true;
        };
        if (!_assigned && _veh emptyPositions "commander" > 0) then {
            _x moveinCommander _veh;
            _x assignAsCommander _veh;
            _assigned = true;
        };
        if (!_assigned && _veh emptyPositions "cargo" > 0) then {
            _x moveinCargo _veh;
            _x assignAsCargo _veh;
            _assigned = true;
        };
    } forEach units _group;
};

units _group joinSilent _group;
(units _group) apply {_x enableSimulation true};

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
    [_group] call CBA_fnc_clearWaypoints;
    [_group, nearestObject [(units _group) select 0, _array_veh]] call btc_fnc_house_addWP;
    _group setVariable ["btc_inHouse", _array_veh];
};
if (_type isEqualTo 4) then {[[0, 0, 0], 0, units _group] call btc_fnc_civ_get_weapons;};
if (_type isEqualTo 5) then {
    _group spawn {
        _this setVariable ["suicider", true];

        private _suicider = leader _this;

        //Main check

        private _cond = false;

        while {alive _suicider && !isNull _suicider && !_cond} do {
            sleep 5;
            if !((getPos _suicider nearEntities ["SoldierWB", 25]) isEqualTo []) then {
                _cond = true;
                _suicider spawn btc_fnc_ied_suicider_active
            };
        };
    };
};
if (_type isEqualTo 6) then {
    [_group] call CBA_fnc_clearWaypoints;
    [_group, _array_veh select 0] call btc_fnc_civ_addWP;
    _group setVariable ["btc_data_inhouse", _array_veh];
};
if (_type isEqualTo 7) then {
    [objNull, 100, _array_pos select 0, _group] call btc_fnc_ied_drone_create;
};

_group setBehaviour (_behaviour select 0);
_group setCombatMode (_behaviour select 1);
_group setFormation (_behaviour select 2);

if (_side isEqualTo btc_enemy_side) then {[_group] call btc_fnc_mil_unit_create;};
if (_side isEqualTo civilian) then {[_group] call btc_fnc_civ_unit_create};

[leader _group, _type]
