
private ["_city","_area","_cities","_useful","_unit_type","_veh_type","_group","_veh"];

_city = _this select 0;
_area = _this select 1;

btc_civ_veh_active = btc_civ_veh_active + 1;
if (isNil "btc_traffic_id") then {btc_traffic_id = 0;};

_cities = [];
{if (_x distance _city < _area) then {_cities = _cities + [_x];};} foreach btc_city_all;
_useful = [];
{
	if !(_x getVariable ["active",false]) then {_useful = _useful + [getPos _x];};
} foreach _cities;

if (count _useful == 0) then {
	while {count _useful == 0} do {
		private "_pos";
		_pos = [getPos _city, _area] call btc_fnc_randomize_pos;
		if ({_x distance _pos < 500} count playableUnits == 0) then {_useful = _useful + [_pos];};
	};
};

_pos = _useful select (floor random count _useful);

_unit_type = btc_civ_type_units select (floor random count btc_civ_type_units);
_veh_type = btc_civ_type_veh select (floor (random (count btc_civ_type_veh)));

_group = createGroup civilian;
_group setVariable ["no_cache",true];
_group setVariable ["btc_patrol",true];
_group setVariable ["btc_traffic_id",btc_traffic_id];btc_traffic_id = btc_traffic_id + 1;
_group setVariable ["city",_city];

_Spos = [];
if (count (_pos nearRoads 500) > 0) then {_Spos = getPos ((_pos nearRoads 500) select 0)} else {_Spos = [_pos, 0, 500, 13, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;};
_veh = createVehicle [_veh_type, _Spos, [], 0, "NONE"];
_unit_type createUnit [_pos, _group, "this moveinDriver _veh;this assignAsDriver _veh;"];

_veh setVariable ["driver",leader _group];
_veh addEventHandler ["HandleDamage", {btc_fnc_civ_traffic_hd}];

{_x call btc_fnc_rep_add_eh;_x setVariable ["traffic",_veh];} foreach units _group;

[_group,_area] call btc_fnc_civ_traffic_add_WP;