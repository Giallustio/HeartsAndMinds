
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_civtreatment

Description:
    Fill me when you edit me !

Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_civtreatment;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

//// Choose a clear City \\\\
private _useful = btc_city_all select {!(_x getVariable ["occupied", false]) && !((_x getVariable ["type", ""]) in ["NameLocal", "Hill", "NameMarine"])};
if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};
private _city = selectRandom _useful;
private _pos = getPos _city;

//// Choose spawn in house or on road \\\\
private _r = random 2;
private _vehpos = [];
if ( _r < 1)    then {
    private _roads = _pos nearRoads 200;
    _roads = _roads select {isOnRoad _x};
    if (_roads isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};
    _pos = getPos (selectRandom _roads);
    _vehpos = [_pos, 10] call btc_fnc_randomize_pos;
} else {
    _houses = [[_pos select 0, _pos select 1, 0], 200] call btc_fnc_getHouses;
    _pos = selectRandom ((selectRandom _houses) buildingPos -1);
    _vehpos = [_pos select 0, _pos select 1, (_pos select 2) + 0.1];
};

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;
publicVariable "btc_side_assigned";

btc_side_jip_data = [8, _pos, _city getVariable "name"];
btc_side_jip_data remoteExec ["btc_fnc_task_create", 0];

//// Create marker \\\\
private _marker = createMarker [format ["sm_2_%1", _pos], _pos];
_marker setMarkerType "hd_flag";
[_marker, "STR_BTC_HAM_SIDE_CIVTREAT_MRK"] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker]; //Civil need help
_marker setMarkerSize [0.6, 0.6];

//// Create civ on _pos \\\\
private _veh = objNull;
private _fx = objNull;
if (_r < 1) then {
    private _veh_type = selectRandom btc_civ_type_veh;
    _veh = createVehicle [_veh_type, _vehpos, [], 0, "NONE"];
    _veh setDir (random 360);
    _veh setDamage 0.7;
    //// Random wheel hit \\\\
    if (_r < 0.5) then {
        _veh setHit ["wheel_1_2_steering", 1];
    } else {
        _veh setHit ["wheel_2_1_steering", 1];
    };
    _veh setHit ["wheel_1_1_steering", 1];
    //// Add smoke effect on car \\\\
    _fx = "test_EmptyObjectForSmoke" createVehicle (getPosATL _veh);
    _fx attachTo [_veh, [0, 0, 0]];
} else {
    _phone_type = selectRandom btc_type_phone;
    _veh = createVehicle [_phone_type, _vehpos, [], 0, "NONE"];
    _veh setDir (random 360);
    _fx = objNull;
};

private _unit_type = selectRandom btc_civ_type_units;
private _group = createGroup civilian;
_group setVariable ["no_cache", true];
private _unit =_group createUnit [_unit_type, _pos, [], 0, "CAN_COLLIDE"];
_unit setBehaviour "CARELESS";
_unit setDir (random 360);
_unit setUnitPos "DOWN";
{_x call btc_fnc_civ_unit_create} forEach units _group;

sleep 1;

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || !(playableUnits inAreaArray [getPosWorld _unit, 5000, 5000] isEqualTo []))};

[_unit] call btc_fnc_set_damage;

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || !Alive _unit || {_unit call ace_medical_status_fnc_isInStableCondition && [_unit] call ace_common_fnc_isAwake})};

btc_side_assigned = false;
publicVariable "btc_side_assigned";
[[_marker], [_veh, _fx], [_group]] call btc_fnc_delete;

if (btc_side_aborted || btc_side_failed || !Alive _unit) exitWith {
    8 remoteExec ["btc_fnc_task_fail", 0];
};

10 call btc_fnc_rep_change;

8 remoteExec ["btc_fnc_task_set_done", 0];

_unit setUnitPos "UP";
