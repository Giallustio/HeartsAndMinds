
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_hostage

Description:
    Fill me when you edit me !

Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_hostage;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

//// Choose an occupied City \\\\
private _useful = btc_city_all select {_x getVariable ["occupied", false] && !((_x getVariable ["type", ""]) in ["NameLocal", "Hill", "NameMarine"])};

if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};

private _city = selectRandom _useful;

//// Randomise position \\\\
private _houses = [getPos _city, 100] call btc_fnc_getHouses;
if (_houses isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};
_houses = _houses apply {[count (_x buildingPos -1), _x]};
_houses sort false;
private _house = objNull;
if (count _houses > 3) then {
    _house = (selectRandom _houses select [0,3]) select 1;
} else {
    _house = _houses select 0 select 1;
};
private _buildingPos = _house buildingPos -1;
private _pos_number = count _buildingPos - 1;
private _pos = _buildingPos select (_pos_number - round random 1);

//// Data side mission
btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;
publicVariable "btc_side_assigned";

btc_side_jip_data = [15, _pos, _city getVariable "name"];
btc_side_jip_data remoteExec ["btc_fnc_task_create", 0];

//// Marker
private _marker = createMarker [format ["sm_2_%1", getPos _house], getPos _house];
_marker setMarkerType "hd_flag";
[_marker, "STR_BTC_HAM_SIDE_HOSTAGE_MRK"] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker]; //Hostage
_marker setMarkerSize [0.6, 0.6];

_city setVariable ["spawn_more", true];

//// Hostage
private _group_civ = createGroup civilian;
_group_civ setVariable ["no_cache", true];
private _captive = _group_civ createUnit [selectRandom btc_civ_type_units, _pos, [], 0, "CAN_COLLIDE"];
waitUntil {local _captive};
[_captive, true] call ACE_captives_fnc_setHandcuffed;
_captive call btc_fnc_civ_unit_create;

private _group = [];
{
    private _grp = createGroup btc_enemy_side;
    private _unit = _grp createUnit [selectRandom btc_type_units, _x, [], 0, "CAN_COLLIDE"];
    [_unit] joinSilent _grp;
    _group pushBack _grp;
    _grp setVariable ["no_cache", true];
    _unit call btc_fnc_mil_unit_create;
} forEach (_buildingPos - [_pos]);

_trigger = createTrigger ["EmptyDetector", _pos];
_trigger setVariable ["group", _group];
_trigger setTriggerArea [20, 20, 0, false];
_trigger setTriggerActivation [str btc_player_side, "PRESENT", true];
_trigger setTriggerStatements ["this", "private _group = thisTrigger getVariable 'group'; {_x setCombatMode 'RED';} forEach _group;", "private _group = thisTrigger getVariable 'group'; {_x setCombatMode 'WHITE';} forEach _group;"];

private _mine = objNull;
if (random 1 > 0.5) then {
    sleep 5;
    _mine = createMine [selectRandom btc_type_mines, getPosATL _captive, [], 0];
};

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || !(_captive getVariable ["ace_captives_isHandcuffed", false]) || !Alive _captive)};

if (!(_captive getVariable ["ace_captives_isHandcuffed", false])) then {
    _mine setDamage 1;
    sleep 1;
};

_group_civ setVariable ["no_cache", false];
{
    _x setVariable ["no_cache", false];
} forEach _group;
btc_side_assigned = false;
publicVariable "btc_side_assigned";

if (btc_side_aborted || btc_side_failed || !(Alive _captive)) exitWith {
    15 remoteExec ["btc_fnc_task_fail", 0];
    [[_marker], [_trigger, _mine], _group + [_group_civ]] call btc_fnc_delete;
};

40 call btc_fnc_rep_change;

[[_marker], [], []] call btc_fnc_delete;
15 remoteExec ["btc_fnc_task_set_done", 0];
