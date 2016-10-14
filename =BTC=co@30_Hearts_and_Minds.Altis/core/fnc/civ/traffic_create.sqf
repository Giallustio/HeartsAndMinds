
private ["_city","_area","_cities","_useful","_unit_type","_veh_type","_group","_veh","_iswater","_pos"];

_city = _this select 0;
_area = _this select 1;

if (isNil "btc_traffic_id") then {btc_traffic_id = 0;};

_cities = btc_city_all select {(_x distance _city < _area)};
_useful = _cities select {!(_x getVariable ["active",false])};
if (_useful isEqualTo []) then {
	while {_useful isEqualTo []} do {
		private "_pos";
		_pos = [getPos _city, _area, true] call btc_fnc_randomize_pos;
		if ({_x distance _pos < 500} count playableUnits == 0) then {_useful pushBack _pos;};
	};
	_pos = selectRandom _useful;
} else {
	_pos = getpos(_useful select (floor random count _useful));
};

_unit_type = btc_civ_type_units select (floor random count btc_civ_type_units);
_veh_type = btc_civ_type_veh select (floor (random (count btc_civ_type_veh)));

_group = createGroup civilian;
_group setVariable ["no_cache",true];
_group setVariable ["btc_patrol",true];
_group setVariable ["btc_traffic_id",btc_traffic_id];btc_traffic_id = btc_traffic_id + 1;
_group setVariable ["city",_city];

_Spos = [];
if (count (_pos nearRoads 100) > 0) then {
	_Spos = getPos ((_pos nearRoads 500) select 0);
} else {
	_Spos = [_pos, 0, 500, 13, 1, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
};

if (surfaceIsWater _Spos) then {
	_Spos = [_Spos select 0, _Spos select 1,0];
	_veh_type = btc_civ_type_boats select (floor (random (count btc_civ_type_boats)));
	_iswater = true;
} else {
	_veh_type = btc_civ_type_veh select (floor (random (count btc_civ_type_veh)));
	_iswater = false;
};

_veh = createVehicle [_veh_type, _Spos, [], 0, "NONE"];
_unit_type createUnit [_pos, _group, "this moveinDriver _veh;this assignAsDriver _veh;"];

_1 = _veh addEventHandler ["HandleDamage", {_this call btc_fnc_civ_traffic_eh}];
_2 = _veh addEventHandler ["Fuel", {_this call btc_fnc_civ_traffic_eh}];
_3 = _veh addEventHandler ["GetOut", {_this call btc_fnc_civ_traffic_eh}];
//_4 = (leader _group) addEventHandler ["HandleDamage", {_this call btc_fnc_civ_traffic_eh}];
//_5 = (leader _group) addEventHandler ["Killed", {_this call btc_fnc_civ_traffic_eh}];

_veh setVariable ["eh", [_1,_2,_3/*,4,5*/]];
_veh setVariable ["driver", leader _group];

btc_civ_veh_active pushBack _group;

{_x call btc_fnc_civ_unit_create;_x setVariable ["traffic",_veh];} foreach units _group;

[_group,_area,_iswater] call btc_fnc_civ_traffic_add_WP;