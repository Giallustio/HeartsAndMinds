
private ["_cities_status","_fobs","_fobs_loaded"];

//CITIES
_cities_status = profileNamespace getVariable ["btc_hm_cities",[]];
//diag_log format ["_cities_status: %1",_cities_status];

{
	private ["_id","_city"];
	_id = _x select 0;
	_city = btc_city_all select _id;

	_city setVariable ["initialized",(_x select 1)];
	_city setVariable ["spawn_more",(_x select 2)];
	_city setVariable ["occupied",(_x select 3)];
	_city setVariable ["data_units",(_x select 4)];
	_city setVariable ["has_ho",(_x select 5)];
	_city setVariable ["ho_units_spawned",(_x select 6)];
	_city setVariable ["ieds",(_x select 7)];
	
	if (btc_debug) then	{//_debug

		if ((_x select 1)) then {(_city getVariable ["marker",""]) setmarkercolor "colorRed";} else {(_city getVariable ["marker",""]) setmarkercolor "colorGreen";};
		(_city getVariable ["marker",""]) setmarkertext format ["loc_%3 %1 %2 - [%4]",(_city getVariable "name"),_city getVariable "type",_id,(_x select 1)];
		
		diag_log format ["ID: %1",_id];
		diag_log format ["data_city: %1",_x];
		diag_log format ["LOAD: %1 - %2",_id,(_x select 3)];
	};
} foreach _cities_status;

//REP
btc_global_reputation = profileNamespace getVariable ["btc_hm_rep",0];

//FOB
_fobs = profileNamespace getVariable ["btc_hm_fobs",[]];
_fobs_loaded = [];

{
	private ["_pos"];
	_pos = (_x select 1);
	createmarker [(_x select 0), _pos];
	(_x select 0) setMarkerSize [1,1];
	(_x select 0) setMarkerType "hd_flag";
	(_x select 0) setMarkerText (_x select 0);
	(_x select 0) setMarkerColor "ColorBlue";
	(_x select 0) setMarkerShape "ICON";
	{createVehicle [_x, _pos, [], 0, "NONE"];} foreach [btc_fob_structure,btc_fob_flag];
	_fobs_loaded pushBack (_x select 0);
} foreach _fobs;

btc_fobs = _fobs_loaded;

//VEHICLES
/*	_data pushBack (typeOf _x);
	_data pushBack (getPos _x);
	_data pushBack (getDir _x);
	_data pushBack (fuel _x);
	_data pushBack (damage _x);
*/

{deleteVehicle _x} foreach btc_vehicles;
btc_vehicles = [];
_vehs = profileNamespace getVariable ["btc_hm_vehs",[]];

{
	private "_veh";
	_veh = (_x select 0) createVehicle (_x select 1);
	btc_vehicles = btc_vehicles + [_veh];
	_veh addEventHandler ["Killed", {_this call btc_fnc_eh_veh_killed}];
	_veh setVariable ["btc_dont_delete",true];
	_veh setDir (_x select 2);
	_veh setFuel (_x select 3);
	_veh setDamage (_x select 4);
} foreach _vehs;





















