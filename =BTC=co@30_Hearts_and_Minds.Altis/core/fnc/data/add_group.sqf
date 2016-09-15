
private ["_group","_city","_wp","_marker"];

_group = _this;
_group setVariable ["no_cache",nil];
diag_log format ["ADD GROUP = %1",_group];
_city = [leader _group,btc_city_all,false] call btc_fnc_find_closecity;

if (isNull _city) exitWith
{
	while {(count (waypoints _group)) > 0} do
	{
		deleteWaypoint ((waypoints _group) select 0);
	};
	diag_log format ["IS NULL CITY = %1",_group];
	_group setBehaviour "AWARE";
	_wp = _group addWaypoint [position leader _group, 0];
	_wp setWaypointType "GUARD";
	_wp setWaypointCompletionRadius 20;
	_wp setWaypointCombatMode "RED";
};

_city setVariable ["occupied",true];

if (btc_debug) then {(format ["loc_%1",_city getVariable "id"]) setMarkerColor "ColorRed";};

if (_city getVariable ["marker",""] != "") then {_marker = _city getVariable ["marker",""]; _marker setMarkerColor "ColorRed";_marker setMarkerAlpha 0.3;};

if !(_city getVariable ["active",false]) then
{
	private ["_n","_data_units","_data_group"];

	_n = random 1;

	while {(count (waypoints _group)) > 0} do
	{
		deleteWaypoint ((waypoints _group) select 0);
	};

	[_group,_city,600,(random 1)] call btc_fnc_mil_addWP;

	_data_units = _city getVariable ["data_units",[]];
	_data_group = _group call btc_fnc_data_get_group;
	_data_units pushBack _data_group;
	_city setVariable ["data_units",_data_units];
	diag_log format ["PUSHBACK = %1",_data_group];
};

if (btc_final_phase) then
{
	btc_city_remaining pushBack _city;
};
diag_log format ["END = %1",[]];