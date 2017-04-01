
private _factions = _this select 0;

private _type_units = [];
private _type_boats = [];
private _type_veh = [];

//Get all vehicles
private _allclass = ("(configName _x) isKindOf 'AllVehicles'" configClasses (configFile >> "CfgVehicles")) apply {configName _x};
_allclass = _allclass select {getNumber(configfile >> "CfgVehicles" >> _x >> "scope") isEqualTo 2};

//Check if faction existe
_factions = _factions apply {if !isClass(configFile >> "CfgFactionClasses" >> _x) then {"CIV_F"} else {_x};};

{
	private _faction = _x;

	//Get all vehicles of the _faction selected
	private _allclass_f = _allclass select {(toUpper getText(configFile >> "cfgvehicles" >> _x >> "faction")) isEqualTo _faction};

	//Units
	_type_units		append (_allclass_f select {_x isKindOf "Man"});
	if (_type_units isEqualTo []) then {_type_units append ["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_polo_1_F","C_man_polo_1_F_afro","C_man_polo_1_F_euro","C_man_polo_1_F_asia","C_man_polo_2_F","C_man_polo_2_F_afro","C_man_polo_2_F_euro","C_man_polo_2_F_asia","C_man_polo_3_F","C_man_polo_3_F_afro","C_man_polo_3_F_euro","C_man_polo_3_F_asia","C_man_polo_4_F","C_man_polo_4_F_afro","C_man_polo_4_F_euro","C_man_polo_4_F_asia","C_man_polo_5_F","C_man_polo_5_F_afro","C_man_polo_5_F_euro","C_man_polo_5_F_asia","C_man_polo_6_F","C_man_polo_6_F_afro","C_man_polo_6_F_euro","C_man_polo_6_F_asia","C_man_p_fugitive_F","C_man_p_fugitive_F_afro","C_man_p_fugitive_F_euro","C_man_p_fugitive_F_asia","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_beggar_F_euro","C_man_p_beggar_F_asia","C_man_w_worker_F","C_man_hunter_1_F","C_Orestes","C_Nikos","C_Man_casual_4_F","C_Man_casual_5_F","C_Man_casual_6_F","C_Man_sport_1_F","C_Man_sport_2_F","C_Man_sport_3_F","C_Man_casual_1_F","C_Man_casual_2_F","C_Man_casual_3_F"]};

	//Vehicles
	_type_boats		append (_allclass_f select {_x isKindOf "Ship"});
	if (_type_boats isEqualTo []) then {_type_boats append ["C_Rubberboat","C_Boat_Civil_01_F","C_Boat_Civil_01_rescue_F","C_Boat_Civil_01_police_F","C_Boat_Transport_02_F","C_Scooter_Transport_01_F"];};
	_type_veh	append (_allclass_f select {(_x isKindOf "Car") || (_x isKindOf "Truck") || (_x isKindOf "Truck_F")});
	if (_type_veh isEqualTo []) then {_type_veh append ["C_Hatchback_01_F","C_SUV_01_F","C_Offroad_01_F","C_Van_01_transport_F","C_Van_01_box_F","C_Truck_02_transport_F","C_Truck_02_covered_F","C_Offroad_02_unarmed_F"]};
} forEach _factions;

//Final filter unwanted units type
_type_units		= _type_units select {((_x find "_Driver_") isEqualTo -1) && ((_x find "_base") isEqualTo -1) && ((_x find "_unarmed_") isEqualTo -1) && ((_x find "_VR_") isEqualTo -1) && ((_x find "_pilot_") isEqualTo -1)};
_type_veh		= _type_veh select {((_x find "UAV") isEqualTo -1) && ((_x find "UGV") isEqualTo -1) && ((_x find "_Kart_") isEqualTo -1)};


[_type_units,_type_boats,_type_veh]