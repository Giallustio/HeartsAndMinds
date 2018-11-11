
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_vehicle

Description:
    Fill me when you edit me !

Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_vehicle;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

private _useful = btc_city_all select {_x getVariable ["type", ""] != "NameMarine"};
if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};
private _city = selectRandom _useful;

private _pos = [getPos _city, 100] call btc_fnc_randomize_pos;
private _roads = _pos nearRoads 300;
if !(_roads isEqualTo []) then {_pos = getPos (selectRandom _roads);};

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;
publicVariable "btc_side_assigned";

btc_side_jip_data = [5, _pos, _city getVariable "name"];
btc_side_jip_data remoteExec ["btc_fnc_task_create", 0];

private _area = createMarker [format ["sm_%1", _pos], _pos];
_area setMarkerShape "ELLIPSE";
_area setMarkerBrush "SolidBorder";
_area setMarkerSize [30, 30];
_area setMarkerAlpha 0.3;
_area setmarkercolor "colorBlue";

private _marker = createMarker [format ["sm_2_%1", _pos], _pos];
_marker setMarkerType "hd_flag";
[_marker, "STR_BTC_HAM_SIDE_VEHICLE_MRK"] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker]; // Vehicle needs assistance
_marker setMarkerSize [0.6, 0.6];

private _veh_type = selectRandom btc_civ_type_veh;
private _veh = createVehicle [_veh_type, _pos, [], 0, "NONE"];
_veh setDir (random 360);
_veh setDamage 0.7;
_veh setHit ["wheel_1_1_steering", 1];

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || (_veh getHit "wheel_1_1_steering" < 1) || !Alive _veh)};

btc_side_assigned = false;
publicVariable "btc_side_assigned";
[[_area, _marker], [_veh], []] call btc_fnc_delete;

if (btc_side_aborted || btc_side_failed || !Alive _veh) exitWith {
    5 remoteExec ["btc_fnc_task_fail", 0];
};

15 call btc_fnc_rep_change;

5 remoteExec ["btc_fnc_task_set_done", 0];
