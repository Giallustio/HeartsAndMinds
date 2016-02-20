
private ["_random","_city","_area","_cities","_useful","_pos","_group","_iswater","_crewmen","_unit_type","_needdiver"];

_random = _this select 0;//0 random, 1 inf, 2 moto, 3 heli
_city = _this select 1;
_area = _this select 2;

if (isNil "btc_patrol_id") then {btc_patrol_id = 0;};

if (btc_debug_log) then {diag_log format ["btc_fnc_mil_patrol_create: _random = %1 _city %2 _area %3 btc_patrol_active = %4",_random,_city,_area,count(btc_patrol_active)];};

if (_random == 0) then {
	private ["_n"];
	_n = random 100;
	switch (true) do {
		case (_n < 40)            : {_random = 1;};
		case (_n > 40 && _n < 90) : {_random = 2;};
		case (_n > 90 && _n < 96) : {_random = 3;};
		case (_n > 96)            : {_random = 4;};
	};
};
_cities = [];
{if (_x distance _city < _area) then {_cities = _cities + [_x];};} foreach btc_city_all;
_useful = [];
{if (!(_x getVariable ["active",false]) && _x getVariable ["occupied",false]) then {_useful = _useful + [getPos _x];};} foreach _cities;

/*
if (count _useful == 0) then {
	while {count _useful == 0} do {
		private "_pos";
		_pos = [getPos _city, _area] call btc_fnc_randomize_pos;
		if ({_x distance _pos < 500} count playableUnits == 0) then {_useful = _useful + [_pos];};
	};
};
*/

if (count _useful == 0) exitWith {true};

_pos = _useful select (floor random count _useful);

_group = createGroup btc_enemy_side;
_group setVariable ["city",_city];
_group setVariable ["no_cache",true];
_group setVariable ["btc_patrol",true];
_group setVariable ["btc_patrol_id",btc_patrol_id];btc_patrol_id = btc_patrol_id + 1;

if (surfaceIsWater _pos) then {_iswater = true;} else {_iswater = false;};

sleep 5 + random 10;

switch (true) do {
	case ((_random == 1) && !_iswater) : {
		_n_units   = 4 + (round random 8);
		_group createUnit [(btc_type_units select 0), _pos, [], 0, "NONE"];(leader _group) setpos _pos;
		for "_i" from 1 to _n_units do {
			private ["_unit_type"];
			_unit_type = btc_type_units select (floor random count btc_type_units);
			_group createUnit [_unit_type, _pos, [], 0, "NONE"];
			sleep 1;
		};
		_spawn = [_group,_area,_iswater] spawn btc_fnc_mil_patrol_addWP;
	};
	case ((_random == 2) || _iswater) : {
		private ["_veh_type","_newZone","_veh","_cargo"];
		_newZone = [];
		if (count (_pos nearRoads 150) > 0) then {
			_newZone = getPos ((_pos nearRoads 150) select 0)
		} else {
			_newZone = [_pos, 0, 500, 13, 1, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
		};
		if (surfaceIsWater _newZone) then {
			_veh_type = btc_type_boats select (floor (random (count btc_type_boats)));
			_iswater = true;
		} else {
			_veh_type = btc_type_motorized select (floor (random (count btc_type_motorized)));
			_iswater = false;
		};
		if (_veh_type == "I_SDV_01_F" || _veh_type == "O_SDV_01_F" || _veh_type == "B_SDV_01_F") then {_needdiver = true; _crewmen = btc_type_divers select 0} else {_needdiver = false; _crewmen = btc_type_crewmen};
		_veh = createVehicle [_veh_type, _newZone, [], 0, "NONE"];
		[_veh,_group,false,"",_crewmen] call BIS_fnc_spawnCrew;
		_group selectLeader (driver _veh);
		_cargo = (_veh emptyPositions "cargo") - 1;
		if (_cargo > 0) then {
			for "_i" from 0 to _cargo do {
				_unit_type = [btc_type_units select (round (random ((count btc_type_units) - 1))), btc_type_divers select (round (random ((count btc_type_divers) - 1)))] select _needdiver ;
				_unit_type createUnit [_pos, _group, "this moveinCargo _veh;this assignAsCargo _veh;"];
			};
		};
		_spawn = [_group,_area,_iswater] spawn btc_fnc_mil_patrol_addWP;
	};
};

btc_patrol_active pushBack _group;

{_x call btc_fnc_mil_unit_create} foreach units _group;