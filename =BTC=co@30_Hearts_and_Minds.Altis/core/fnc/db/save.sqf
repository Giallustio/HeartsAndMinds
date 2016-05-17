/*
profileNamespace setVariable ["var_kills",10000];
saveProfileNamespace;
_playerKills = profileNamespace getVariable "var_kills";*/

call btc_fnc_db_delete;

private ["_cities_status","_fobs","_name","_array_ho","_data","_array_cache","_array_veh","_array_obj","_cargo","_cont","_idshift"];

hint "saving...";
[[8],"btc_fnc_show_hint"] spawn BIS_fnc_MP;

btc_db_is_saving = true;
_name = worldName;

//Version
profileNamespace setVariable [format ["btc_hm_%1_version",_name],btc_version];

//World Date
profileNamespace setVariable [format ["btc_hm_%1_date",_name],date];

for "_i" from 0 to (count btc_city_all - 1) do {
	private "_s";
	_s = [_i] spawn btc_fnc_city_de_activate;
	waitUntil {scriptDone _s};
};
hint "saving...2";
//City status
_cities_status = [];
_idshift = 0;
{
	//[151,false,false,true,false,false,[]]
	_city_status = [];
	if !(isNull (_x)) then {
		_city_status pushBack ((_x getVariable "id" ) + _idshift);

		//_city_status pushBack (_x getVariable "name");

		_city_status pushBack (_x getVariable "initialized");

		_city_status pushBack (_x getVariable "spawn_more");
		_city_status pushBack (_x getVariable "occupied");

		_city_status pushBack (_x getVariable "data_units");

		_city_status pushBack (_x getVariable ["has_ho",false]);
		_city_status pushBack (_x getVariable ["ho_units_spawned",false]);
		_city_status pushBack (_x getVariable ["ieds",[]]);

		_cities_status pushBack _city_status;
		//diag_log format ["SAVE: %1 - %2",(_x getVariable "id"),(_x getVariable "occupied")];
	} else {
		// if city has been remove (only city with destroyed hideout are removed) ignore it and shift down the id of next city
		_idshift = _idshift - 1;
	};
} foreach btc_city_all;
profileNamespace setVariable [format ["btc_hm_%1_cities",_name],_cities_status];

//HIDEOUT
_array_ho = [];
{
	_data = [];
	_data pushBack (getPos _x);
	_data pushBack (_x getVariable ["id",0]);
	_data pushBack (_x getVariable ["rinf_time",0]);
	_data pushBack (_x getVariable ["cap_time",0]);
	_data pushBack (_x getVariable ["assigned_to",objNull]);

	_ho_markers = [];
	{
		_marker = [];
		_marker pushback (getMarkerPos _x);
		_marker pushback (markerText _x);
		_ho_markers pushback _marker;
	} foreach (_x getVariable ["markers",[]]);
	_data pushback (_ho_markers);
	diag_log format ["HO %1 DATA %2",_x,_data];
	_array_ho pushBack _data;
} foreach btc_hideouts;
profileNamespace setVariable [format ["btc_hm_%1_ho",_name],_array_ho];

profileNamespace setVariable [format ["btc_hm_%1_ho_sel",_name],(btc_hq getVariable ["info_hideout",objNull])];

//CACHE
_array_cache = [];
_array_cache pushback (getposATL btc_cache_obj);
_array_cache pushback (btc_cache_n);
_array_cache pushback (btc_cache_info);
_cache_markers = [];
{
	_data = [];
	_data pushback (getMarkerPos _x);
	_data pushback (markerText _x);
	_cache_markers pushBack _data;
} foreach btc_cache_markers;
_array_cache pushback (_cache_markers);
profileNamespace setVariable [format ["btc_hm_%1_cache",_name],_array_cache];

//rep status
profileNamespace setVariable [format ["btc_hm_%1_rep",_name],btc_global_reputation];
//FOBS
_fobs = [[],[]];
{
	private "_pos";
	_pos = getMarkerPos _x;
	(_fobs select 0) pushBack [_x,_pos];
} foreach (btc_fobs select 0);
(_fobs select 1) append (btc_fobs select 1);
profileNamespace setVariable [format ["btc_hm_%1_fobs",_name],_fobs];

//Vehicles status
_array_veh = [];
{
	private ["_data","_cargo","_cont"];
	_data = [];
	_data pushBack (typeOf _x);
	_data pushBack (getPos _x);
	_data pushBack (getDir _x);
	_data pushBack (fuel _x);
	_data pushBack (damage _x);
	_cargo = [];
	{_cargo pushBack [(typeOf _x),(_x getVariable ["ace_rearm_magazineClass",""]),[getWeaponCargo _x,getMagazineCargo _x,getItemCargo _x]]} foreach (_x getVariable ["cargo",[]]);
	_data pushBack _cargo;
	_cont = [getWeaponCargo _x,getMagazineCargo _x,getItemCargo _x];
	_data pushBack _cont;
	_array_veh pushBack _data;
	//diag_log format ["VEH %1 DATA %2",_x,_data];
} foreach btc_vehicles;
profileNamespace setVariable [format ["btc_hm_%1_vehs",_name],_array_veh];

//Objects status
_array_obj = [];
{
	if !(!isNil {_x getVariable "loaded"} || !Alive _x || isNull _x) then {
		_data = [];
		_data pushBack (typeOf _x);
		_data pushBack (getPosASL _x);
		_data pushBack (getDir _x);
		_data pushBack (_x getVariable ["ace_rearm_magazineClass",""]);
		_cargo = [];
		{_cargo pushBack [(typeOf _x),(_x getVariable ["ace_rearm_magazineClass",""]),[getWeaponCargo _x,getMagazineCargo _x,getItemCargo _x]]} foreach (_x getVariable ["cargo",[]]);
		_data pushBack _cargo;
		_cont = [getWeaponCargo _x,getMagazineCargo _x,getItemCargo _x];
		_data pushBack _cont;

		_array_obj pushBack _data;
	};
} foreach btc_log_obj_created;
profileNamespace setVariable [format ["btc_hm_%1_objs",_name],_array_obj];

//
profileNamespace setVariable [format ["btc_hm_%1_db",_name],true];
saveProfileNamespace;
hint "saving...3";
[[9],"btc_fnc_show_hint"] spawn BIS_fnc_MP;

btc_db_is_saving = false;