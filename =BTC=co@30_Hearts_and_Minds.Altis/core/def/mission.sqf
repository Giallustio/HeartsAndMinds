
private ["_p_db","_p_en","_hideout_n","_cache_info_def","_cache_info_ratio","_info_chance","_p_rep","_p_skill","_c_array","_tower","_array","_chopper"];

btc_version = 1.14; diag_log format ["=BTC= HEARTS AND MINDS VERSION %1",btc_version];

//Param
btc_p_time = (paramsArray select 0);
btc_p_acctime = (paramsArray select 1);
_p_db = if ((paramsArray select 2) isEqualTo 0) then {false} else {true};
_p_en = (paramsArray select 3);
btc_p_ied = (paramsArray select 4);
btc_p_engineer  = (paramsArray select 5);
_hideout_n = (paramsArray select 6);
_cache_info_def = (paramsArray select 7);
_cache_info_ratio = (paramsArray select 8);
_info_chance = (paramsArray select 9);
_p_rep = (paramsArray select 10);
btc_p_redeploy = if ((paramsArray select 11) isEqualTo 0) then {false} else {true};
ace_medical_level = paramsArray select 12;
ace_medical_enableAdvancedWounds = if ((paramsArray select 13) isEqualTo 0) then {false} else {true};
ace_medical_maxReviveTime = paramsArray select 14;
btc_p_set_skill  = if ((paramsArray select 15) isEqualTo 0) then {false} else {true};
_p_skill = [
	(paramsArray select 16)/10,//general
	(paramsArray select 17)/10,//aimingAccuracy
    (paramsArray select 18)/10,//aimingShake
    (paramsArray select 19)/10,//aimingSpeed
    (paramsArray select 20)/10,//endurance
    (paramsArray select 21)/10,//spotDistance
    (paramsArray select 22)/10,//spotTime
    (paramsArray select 23)/10,//courage
    (paramsArray select 24)/10,//reloadSpeed
    (paramsArray select 25)/10//commanding
];
btc_p_debug  = (paramsArray select 26);
//MED
if (ace_medical_maxReviveTime > 0) then {ace_medical_enableRevive = 1;ace_medical_preventInstaDeath = true};
ace_medical_enableFor = 1;

btc_p_sea  = if ((paramsArray select 27) isEqualTo 0) then {false} else {true};
_p_civ = (paramsArray select 28);
//btc_acre_mod = isClass(configFile >> "cfgPatches" >> "acre_main");
//btc_tfr_mod = isClass(configFile >> "cfgPatches" >> "task_force_radio");

switch (btc_p_debug) do {
	case 0 : {btc_debug_log = false;btc_debug = false;};
	case 1 : {btc_debug_log = true;btc_debug = true;};
	case 2 : {btc_debug_log = true;btc_debug = false;};
};

if (!isMultiplayer) then {btc_debug_log = true;btc_debug = true;};

if (isServer) then {
	btc_final_phase = false;

	//City
	btc_city_radius = 300;
	btc_city_blacklist = [];//NAME FROM CFG

	//Civ
	btc_civ_veh_active = [];

	//Database
	btc_db_is_saving = false;
	btc_db_load = _p_db;

	//Hideout
	btc_hideouts = [];
	btc_hideouts_id = 0;
	btc_hideout_n = _hideout_n;
	if (btc_hideout_n == 99) then {
		btc_hideout_n = (round random 5);
	};
	btc_hideout_safezone = 4000;
	btc_hideout_range = 3500;
	btc_hideout_rinf_time = 600;
	btc_hideout_cap_time = 1800;
	btc_hideout_cap_checking = false;

	//IED
	btc_ied_suic_time = 900;
	btc_ied_suic_spawned = - btc_ied_suic_time;

	//FOB
	btc_fobs = [[],[]];


	//Log
	btc_log_id_repo = 10;
	btc_log_cargo_repo = "Land_HBarrierBig_F" createVehicle [- 5000,- 5000,0];

	//Patrol
	btc_patrol_max = 8;
	btc_patrol_active = [];
	btc_patrol_area = 2500;

	//Rep
	btc_global_reputation = _p_rep;
	btc_rep_militia_call_time = 600;
	btc_rep_militia_called = - btc_rep_militia_call_time;

	btc_composition_hideout = [
		["C_supplyCrate_F",0,[0.2,0.2,0]],
		["Flag_Red_F",0,[-0.542969,-0.270508,-0.00143433]],
		["Campfire_burning_F",0,[-1.24414,-2.12183,-0.0314331]],
		["Land_Sleeping_bag_blue_F",146.026,[2.82666,-1.77124,-0.00143433]],
		["Land_TentDome_F",0,[1.08496,-3.35547,-0.00143433]],
		["Land_TentA_F",349.935,[-2.09814,2.94702,-0.00143433]],
		["Land_TentA_F",349.935,[1.10889,3.53687,-0.00143433]],
		["Land_Portable_generator_F",243.462,[-3.89404,1.15088,-0.0022583]],
		["Land_Sleeping_bag_blue_F",146.026,[4.00879,-1.00842,-0.00143433]],
		["C_supplyCrate_F",55.6146,[-4.60059,-2.28027,-0.00143433]],
		["Land_PaperBox_open_full_F",143.441,[-3.74023,-3.77405,-0.00143433]],
		["Land_TentDome_F",0,[-5.93555,0.444702,-0.00143433]],
		["Land_PaperBox_closed_F",0,[-5.76221,-3.35876,-0.00143433]],
		["Land_PaperBox_open_empty_F",324.641,[-4.91895,-4.99585,-0.00143433]],
		["Land_Pallet_MilBoxes_F",297.549,[-7.8623,-2.05115,-0.00143433]]
	];

	//Side
	btc_side_aborted = false;
	btc_side_assigned = false;
	btc_side_done = false;
	btc_side_failed = false;
	btc_side_list = if (btc_p_sea) then {[0,1,2,3,4,5,6,7,8]} else {[0,1,2,3,4,5,6]};
	btc_side_list_use = + btc_side_list;
	btc_side_jip_data = [];
	btc_type_tower = ["Land_Communication_F","Land_TTowerBig_1_F","Land_TTowerBig_2_F"];
	btc_type_phone = ["Land_PortableLongRangeRadio_F","Land_MobilePhone_smart_F","Land_MobilePhone_old_F"];
	btc_type_barrel = ["Land_GarbageBarrel_01_F","Land_BarrelSand_grey_F","MetalBarrel_burning_F","Land_BarrelWater_F","Land_MetalBarrel_F","Land_MetalBarrel_empty_F"];
	btc_type_canister = ["Land_CanisterPlastic_F"];
	btc_type_pallet = ["Land_Pallets_stack_F","Land_Pallets_F","Land_Pallet_F"];
	btc_type_box = ["Box_East_Wps_F","Box_East_WpsSpecial_F","Box_East_Ammo_F"];
	btc_type_generator = ["Land_Device_assembled_F","Land_Device_disassembled_F"];
	btc_type_storagebladder = ["StorageBladder_02_water_forest_F","StorageBladder_02_water_sand_F"];

	//Vehs
	btc_vehicles = [btc_veh_1,btc_veh_2,btc_veh_3,btc_veh_4,btc_veh_5,btc_veh_6,btc_veh_7,btc_veh_8,btc_veh_9,btc_veh_10,btc_veh_11,btc_veh_12,btc_veh_13,btc_veh_14];
	btc_helo = [btc_helo_1];
};

//City
btc_city_type = "Land_Ammobox_rounds_F";

//Civ
switch (true) do {
	case (_p_civ == 0) :	{
		btc_civ_type_units  = ["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_polo_1_F","C_man_polo_1_F_afro","C_man_polo_1_F_euro","C_man_polo_1_F_asia","C_man_polo_2_F","C_man_polo_2_F_afro","C_man_polo_2_F_euro","C_man_polo_2_F_asia","C_man_polo_3_F","C_man_polo_3_F_afro","C_man_polo_3_F_euro","C_man_polo_3_F_asia","C_man_polo_4_F","C_man_polo_4_F_afro","C_man_polo_4_F_euro","C_man_polo_4_F_asia","C_man_polo_5_F","C_man_polo_5_F_afro","C_man_polo_5_F_euro","C_man_polo_5_F_asia","C_man_polo_6_F","C_man_polo_6_F_afro","C_man_polo_6_F_euro","C_man_polo_6_F_asia","C_man_p_fugitive_F","C_man_p_fugitive_F_afro","C_man_p_fugitive_F_euro","C_man_p_fugitive_F_asia","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_beggar_F_euro","C_man_p_beggar_F_asia","C_man_w_worker_F","C_man_hunter_1_F","C_Orestes","C_Nikos"];
		btc_civ_type_veh    = ["C_Hatchback_01_F","C_SUV_01_F","C_Offroad_01_F","C_Van_01_transport_F","C_Van_01_box_F"];
		btc_civ_type_boats    = ["C_Rubberboat","C_Boat_Civil_01_F","C_Boat_Civil_01_rescue_F","C_Boat_Civil_01_police_F"];
	};
	case (_p_civ == 1 && isClass(configFile >> "cfgVehicles" >> "Afghan_Civilian2")) :	{
		btc_civ_type_units  = ["Afghan_Civilian2","Afghan_Civilian2NH","Afghan_civilian3","Afghan_civilian3NH","Afghan_Civilian4","Afghan_Civilian5","Afghan_Civilian6","Afghan_Civilian6NH","Afghan_civilian1","Afghan_civilian1NH"];
		btc_civ_type_veh    = ["C_Hatchback_01_F","C_SUV_01_F","C_Offroad_01_F","C_Van_01_transport_F","C_Van_01_box_F"];
		btc_civ_type_boats    = ["C_Rubberboat","C_Boat_Civil_01_F","C_Boat_Civil_01_rescue_F","C_Boat_Civil_01_police_F"];
	};
	default	{
		btc_civ_type_units  = ["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_polo_1_F","C_man_polo_1_F_afro","C_man_polo_1_F_euro","C_man_polo_1_F_asia","C_man_polo_2_F","C_man_polo_2_F_afro","C_man_polo_2_F_euro","C_man_polo_2_F_asia","C_man_polo_3_F","C_man_polo_3_F_afro","C_man_polo_3_F_euro","C_man_polo_3_F_asia","C_man_polo_4_F","C_man_polo_4_F_afro","C_man_polo_4_F_euro","C_man_polo_4_F_asia","C_man_polo_5_F","C_man_polo_5_F_afro","C_man_polo_5_F_euro","C_man_polo_5_F_asia","C_man_polo_6_F","C_man_polo_6_F_afro","C_man_polo_6_F_euro","C_man_polo_6_F_asia","C_man_p_fugitive_F","C_man_p_fugitive_F_afro","C_man_p_fugitive_F_euro","C_man_p_fugitive_F_asia","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_beggar_F_euro","C_man_p_beggar_F_asia","C_man_w_worker_F","C_man_hunter_1_F","C_Orestes","C_Nikos"];
		btc_civ_type_veh    = ["C_Hatchback_01_F","C_SUV_01_F","C_Offroad_01_F","C_Van_01_transport_F","C_Van_01_box_F"];
		btc_civ_type_boats    = ["C_Rubberboat","C_Boat_Civil_01_F","C_Boat_Civil_01_rescue_F","C_Boat_Civil_01_police_F"];
	}
};
btc_civ_max_veh = 10;
btc_w_civs = ["V_Rangemaster_belt","arifle_Mk20_F","30Rnd_556x45_Stanag","hgun_ACPC2_F","9Rnd_45ACP_Mag"];

//Cache
btc_cache_type = "Box_East_Ammo_F";

//FOB
btc_fob_mat = "Land_Cargo20_blue_F";
btc_fob_structure = "Land_Cargo_HQ_V1_F";
btc_fob_flag = "Flag_NATO_F";
btc_fob_id = 0;

//IED
btc_type_ieds = ["Land_GarbageContainer_closed_F","Land_GarbageContainer_open_F","Land_GarbageBarrel_01_F","Land_JunkPile_F","Land_Pallets_F","Land_Portable_generator_F","Land_WoodenBox_F","Land_MetalBarrel_F","Land_BarrelTrash_grey_F","Land_Sacks_heap_F","Land_Bricks_V2_F","Land_Bricks_V3_F","Land_Bricks_V4_F","Land_GarbageBags_F","Land_GarbagePallet_F","Land_GarbageWashingMachine_F","Land_JunkPile_F","Land_Tyres_F","Land_Wreck_Skodovka_F","Land_Wreck_Car_F","Land_Wreck_Car3_F","Land_Wreck_Car2_F","Land_Wreck_Offroad_F","Land_Wreck_Offroad2_F"];
btc_ied_check_time = 10;
btc_ied_disarm_time = 10;

//Int
btc_int_radius_orders = 25;
btc_int_search_intel_time = 4;

//Info
btc_info_intel_chance = _info_chance;
btc_info_intel_type = [80,95];//cache - hd - both
btc_info_cache_def = _cache_info_def;
btc_info_cache_ratio = _cache_info_ratio;
btc_info_hideout_radius = 4000;

//Supplies
btc_supplies_mat ="Land_Cargo20_red_F";

//Log
if (isServer) then {
	_btc_rearming_vehicles = (btc_vehicles + btc_helo) apply {typeOf _x};
	{
		_btc_rearming_vehicles = _btc_rearming_vehicles - [_x];
		if (count (configFile >> "CfgVehicles" >> _x >> "Turrets") > 0) then {
			_btc_rearming_vehicles pushBack _x;
		};
	} forEach _btc_rearming_vehicles;

	#define	REARM_TURRET_PATHS  [[-1], [0], [0,0], [0,1], [1], [2], [0,2]]
	btc_construction_array =
	[
		[
			"Fortifications",
			"Static",
			"Ammobox",
			"Containers",
			"Supplies",
			"FOB",
			"Vehicle Logistic"
		] + (_btc_rearming_vehicles apply {getText (configFile >> "cfgVehicles" >> _x >> "displayName")}),
		[
			[
				//"Fortifications"
				"Land_BagBunker_Small_F",
				"Land_BagFence_Corner_F",
				"Land_BagFence_End_F",
				"Land_BagFence_Long_F",
				"Land_BagFence_Round_F",
				"Land_BagFence_Short_F",
				"Land_HBarrier_1_F",
				"Land_HBarrier_3_F",
				"Land_HBarrier_5_F",
				"Land_HBarrierBig_F",
				"Land_Razorwire_F",
				"Land_CncBarrier_F",
				"Land_CncBarrierMedium_F",
				"Land_CncBarrierMedium4_F",
				"Land_CncWall1_F",
				"Land_CncWall4_F",
				"Land_Mil_ConcreteWall_F",
				"Land_Mil_WallBig_4m_F",
				"Land_Mil_WallBig_Corner_F",
				"Land_PortableLight_double_F"
			],
			[
				//"Static"
				"B_static_AT_F",
				"B_static_AA_F",
				"B_GMG_01_A_F",
				"B_GMG_01_high_F",
				"B_GMG_01_F",
				"B_HMG_01_A_F",
				"B_HMG_01_high_F",
				"B_HMG_01_F",
				"B_Mortar_01_F"
			],
			[
				//"Ammobox"
				"rhsusf_mags_crate",
				"Box_NATO_Ammo_F",
				"Box_NATO_Support_F",
				"ACE_medicalSupplyCrate_advanced",
				"ACE_medicalSupplyCrate",
				"B_supplyCrate_F",
				"B_CargoNet_01_ammo_F"
			],
			[
				//"Containers"
				"Land_Cargo20_military_green_F",
				"Land_Cargo40_military_green_F"

			],
			[
				//"Supplies"
				btc_supplies_mat
			],
			[
				//"FOB"
				btc_fob_mat
			],
			[
				//"Vehicle logistic"
				"ACE_Wheel",
				"ACE_Track"
			]
		] + (_btc_rearming_vehicles apply {
				_vehicles = _x;
				_magazines = [];
				{
					_magazines append (([_vehicles,_x] call btc_fnc_log_getconfigmagazines));
				} forEach REARM_TURRET_PATHS;
				{
					_magazines = _magazines - [_x];
					_magazines pushBack _x;
				} forEach _magazines;
				_magazines
			})
	];
} else {
	btc_int_ask_data = nil;
	// [[7,nil,player],"btc_fnc_int_ask_var",false] spawn BIS_fnc_MP;
	while {isNil "btc_int_ask_data"} do
	{
		[7,nil,player] remoteExec ["btc_fnc_int_ask_var",2];
		private ["_i"];
		_i = 0;
		waitUntil {sleep 1; _i = _i + 1; (_i >= 5 || (!(isNil "btc_int_ask_data")))};
	};
	btc_construction_array = btc_int_ask_data;
};

_c_array = btc_construction_array select 1;
btc_log_def_draggable = (_c_array select 1) + (_c_array select 2);
btc_log_def_loadable = (_c_array select 0) + (_c_array select 1) + (_c_array select 2) + (_c_array select 3) + (_c_array select 4) + (_c_array select 5) + (_c_array select 6) + (["ace_rearm_defaultCarriedObject", "ace_rearm_Bo_Mk82","ace_rearm_Bomb_04_F","ace_rearm_Bo_GBU12_LGB","ace_rearm_Bomb_03_F","ace_rearm_Missile_AA_03_F","ace_rearm_Missile_AGM_02_F","ace_rearm_Missile_AGM_01_F","ace_rearm_Rocket_03_AP_F","ace_rearm_R_80mm_HE","ace_rearm_R_60mm_HE","ace_rearm_Rocket_04_HE_F","ace_rearm_R_Hydra_HE","ace_rearm_Missile_AA_04_F","ace_rearm_M_PG_AT","ace_rearm_R_230mm_HE","ace_rearm_Rocket_03_HE_F","ace_rearm_Rocket_04_AP_F","ace_rearm_R_230mm_fly"]);
btc_log_def_can_load = (_c_array select 3);
btc_log_def_placeable = (_c_array select 0) + (_c_array select 3) + (_c_array select 4) + (_c_array select 5);
btc_log_max_distance_load = 15;
btc_log_object_selected = objNull;
btc_log_vehicle_selected = objNull;
btc_log_placing_max_h = 12;
btc_log_placing = false;
btc_log_obj_created = [];

btc_log_main_cc =
[
	"Motorcycle",1,
	"Car",3,
	"Truck",10,
	"Wheeled_APC",5,
	"Tank",5,
	"Ship",3,
	"Helicopter",6
];
btc_log_main_rc =
[
	"ReammoBox_F",2,
	"thingX",3,
	"StaticWeapon",3,
	"Strategic",2,
	"Motorcycle",3,
	"Land_BarGate_F",3,
	"HBarrier_base_F",5,
	"Land_BagFence_Long_F",3,
	"Wall_F",5,
	"BagBunker_base_F",5,
	"Car",35,
	"Truck",50,
	"Wheeled_APC",50,
	"Tank",75,
	"Ship",50,
	"Helicopter",9999
];
btc_log_def_cc =
[
	"B_Quadbike_01_F",2,
	"B_UGV_01_rcws_F",4,
	"B_UGV_01_F",4,
	"Land_CargoBox_V1_F",0,
	btc_supplies_mat,0,
	btc_fob_mat,0,
	"Land_Cargo20_military_green_F",20,
	"Land_Cargo40_military_green_F",40,
	//Trucks
	"B_Truck_01_transport_F",10,
	"B_Truck_01_covered_F",10,
	"I_Truck_02_covered_F",10,
	"O_Truck_02_covered_F",10,
	"I_Truck_02_transport_F",10,
	"O_Truck_02_transport_F",10,
	"O_Truck_02_transport_F",10
];
btc_log_def_rc =
[
	"Land_BagBunker_Small_F",5,
	"Land_CargoBox_V1_F",9999,
	btc_supplies_mat,10,
	btc_fob_mat,10,
	"Land_Cargo20_military_green_F",20,
	"Land_Cargo40_military_green_F",40
];

btc_fnc_log_get_towable = {
	_tower = _this select 0;
	_array   = [];
	switch (true) do {
		case (_tower isKindOf "Car") : {_array = ["Car"];};
		case (_tower isKindOf "Truck") : {_array = ["Car","Truck"];};
		case (_tower isKindOf "Truck") : {_array = ["Car","Truck","Wheeled_APC"];};
		case (_tower isKindOf "Wheeled_APC") : {_array = ["Car","Truck","Wheeled_APC"];};
	};
	_array
};

//Lift
btc_fnc_log_get_liftable = {
	_chopper = _this select 0;
	_array   = [];
	switch (typeOf _chopper) do	{
		//MH9
		case "B_Heli_Light_01_F"     : {_array = ["Motorcycle","ReammoBox","ReammoBox_F","Quadbike_01_base_F","Strategic"];};
		//PO-30
		case "O_Heli_Light_02_F"     : {_array = ["Motorcycle","ReammoBox","ReammoBox_F","StaticWeapon","Car"];};

		case "RHS_UH1Y_d" : {_array = (["Motorcycle","ReammoBox","ReammoBox_F","StaticWeapon","Car","Truck","Wheeled_APC","Air","Ship"]) + ((btc_construction_array select 1) select 3) + ((btc_construction_array select 1) select 4) + ((btc_construction_array select 1) select 5);};

		//UH80
		case "B_Heli_Transport_01_F" : {_array = (["Motorcycle","ReammoBox","ReammoBox_F","StaticWeapon","Car","Truck","Wheeled_APC","Air","Ship"]) + ((btc_construction_array select 1) select 3) + ((btc_construction_array select 1) select 4) + ((btc_construction_array select 1) select 5);};
		//UH80 - CAMO
		case "B_Heli_Transport_01_camo_F" : {_array = (["Motorcycle","ReammoBox","ReammoBox_F","StaticWeapon","Car","Truck","Wheeled_APC","Air","Ship"]) + ((btc_construction_array select 1) select 3) + ((btc_construction_array select 1) select 4) + ((btc_construction_array select 1) select 5);};
		//CH49
		case "I_Heli_Transport_02_F" : {_array = (["Motorcycle","ReammoBox","ReammoBox_F","StaticWeapon","Car","Truck","Wheeled_APC","Tracked_APC","APC_Tracked_01_base_F","APC_Tracked_02_base_F","Air","Ship"]) + ((btc_construction_array select 1) select 3) + ((btc_construction_array select 1) select 4) + ((btc_construction_array select 1) select 5);};

		case "RHS_CH_47F_10" : {_array = (["Motorcycle","ReammoBox","ReammoBox_F","StaticWeapon","Car","Truck","Wheeled_APC","Tracked_APC","APC_Tracked_01_base_F","APC_Tracked_02_base_F","Air","Ship"]) + ((btc_construction_array select 1) select 3) + ((btc_construction_array select 1) select 4) + ((btc_construction_array select 1) select 5);};
	};
	_array
};

btc_ropes_deployed = false;
btc_lift_min_h  = 7;
btc_lift_max_h  = 12;
btc_lift_radius = 3;
btc_lift_HUD_x  = 0.825;// * safezoneW + safezoneX;
btc_lift_HUD_y  = 0.825;// * safezoneH + safezoneY;

//Mil
btc_player_side           = west;
btc_respawn_marker        = "respawn_west";
switch (true) do {
	case (_p_en == 0) :	{
		btc_hq                    = btc_hq_red;
		btc_enemy_side            = east;
		btc_type_units            = ["O_G_Soldier_F","O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_LAT_F"];
		btc_type_divers            = ["O_diver_F","O_diver_exp_F","O_diver_TL_F"];
		btc_type_crewmen          = "O_G_Soldier_F";
		btc_type_vehicles         = ["I_G_Offroad_01_F","I_G_Offroad_01_armed_F"];
		btc_type_boats			= ["I_Boat_Armed_01_minigun_F","I_Boat_Transport_01_F","I_SDV_01_F","I_G_Boat_Transport_01_F"];
		btc_type_motorized        = ["I_G_Offroad_01_F","I_G_Offroad_01_armed_F","I_Truck_02_transport_F","I_G_Offroad_01_armed_F","I_Truck_02_covered_F"];
		btc_type_mg = ["O_HMG_01_F","O_HMG_01_high_F"];
		btc_type_gl = ["O_GMG_01_F","O_GMG_01_high_F"];
	};
	case (_p_en == 1 && isClass(configFile >> "cfgVehicles" >> "CAF_AG_ME_T_AK47")) : {
		btc_hq                    = btc_hq_red;
		btc_enemy_side            = east;
		btc_type_units            = ["CAF_AG_ME_AK47","CAF_AG_ME_T_AK74","CAF_AG_ME_T_PKM","CAF_AG_ME_T_RPK74","CAF_AG_ME_T_RPG","CAF_AG_ME_T_GL"];
		btc_type_divers            = ["O_diver_F","O_diver_exp_F","O_diver_TL_F"];
		btc_type_crewmen          = "CAF_AG_ME_T_AK47";
		btc_type_vehicles         = ["CAF_AG_ME_T_Offroad_armed_01"];
		btc_type_boats			= ["I_Boat_Armed_01_minigun_F","I_Boat_Transport_01_F","I_SDV_01_F","I_G_Boat_Transport_01_F"];
		btc_type_motorized        = ["CAF_AG_ME_T_Offroad","I_Truck_02_transport_F","CAF_AG_ME_T_Offroad_armed_01","CAF_AG_ME_T_van_01"];
		btc_type_mg = ["O_HMG_01_F","O_HMG_01_high_F"];
		btc_type_gl = ["O_GMG_01_F","O_GMG_01_high_F"];
		btc_civ_type_units  = ["CAF_AG_ME_CIV","CAF_AG_ME_CIV_02","CAF_AG_ME_CIV_03","CAF_AG_ME_CIV_04"];
	};
	case (_p_en == 2 ) :
	{
		btc_hq                    = btc_hq_green;
		btc_enemy_side 			  = resistance;
		btc_type_units            = ["I_Soldier_F","I_Soldier_TL_F","I_Soldier_AR_F","I_engineer_F","I_Soldier_exp_F","I_Soldier_GL_F","I_Soldier_LAT_F","I_Soldier_AT_F","I_Soldier_AA_F","I_Spotter_F","I_Sniper_F"];
		btc_type_divers            = ["I_diver_F","I_diver_exp_F","I_diver_TL_F"];
		btc_type_crewmen          = "I_Soldier_F";
		btc_type_vehicles         = ["I_G_Offroad_01_F","I_G_Offroad_01_armed_F","I_MRAP_03_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"];
		btc_type_boats			= ["I_Boat_Armed_01_minigun_F","I_Boat_Transport_01_F","I_SDV_01_F","I_G_Boat_Transport_01_F"];
		btc_type_motorized        = ["I_G_Offroad_01_F","I_G_Offroad_01_armed_F","I_Truck_02_transport_F","I_G_Offroad_01_armed_F","I_Truck_02_covered_F","I_MRAP_03_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_Heli_light_03_F","I_APC_tracked_03_cannon_F"];
		btc_type_mg = ["I_HMG_01_F","I_HMG_01_high_F"];
		btc_type_gl = ["I_GMG_01_F","I_GMG_01_high_F"];
	};
	case (_p_en == 3 && isClass(configFile >> "cfgVehicles" >> "rhs_g_Soldier_F")) : {
		btc_hq                    = btc_hq_green;
		btc_enemy_side 			  = resistance;
		btc_type_units            = ["rhs_g_Soldier_F","rhs_g_medic_F","rhs_g_engineer_F","rhs_g_Soldier_exp_F","rhs_g_Soldier_GL_F","rhs_g_Soldier_AAT_F","rhs_g_Soldier_AR_F","rhs_g_Soldier_AAR_F","rhs_g_Soldier_M_F","rhs_g_uniform5_base","rhs_g_uniform1_base","rhs_g_uniform2_base","rhs_g_uniform3_base","rhs_g_uniform4_base","rhs_g_Soldier_F2","rhs_g_Soldier_F","rhs_g_Soldier_LAT_F","rhs_g_Soldier_lite_F","rhs_g_Soldier_AT_F","rhs_g_Soldier_TL_F","rhs_g_Soldier_SL_F"];
		btc_type_divers            = ["I_diver_F","I_diver_exp_F","I_diver_TL_F"];
		btc_type_crewmen          = "rhs_g_Crew_F";
		btc_type_vehicles         = ["RHS_UAZ_chdkz","rhs_uaz_open_chdkz","rhs_btr60_chdkz","rhs_btr70_chdkz","rhs_bmd1_chdkz","rhs_bmd2_chdkz","rhs_ural_chdkz","rhs_ural_open_chdkz","rhs_ural_work_open_chdkz","rhs_ural_work_chdkz"];
		btc_type_boats			= ["I_Boat_Armed_01_minigun_F","I_Boat_Transport_01_F","I_SDV_01_F","I_G_Boat_Transport_01_F"];
		btc_type_motorized        = ["RHS_UAZ_chdkz","rhs_uaz_open_chdkz","rhs_btr60_chdkz","rhs_btr70_chdkz","rhs_bmd1_chdkz","rhs_bmd2_chdkz","rhs_ural_chdkz","rhs_ural_open_chdkz","rhs_ural_work_open_chdkz","rhs_ural_work_chdkz"];
		btc_type_mg = ["I_HMG_01_F","I_HMG_01_high_F"];
		btc_type_gl = ["I_GMG_01_F","I_GMG_01_high_F"];
	};
	default	{
		btc_hq                    = btc_hq_red;
		btc_enemy_side            = east;
		btc_type_units            = ["O_G_Soldier_F","O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_LAT_F"];
		btc_type_divers            = ["O_diver_F","O_diver_exp_F","O_diver_TL_F"];
		btc_type_crewmen          = "O_G_Soldier_F";
		btc_type_vehicles         = ["I_G_Offroad_01_F","I_G_Offroad_01_armed_F"];
		btc_type_boats			= ["I_Boat_Armed_01_minigun_F","I_Boat_Transport_01_F","I_SDV_01_F","I_G_Boat_Transport_01_F"];
		btc_type_motorized        = ["I_G_Offroad_01_F","I_G_Offroad_01_armed_F","I_Truck_02_transport_F","I_G_Offroad_01_armed_F","I_Truck_02_covered_F"];
		btc_type_mg = ["O_HMG_01_F","O_HMG_01_high_F"];
		btc_type_gl = ["O_GMG_01_F","O_GMG_01_high_F"];
	}
};

//Rep
btc_rep_bonus_cache = 100;
btc_rep_bonus_civ_hh = 10;
btc_rep_bonus_disarm = 25;
btc_rep_bonus_hideout = 200;
btc_rep_bonus_mil_killed = 0.25;

btc_rep_malus_civ_hd = - 10;
btc_rep_malus_civ_killed = - 10;
btc_rep_malus_player_respawn = - 10;
btc_rep_malus_veh_killed = 25;

//Side
if (isNil "btc_side_assigned") then {btc_side_assigned = false;};

//Skill
btc_AI_skill = _p_skill;
