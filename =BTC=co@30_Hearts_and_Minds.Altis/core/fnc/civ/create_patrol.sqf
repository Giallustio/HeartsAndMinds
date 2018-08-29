
/* ----------------------------------------------------------------------------
Function: btc_fnc_civ_create_patrol

Description:
    Fill me when you edit me !

Parameters:
    _active_city - [Object]
    _area - [Number]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_civ_create_patrol;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_active_city", objNull, [objNull]],
    ["_area", btc_patrol_area, [0]]
];

if (isNil "btc_civilian_id") then {btc_civilian_id = -1;};

//Find a city
private _cities = btc_city_all inAreaArray [getPosWorld _active_city, _area, _area];
private _usefuls = _cities select {!(_x getVariable ["active", false])};
if (_usefuls isEqualTo []) exitWith {false};

private _start_city = selectRandom _usefuls;
private _pos = getPos _start_city;

private _pos_isWater = false;
private _veh_type = "";
private _safe_pos = [];
if ((_pos nearRoads 200) isEqualTo []) then {
    _safe_pos = [_pos, 0, 500, 13, [0,1] select btc_p_sea, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    _safe_pos = [_safe_pos select 0, _safe_pos select 1, 0];
    _pos_isWater = surfaceIsWater _safe_pos;
    if (_pos_isWater) then {
        _veh_type = selectRandom btc_civ_type_boats;
    } else {
        _veh_type = selectRandom btc_civ_type_veh;
    };
} else {
    _safe_pos = getPos (selectRandom (_pos nearRoads 200));
    _veh_type = selectRandom btc_civ_type_veh;
};

private _veh = createVehicle [_veh_type, _safe_pos, [], 0, "FLY"];
[_veh, "", []] call BIS_fnc_initvehicle;

private _group = createGroup [civilian, true];
(selectRandom btc_civ_type_units) createUnit [_safe_pos, _group, "this moveinDriver _veh; this assignAsDriver _veh;"];
_group setVariable ["no_cache", true];
_group setVariable ["btc_patrol_id", btc_civilian_id, btc_debug];
btc_civilian_id = btc_civilian_id - 1;

btc_civ_veh_active pushBack _group;

{
    _x call btc_fnc_civ_unit_create;
} forEach units _group;

private _handleDamageEh = _veh addEventHandler ["HandleDamage", {
    params ["_veh", "_selection", "_damage"];

    if (_damage < 0.1) exitWith {};
    [_veh] call btc_fnc_patrol_eh;
}];
private _fuelEh = _veh addEventHandler ["Fuel", btc_fnc_patrol_eh];
private _getOutEh = _veh addEventHandler ["GetOut", btc_fnc_patrol_eh];
private _handleDamageRepEh = _veh addEventHandler ["HandleDamage", btc_fnc_rep_hd];
_veh setVariable ["btc_eh", [_fuelEh, _handleDamageEh, _getOutEh, _handleDamageRepEh]];
_veh setVariable ["btc_crews", _group];

[_group, [_start_city, _active_city], _area, _pos_isWater] call btc_fnc_patrol_init;

true
