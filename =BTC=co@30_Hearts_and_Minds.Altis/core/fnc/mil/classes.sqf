
private _faction = _this select 0;

//Get all vehicles
private _allclasse = ("(configName _x) isKindOf 'AllVehicles'" configClasses (configFile >> "CfgVehicles")) apply {configName _x};

//Get all vehicles of the _faction selected
if !isClass(configFile >> "CfgFactionClasses" >> _faction) then {_faction = "IND_G_F";};
_allclasse = _allclasse select {getText(configFile >> "cfgvehicles" >> _x >> "faction") isEqualTo _faction};

private _hq				= [btc_hq_red,btc_hq_blu,btc_hq_green] select getNumber(configfile >> "CfgFactionClasses" >> _faction >> "side");
private _enemy_side		= [east,west,independent,civilian] select getNumber(configfile >> "CfgFactionClasses" >> _faction >> "side");

//Units
private _type_divers	= _allclasse select {!((_x find "diver") isEqualTo -1)};
if (_type_divers isEqualTo []) then {_type_divers = ["O_diver_F","O_diver_exp_F","O_diver_TL_F"];};
private _type_units		= (_allclasse select {_x isKindOf "Man"}) - [_type_divers];
if !(_this select 1) then {
	//Remove Anti-Air Units
	_type_units		= _type_units select {(_x find "AA") isEqualTo -1};
};
private _type_crewmen	= _type_units select 0;

//Vehicles
private _type_boats		= _allclasse select {_x isKindOf "Ship"};
if (_type_boats isEqualTo []) then {_type_boats = ["I_Boat_Armed_01_minigun_F","I_Boat_Transport_01_F","I_SDV_01_F","I_G_Boat_Transport_01_F"];};
private _type_motorized	= if (_this select 2) then {
	_allclasse select {(_x isKindOf "Tank") || (_x isKindOf "Car") || (_x isKindOf "Truck")}
} else {
	_allclasse select {(_x isKindOf "Car") || (_x isKindOf "Truck")}
};

//Static
private _type_mg		= _allclasse select {_x isKindOf "StaticGrenadeLauncher"};
if (_type_mg isEqualTo []) then {_type_mg = ["O_HMG_01_F","O_HMG_01_high_F"];};
private _type_gl		= _allclasse select {_x isKindOf "StaticMGWeapon"};
if (_type_gl isEqualTo []) then {_type_mg = ["O_GMG_01_F","O_GMG_01_high_F"];};

//Final filter unwanted units type
_type_units		= _type_units select {(_x find "_base") isEqualTo -1};
_type_motorized = (_type_motorized select {(_x find "UAV") isEqualTo -1}) select {(_x find "UGV")  isEqualTo -1};

//Save classe name to global variable
btc_hq = _hq;
btc_enemy_side = _enemy_side;
btc_type_units = _type_units;
btc_type_divers = _type_divers;
btc_type_crewmen = _type_crewmen;
btc_type_boats = _type_boats;
btc_type_motorized = _type_motorized;
btc_type_mg = _type_mg;
btc_type_gl = _type_gl;