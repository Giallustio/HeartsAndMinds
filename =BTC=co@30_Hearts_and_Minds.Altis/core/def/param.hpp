class Params {
	class btc_p_time_title {
	//paramsArray[0]
		title = "<< Time options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_time {
	//paramsArray[1]
		title = "			Set the start time:";
		values[]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24};
		texts[]={"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"};
		default = 12;
	};
	class btc_p_acctime {
	//paramsArray[2]
		title = "			Acceleration time multiplier:";
		values[]={1,2,3,4,5,6,7,8,9,10,11,12};
		texts[]={"1","2","3","4","5","6","7","8","9","10","11","12"};
		default = 5;
	};
	class btc_p_load {
	//paramsArray[3]
		title = "			Load the savegame (if available)";
		values[]={0,1};
		texts[]={"No","Yes"};
		default = 1;
	};
	class btc_p_auto_db {
	//paramsArray[4]
		title = "			Auto savegame (can break player immersion)";
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,24,48,72};
		texts[]={"No","1h","2h","3h","4h","5h","6h","7h","8h","9h","10h","11h","12h","24h","48h","72h"};
		default = 0;
	};
	class btc_p_type_title {
	//paramsArray[5]
		title = "<< Faction options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_en {
	//paramsArray[6]
		title = "			Enemy type:";
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128};
		texts[]={"A3: CTRG (Side: WEST)","A3: OTAN (Side: WEST)","A3: FIA (Side: WEST)","A3: Gendarmerie (Side: WEST)","A3: OTAN (Pacifique) (Side: WEST)","A3: Central African Militia (Side: EAST)","A3: United Kingdom (Side: WEST)","A3: United States of America (Side: WEST)","A3: United Nations (Side: GUER)","A3: Syndikat (Side: GUER)","A3: AAF (Side: GUER)","A3: FIA (Side: GUER)","A3: CSAT (Side: EAST)","A3: FIA (Side: EAST)","A3: CSAT (Pacifique) (Side: EAST)","A3: Viper (Side: EAST)","AIF_ALL: Armed Islamic Front (Side: GUER)","BTC: Afghan Militia (Side: EAST)","CAF: Africa - Pirates (Side: EAST)","CAF: East Europe - Rebels (Side: EAST)","CAF: Middle East - Tribal (Side: EAST)","CUP: Chenarus Defense Force (CDF) (Side: WEST)","CUP: Czech Republic (Side: WEST)","CUP: Germany (Side: WEST)","CUP: Royal New Zealand Navy (Side: WEST)","CUP: United States Army (Side: WEST)","CUP: United States Marine Corps (Side: WEST)","CUP: NAPA (Chenarus) (Side: GUER)","CUP: ION PMC (Side: GUER)","CUP: Royal Army Corp of Sahrani (Side: GUER)","CUP: Takistani Locals (Side: GUER)","CUP: ChDKZ (Chenarus) (Side: EAST)","CUP: Russian Federation (Side: EAST)","CUP: Sahrani Liberation Army (Side: EAST)","CUP: Takistani Army (Side: EAST)","CUP: Takistani Militia (Side: EAST)","FOW: Imperial Japanese Army (Side: WEST)","FOW: UK (Side: GUER)","FOW: US Army (Side: GUER)","FOW: US Marines Corps (Side: GUER)","FOW: Wehrmacht (Side: WEST)","LIB: ARR (Side: WEST)","LIB: 40s Civilians (Side: GUER)","LIB: FFI (Side: GUER)","LIB: MKHL (Side: WEST)","LIB: RBAF (Side: WEST)","PO_MAIN: Afghan National Army and Police (Side: WEST)","PO_MAIN: African Militia (Side: GUER)","PO_MAIN: African Militia (Side: EAST)","PO_MAIN: Middle Eastern Militia (Side: GUER)","PO_MAIN: Middle Eastern Militia (Side: EAST)","PO_MAIN: Boko Haram (Side: GUER)","PO_MAIN: Chernarussian Defence Forces (Side: WEST)","PO_MAIN: ChDKZ (Side: EAST)","PO_MAIN: Iraqi Armed Forces (Side: WEST)","PO_MAIN: Irish Republican Army (Side: GUER)","PO_MAIN: Islamic State (Side: GUER)","PO_MAIN: Islamic State (Side: EAST)","PO_MAIN: Chernarussian National Insurgents (Side: GUER)","PO_MAIN: Kurdish Peshmerga Forces (Side: WEST)","PO_MAIN: Kurdish Peshmerga Forces (Side: GUER)","PO_MAIN: Private Military Company (Side: GUER)","PO_MAIN: Royal Army Corps of Sahrani (Side: GUER)","PO_MAIN: Sahrani Liberation Army (Side: EAST)","PO_MAIN: Takistani Armed Forces (Side: EAST)","PO_MAIN: Ultranationalists (Side: GUER)","PO_MAIN: Ukraine's Armed Forces (Side: GUER)","PO_MAIN: United Nations (Side: GUER)","PO_MAIN: United Armed Forces of Novorossiya (Side: EAST)","RHSAFRF: Eastern Militia (Side: GUER)","RHSAFRF: Russia (MSV) (Side: EAST)","RHSAFRF: Russia (RVA) (Side: EAST)","RHSAFRF: Russia (TV) (Side: EAST)","RHSAFRF: Russia (VDV) (Side: EAST)","RHSAFRF:  (Side: EAST)","RHSAFRF: Russia (VMF) (Side: EAST)","RHSAFRF: Russia (VPVO) (Side: EAST)","RHSAFRF: Russia (VV) (Side: EAST)","RHSAFRF: Russia (VVS - Grey) (Side: EAST)","RHSAFRF: Russia (VVS - Camo) (Side: EAST)","RHSGREF: Chernarus (Air Force) (Side: GUER)","RHSGREF: Chernarus (Air Force) (Side: WEST)","RHSGREF: Chernarus (Ground Forces) (Side: GUER)","RHSGREF: Chernarus (Ground Forces) (Side: WEST)","RHSGREF: Chernarus (National Guard) (Side: GUER)","RHSGREF: Chernarus (National Guard) (Side: WEST)","RHSGREF: ChDKZ Insurgents (Side: EAST)","RHSGREF: ChDKZ Insurgents (Side: GUER)","RHSGREF: Nationalist Troops (Side: GUER)","RHSGREF: Chernarus (U.N. Peacekeepers) (Side: GUER)","RHSSAF: SAF (RVIPVO) (Side: GUER)","RHSSAF: SAF (KOV) (Side: GUER)","RHSSAF: SAF (Casques Bleus) (Side: GUER)","RHSUSF: USA (SOCOM) (Side: WEST)","RHSUSF: USA (USAF) (Side: WEST)","RHSUSF: USA (Army) (Side: WEST)","RHSUSF: USA (Army - D) (Side: WEST)","RHSUSF: USA (Army - W) (Side: WEST)","RHSUSF: USA (USMC) (Side: WEST)","RHSUSF: USA (USMC - D) (Side: WEST)","RHSUSF: USA (USMC - W) (Side: WEST)","RHSUSF: USA (Navy) (Side: WEST)","TALIBAN_FIGHTERS: Taliban (Side: EAST)","WW2: Deutsches Afrikakorps (Side: GUER)","WW2: Armia Krajowa (Polonais) (Side: GUER)","WW2: Luftwaffe (Side: WEST)","WW2: [Winter] Luftwaffe (Side: WEST)","WW2: US North African Corps (Side: GUER)","WW2: NKVD (Side: EAST)","WW2: Panzerwaffe (Side: WEST)","WW2: [Winter] Panzerwaffe (Side: WEST)","WW2: Red Army (Side: EAST)","WW2: [Winter] Red Army (Side: EAST)","WW2: US Army Air Forces (Side: GUER)","WW2: [Winter] US Airforce (Side: GUER)","WW2: US Army (Side: GUER)","WW2: [Winter] US Army (Side: GUER)","WW2: US 2nd Ranger Battalion (Side: GUER)","WW2: US Tank Troops (Side: GUER)","WW2: [Winter] US Tank Troops (Side: GUER)","WW2: USSR Airforce (Side: EAST)","WW2: [Winter] USSR Airforce (Side: EAST)","WW2: Tank troops of USSR (Side: EAST)","WW2: [Winter] Tank troops of USSR (Side: EAST)","WW2: Wehrmacht (Side: WEST)","WW2: [Winter] Wehrmacht (Side: WEST)","WW2: Sturmtroopers (Side: WEST)","WW2: [Winter] Sturmtroopers (Side: WEST)","WW2: Tank Sturmtroopers (Side: WEST)"};
		default = 11;
	};
	class btc_p_civ {
	//paramsArray[7]
		title = "			Civil type:";
		values[]={0,1,2,3,4,5};
		texts[]={"Civilian (A3)","Afghan (@Ericj_Taliban)","Afghan (@=BTC= Militia)","Russian (@RDS A2 Civilian Pack)","A2 civils (@CUP Units)", "Eastern Europe civils (@Project Opfor)"};
		default = 0;
	};
	class btc_p_civ_veh {
	//paramsArray[8]
		title = "			Civil vehicle type:";
		values[]={0,1,2,3};
		texts[]={"Vanilla (A3)","A2 vehicles (@RDS A2 Civilian Pack)","A2 vehicles (@CUP Vehicles)", "Eastern Europe civils (@Project Opfor)"};
		default = 0;
	};
	class btc_p_IED_title {
	//paramsArray[9]
		title = "<< IED options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_ied {
	//paramsArray[10]
		title = "			IEDs ratio:";
		values[]={0, 1, 2, 3};
		texts[]={"Off","Low","Normal","High"};
		default = 2;
	};
	class btc_p_engineer {
	//paramsArray[11]
		title = "			Everybody can disarm IED:";
		values[]={0,1};
		texts[]={"No","Yes"};
		default = 0;
	};
	class btc_p_hideout_cache_title {
	//paramsArray[12]
		title = "<< Hideout/Cache options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_hideout_n {
	//paramsArray[13]
		title = "			Hideout numbers:";
		values[]={99,1,2,3,4,5};
		texts[]={"Random","1","2","3","4","5"};
		default = 5;
	};
	class btc_p_cache_info_def {
	//paramsArray[14]
		title = "			Info cache distance:";
		values[]={500,1000,1500,2000,2500,3000,3500,4000,5000};
		texts[]={"500 m","1000 m","1500 m","2000 m","2500 m","3000 m","3500 m","4000 m","5000 m"};
		default = 1000;
	};
	class btc_p_cache_info_ratio {
	//paramsArray[15]
		title = "			Cache info ratio:";
		values[]={50,100};
		texts[]={"50 m","100 m"};
		default = 100;
	};
	class btc_p_info_chance {
	//paramsArray[16]
		title = "			Intel from dead bodies chance:";
		values[]={0,10,20,30,40,50,60,70,80,90,100};
		texts[]={"100 %","90 %","80 %","70 %","60 %","50 %","40 %","30 %","20 %","10 %","0 %"};
		default = 70;
	};
	class btc_p_medical_title {
	//paramsArray[17]
		title = "<< Medical options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_redeploy {
	//paramsArray[18]
		title = "			Allow re-deploy?";
		values[]={0,1};
		texts[]={"No","Yes"};
		default = 1;
	};
	class btc_p_med_level {
		//paramsArray[19]
	   title = "			Medical Level";
	   values[] = {1,2};
	   texts[] = {"Basic","Advanced"};
	   default = 1;
	};
	class btc_p_adv_wounds {
		//paramsArray[20]
	   title = "			Advanced Wounds";
	   values[] = {0,1};
	   texts[] = {"Off","On"};
	   default = 1;
	};
	class btc_p_rev {
	//paramsArray[21]
		title = "			Revive time:";
		values[]={0,60,120,180,240,300,600,900,1200,999999};
		texts[]={"0","60","120","180","240","300","600","900","1200","999999"};
		default = 600;
	};
	class btc_p_skill_title {
	//paramsArray[22]
		title = "<< Skill options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_set_skill {
	//paramsArray[23]
		title = "			Set skill?";
		values[]={0,1};
		texts[]={"No","Yes"};
		default = 1;
	};
	class btc_p_set_skill_general {
	//paramsArray[24]
		title = "			Set skill, general";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 0;
	};
	class btc_p_set_skill_aimingAccuracy {
	//paramsArray[25]
		title = "			Set skill, aimingAccuracy";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 1;
	};
	class btc_p_set_skill_aimingShake {
	//paramsArray[26]
		title = "			Set skill, aimingShake";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 7;
	};
	class btc_p_set_skill_aimingSpeed {
	//paramsArray[27]
		title = "			Set skill, aimingSpeed";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 2;
	};
	class btc_p_set_skill_endurance {
	//paramsArray[28]
		title = "			Set skill, endurance";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 7;
	};
	class btc_p_set_skill_spotDistance {
	//paramsArray[29]
		title = "			Set skill, spotDistance";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 100;
	};
	class btc_p_set_skill_spotTime {
	//paramsArray[30]
		title = "			Set skill, spotTime";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 100;
	};
	class btc_p_set_skill_courage {
	//paramsArray[31]
		title = "			Set skill, courage";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 1;
	};
	class btc_p_set_skill_reloadSpeed {
	//paramsArray[32]
		title = "			Set skill, reloadSpeed";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 20;
	};
	class btc_p_set_skill_commanding {
	//paramsArray[33]
		title = "			Set skill, commanding";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 80;
	};
	class btc_p_main_title {
	//paramsArray[34]
		title = "<< Other options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_rep {
	//paramsArray[35]
		title = "			Reputation at start:";
		values[]={0, 200, 500, 750};
		texts[]={"Very Low","Low","Normal","High"};
		default = 200;
	};
	class btc_p_rearm {
	//paramsArray[36]
		title = "			Rearm Level:";
		values[]={0,1,2};
		texts[]={"Entire vehicle","Entire magazine","Amount based on caliber"};
		default = 1;
	};
	class btc_p_sea {
	//paramsArray[37]
		title = "			Extend battlefield to sea:";
		values[] = {0,1};
		texts[] = {"Off","On"};
		default = 1;
	};
	class btc_p_city_radius {
	//paramsArray[38]
		title = "			Spawn city radius offset:";
		values[]={0,1,2,3,4,5,6,7,8};
		texts[]={"0 m","100 m","200 m","300 m (Default: Altis, Tanoa)","400 m","500 m (Takistan)","600 m","700 m","800 m"};
		default = 3;
	};
	class btc_p_debug {
	//paramsArray[39]
		title = "			Debug:";
		values[]={0,1,2};
		texts[]={"No","Yes", "Log only"};
		default = 0;
	};
};