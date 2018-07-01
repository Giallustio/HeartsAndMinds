params ["_city", "_area"];

if (isNil "btc_traffic_id") then {btc_traffic_id = 0;};

private _cities = btc_city_all inAreaArray [getPosWorld _city, _area, _area];
private _useful = _cities select {!(_x getVariable ["active", false])};

private _pos = [0, 0, 0];
private _Spos = [0, 0, 0];

if (_useful isEqualTo []) then {
    while {_useful isEqualTo []} do {
        _pos = [getPos _city, _area, btc_p_sea] call btc_fnc_randomize_pos;
        if (playableUnits inAreaArray [_pos, 500, 500] isEqualTo []) then {_useful pushBack _pos;};
    };
    _pos = selectRandom _useful;
} else {
    _pos = getPos(selectRandom _useful);
};

private _pos_iswater = false;
private _veh_type = "";

if ((_pos nearRoads 200) isEqualTo []) then {
    _Spos = [_pos, 0, 500, 13, [0,1] select btc_p_sea, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
    _Spos = [_Spos select 0, _Spos select 1, 0];
    _pos_iswater = (surfaceIsWater _Spos);
    if (_pos_iswater) then {
        _veh_type = selectRandom btc_civ_type_boats;
    } else {
        _veh_type = selectRandom btc_civ_type_veh;
    };
} else {
    _Spos = getPos (selectRandom (_pos nearRoads 200));
    _pos_iswater = false;
    _veh_type = selectRandom btc_civ_type_veh;
};

private _veh = createVehicle [_veh_type, _Spos, [], 0, "FLY"];
[_veh, "", []] call BIS_fnc_initvehicle;

private _group = createGroup [civilian, true];
(selectRandom btc_civ_type_units) createUnit [_Spos, _group, "this moveinDriver _veh; this assignAsDriver _veh;"];
_group setVariable ["no_cache", true];
_group setVariable ["btc_patrol", true];
_group setVariable ["btc_traffic_id", btc_traffic_id, btc_debug];
btc_traffic_id = btc_traffic_id + 1;
_group setVariable ["city", _city];

btc_civ_veh_active pushBack _group;

_veh setVariable ["driver", _group];

{
    _x call btc_fnc_civ_unit_create;
    _x setVariable ["traffic", _veh];
} forEach units _group;

private _handleDamageEh = _veh addEventHandler ["HandleDamage", {
    params ["_veh", "_selection", "_damage"];

    if (_damage < 0.1) exitWith {};
    [_veh] call btc_fnc_civ_traffic_eh;
}];
private _fuelEh = _veh addEventHandler ["Fuel", btc_fnc_civ_traffic_eh];
private _getOutEh = _veh addEventHandler ["GetOut", btc_fnc_civ_traffic_eh];
private _handleDamageRepEh = _veh addEventHandler ["HandleDamage", btc_fnc_rep_hd];
_veh setVariable ["eh", [_handleDamageEh, _fuelEh, _getOutEh, _handleDamageRepEh]];

[_group, _area, _pos_iswater] call btc_fnc_civ_traffic_add_WP;
