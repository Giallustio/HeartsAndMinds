
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_rescue

Description:
    Fill me when you edit me !

Parameters:
    _taskID - unique task ID. [String]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_rescue;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_taskID", "btc_side", [""]]
];

//// Choose an occupied City \\\\
private _useful = btc_city_all select {_x getVariable ["occupied", false] && !((_x getVariable ["type", ""]) in ["NameLocal", "Hill", "NameMarine"])};

if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};

private _city = selectRandom _useful;

//// Randomise position \\\\
private _pos = [getPos _city, (((_city getVariable ["RadiusX", 0]) + (_city getVariable ["RadiusY", 0]))/2) - 100] call btc_fnc_randomize_pos;
_pos = [_pos, 0, 50, 13, 0, 60 * (pi / 180), 0] call btc_fnc_findsafepos;

private _jip = [_taskID, 13, getPos _city, _city getVariable "name"] call btc_fnc_task_create;

_city setVariable ["spawn_more", true];

private _heli_type = typeOf selectRandom ((btc_vehicles + btc_helo) select {_x isKindOf "air"});
private _heli = createVehicle [_heli_type, _pos, [], 0, "NONE"];
_heli setVariable ["btc_dont_delete", true];
_heli setVariable ["ace_cookoff_enableAmmoCookoff", false, true];
_heli setDamage 1;
_heli enableSimulation false;
_heli setPos [getPosASL _heli select 0, getPosASL _heli select 1, 0 - 1.5];
private _pitch = if (random 1 > 0.5) then {
    random 40
} else {
    -1 * random 40
};
private _bank = if (random 1 > 0.5) then {
    random 40
} else {
    -1 * random 40
};
[_heli, _pitch, _bank] call BIS_fnc_setPitchBank;
private _fx = createVehicle ["test_EmptyObjectForSmoke", _pos, [], 0, "CAN_COLLIDE"];
_fx attachTo [_heli, [0.5, -2, 1]];

private _group = createGroup btc_player_side;
_group setVariable ["no_cache", true];
getText (configfile >> "CfgVehicles" >> _heli_type >> "crew") createUnit [_pos, _group];
private _units = [];
private _triggers = [];
{
    _x setCaptive true;
    removeAllWeapons _x;
    _x setBehaviour "CARELESS";
    _x setDir (random 360);
    _x setUnitPos "DOWN";
    _units pushBack _x;
    //// Create trigger \\\\
    private _trigger = createTrigger ["EmptyDetector", getPos _city];
    _trigger setVariable ["unit", _x];
    _trigger setTriggerArea [50, 50, 0, false];
    _trigger setTriggerActivation [str btc_player_side, "PRESENT", false];
    _trigger setTriggerStatements ["this", "_unit = thisTrigger getVariable 'unit'; [_unit] join (thisList select 0); _unit setUnitPos 'UP';", ""];
    _trigger attachTo [_x, [0, 0, 0]];
    _triggers pushBack _trigger;
} forEach units _group;

waitUntil {sleep 5; (_taskID call BIS_fnc_taskCompleted || (_units select {_x distance btc_create_object_point > 100} isEqualTo []) || (_units select {alive _x} isEqualTo []))};

[[], [_heli, _fx, _group] + _triggers] call btc_fnc_delete;

if (_taskID call BIS_fnc_taskState isEqualTo "CANCELED") exitWith {};
if (_units select {alive _x} isEqualTo []) exitWith {
    [_taskID, "FAIL"] call BIS_fnc_taskSetState;
};

50 call btc_fnc_rep_change;

[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
