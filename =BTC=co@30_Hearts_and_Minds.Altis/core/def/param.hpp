class Params {
	class btc_p_time_title {
		title = "<< Time options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_time {
		title = "			Set the start time:";
		values[]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24};
		texts[]={"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"};
		default = 12;
	};
	class btc_p_acctime {
		title = "			Acceleration time multiplier:";
		values[]={1,2,3,4,5,6,7,8,9,10,11,12};
		texts[]={"1","2","3","4","5","6","7","8","9","10","11","12"};
		default = 5;
	};
	class btc_p_load {
		title = "			Load the savegame (if available)";
		values[]={0,1};
		texts[]={"Off","On"};
		default = 1;
	};
	class btc_p_auto_db {
		title = "			Auto savegame (can break player immersion)";
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,24,48,72};
		texts[]={"Off","1h","2h","3h","4h","5h","6h","7h","8h","9h","10h","11h","12h","24h","48h","72h"};
		default = 0;
	};
	class btc_p_type_title {
		title = "<< Faction options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_en {
		title = "			Enemy type:";
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178};
		texts[]={" Bohemia Interactive: NATO (Side: WEST)"," Bohemia Interactive: FIA (Side: WEST)"," Aplion: Bundeswehr (Side: WEST)"," jarrad96: Central African Militia (Side: EAST)"," Bohemia Interactive: AAF (Side: GUER)"," Bohemia Interactive: FIA (Side: GUER)"," Bohemia Interactive: CSAT (Side: EAST)"," Bohemia Interactive: FIA (Side: EAST)"," EricJ: Taliban (Side: EAST)"," Bohemia Interactive:  (Side: WEST)","AFR BIS/IceBreakr: Afrenian Army (Side: WEST)","ARA Bohemia Interactive: Abramian Rebel Alliance (Side: WEST)","ARL BIS/IceBreakr: ARL Lingor Rebels (Side: EAST)","btc_militia_mod Giallustio: Afghan Militia (Side: EAST)","CAF CAF MOD TEAM: Africa - Pirates (Side: EAST)","CAF CAF MOD TEAM: East Europe - Rebels (Side: EAST)","CAF CAF MOD TEAM: Middle East - Tribal (Side: EAST)","CEC HcPookie: Cecanian Army (Side: EAST)","CUP Community Upgrade Project: Army of the Czech Republic (Side: WEST)","CUP Bohemia Interactive: Bundeswehr (Side: WEST)","CUP Bohemia Interactive: United States Army (Side: WEST)","CUP Bohemia Interactive: National Party of Chernarus (Side: GUER)","CUP Bohemia Interactive: ION PMC (Side: GUER)","CUP Bohemia Interactive: Royal Army Corps of Sahrani (Side: GUER)","CUP Bohemia Interactive: Sahrani Liberation Army (Side: EAST)","CUP Bohemia Interactive: Takistani Army (Side: EAST)","CUP_Units Community Upgrade Project: British Armed Forces (Side: WEST)","CUP_Units Bohemia Interactive: Takistani Locals (Side: GUER)","CUP_Units Community Upgrade Project: United Nations (Side: GUER)","CUP_Units Community Upgrade Project: Chernarussian Movement of the Red Star (Side: EAST)","CUP_Units Bohemia Interactive: Takistani Militia (Side: EAST)","CUP_Vehicles Community Upgrade Project: Chenarus Defense Forces (Side: WEST)","CUP_Vehicles Community Upgrade Project: Royal New Zealand Navy (Side: WEST)","CUP_Vehicles Community Upgrade Project: United States Marine Corps (Side: WEST)","CUP_Vehicles Community Upgrade Project: Armed Forces of the Russian Federation (Side: EAST)","Expansion Bohemia Interactive: CTRG (Side: WEST)","Expansion Bohemia Interactive: Gendarmerie (Side: WEST)","Expansion Bohemia Interactive: NATO (Pacific) (Side: WEST)","Expansion Bohemia Interactive: Syndikat (Side: GUER)","Expansion Bohemia Interactive: CSAT (Pacific) (Side: EAST)","Expansion Burgess: OPCAN (Colonial Police) (Side: WEST)","Expansion Burgess: OPCAN (Colonial Sheriff) (Side: WEST)","FOW Bohemia Interactive: Imperial Japanese Army (Side: WEST)","FOW Bohemia Interactive: UK (Side: GUER)","FOW Bohemia Interactive: US Army (Side: GUER)","FOW Bohemia Interactive: US Marines Corps (Side: GUER)","FOW Bohemia Interactive: Wehrmacht (Side: WEST)","GAL HcPookie: GAL (Government Army of Lingor) (Side: WEST)","GANGBLUE BIS/IceBreakr: Blue Gang (Side: WEST)","GANGRED BIS/IceBreakr: Red Gang (Side: EAST)","IBR Bohemia Interactive: Alienz (Side: GUER)","ISC Bohemia Interactive: [ISC] Iraqi Police (Side: WEST)","ISC Bohemia Interactive: [ISC] YPG (Side: WEST)","LIB AWAR: ACI (Side: GUER)","LIB AWAR & Lennard: ARR (Side: WEST)","LIB Lennard: Deutsches Afrikakorps (Side: WEST)","LIB AWAR & Joarius: FFI (Side: GUER)","LIB AWAR: Home Army (Polish) (Side: GUER)","LIB AWAR: Luftwaffe (Side: WEST)","LIB AWAR & Lennard: [Winter] Luftwaffe (Side: WEST)","LIB AWAR & Lennard: MKHL (Side: WEST)","LIB Lennard: US North African Corps (Side: GUER)","LIB Lennard: NKVD (Side: EAST)","LIB AWAR: Panzerwaffe (Side: WEST)","LIB AWAR & Lennard: [Winter] Panzerwaffe (Side: WEST)","LIB AWAR: RAAF (Side: GUER)","LIB AWAR: RAF (Side: GUER)","LIB AWAR & Lennard: RBAF (Side: WEST)","LIB AWAR: Red Army (Side: EAST)","LIB AWAR & Lennard: [Winter] Red Army (Side: EAST)","LIB LODU: US Army Air Forces (Side: GUER)","LIB AWAR: [Winter] US Airforce (Side: GUER)","LIB AWAR: US Army (Side: GUER)","LIB LODU: [Winter] US Army (Side: GUER)","LIB Lennard: US 2nd Ranger Battalion (Side: GUER)","LIB I44: US Tank Troops (Side: GUER)","LIB AWAR & Lennard: [Winter] US Tank Troops (Side: GUER)","LIB AWAR: USSR Airforce (Side: EAST)","LIB AWAR & Lennard: [Winter] USSR Airforce (Side: EAST)","LIB AWAR: Tank troops of USSR (Side: EAST)","LIB AWAR & Lennard: [Winter] Tank troops of USSR (Side: EAST)","LIB AWAR: Wehrmacht (Side: WEST)","LIB AWAR & Lennard: [Winter] Wehrmacht (Side: WEST)","LM Burgess: UNSCMC (Urban) (Side: WEST)","LM Burgess: UNSCMC (Desert) (Side: WEST)","LM Burgess: ONI Security (Side: WEST)","LM Burgess: UNSCMC (Snow) (Side: WEST)","LM Burgess: UNSCMC (Wood) (Side: WEST)","LM Burgess: OPCANTest (Side: WEST)","LOP Project OPFOR: Boko Haram (Side: EAST)","LOP Project OPFOR: Irish Republican Army (Side: EAST)","LOP Project OPFOR: Ulster Volunteer Force (Side: GUER)","LOP_LeightsOPFOR Project OPFOR: Afghan National Army and Police (Side: WEST)","LOP_LeightsOPFOR Project OPFOR: African Militia (Side: GUER)","LOP_LeightsOPFOR Project OPFOR: African Militia (Side: EAST)","LOP_LeightsOPFOR Project OPFOR: Middle Eastern Militia (Side: GUER)","LOP_LeightsOPFOR Project OPFOR: Middle Eastern Militia (Side: EAST)","LOP_LeightsOPFOR Project OPFOR: Chernarussian Defence Forces (Side: WEST)","LOP_LeightsOPFOR Project OPFOR: ChDKZ (Side: EAST)","LOP_LeightsOPFOR Project OPFOR: Iraqi Armed Forces (Side: WEST)","LOP_LeightsOPFOR Project OPFOR: Iranian Armed Forces (Side: GUER)","LOP_LeightsOPFOR Project OPFOR: Islamic State (Side: GUER)","LOP_LeightsOPFOR Project OPFOR: Islamic State (Side: EAST)","LOP_LeightsOPFOR Project OPFOR: Chernarussian National Insurgents (Side: GUER)","LOP_LeightsOPFOR Project OPFOR: Kurdish Peshmerga Forces (Side: WEST)","LOP_LeightsOPFOR Project OPFOR: Kurdish Peshmerga Forces (Side: GUER)","LOP_LeightsOPFOR Project OPFOR: Private Military Company (Side: GUER)","LOP_LeightsOPFOR Project OPFOR: Royal Army Corps of Sahrani (Side: GUER)","LOP_LeightsOPFOR Project OPFOR: Sahrani Liberation Army (Side: EAST)","LOP_LeightsOPFOR Project OPFOR: Takistani Armed Forces (Side: EAST)","LOP_LeightsOPFOR Project OPFOR: Ultranationalists (Side: GUER)","LOP_LeightsOPFOR Project OPFOR: Ukraine's Armed Forces (Side: WEST)","LOP_LeightsOPFOR Project OPFOR: United Nations (Side: GUER)","LOP_LeightsOPFOR Project OPFOR: United Armed Forces of Novorossiya (Side: EAST)","MOL HcPookie: Molatian Army (Side: EAST)","OPTRE Article 2 Studios: Insurrectionists (Side: EAST)","OPTRE Burgess: OPCAN (Side: WEST)","OPTRE Burgess: OPCAN (UEG Colonial Guard) (Side: WEST)","OPTRE Burgess: Colonial Militia (OPCAN) (Side: GUER)","OPTRE Burgess: OPCAN (PMC) (Side: GUER)","OPTRE Burgess: Halo Wars Rebels (OPCAN) (Side: EAST)","OPTRE Burgess: Common Criminals (OPCAN) (Side: EAST)","OPTRE Burgess: OPCAN (UNSC Army) (Side: WEST)","OPTRE Burgess: United Rebel Air Force(OPCAN) (Side: EAST)","OPTRE Burgess: United Rebel Army Desert(OPCAN) (Side: EAST)","OPTRE Burgess: United Rebel Army BattleJumpers (OPCAN) (Side: EAST)","OPTRE Burgess: United Rebel Army Tropic(OPCAN) (Side: EAST)","OPTRE Bohemia Interactive: United Rebel Army Ground Vehicles (OPCAN) (Side: EAST)","OPTRE Burgess: United Rebel Army Wood(OPCAN) (Side: EAST)","OPTRE Burgess: OPCAN (WARZONE BLUE) (Side: WEST)","OPTRE Burgess: OPCAN (WARZONE RED) (Side: EAST)","OPTRE Article 2 Studios: UNSCDF (Side: WEST)","RHS_AFRF Bohemia Interactive: [ISC] al-Nusra Front (Side: GUER)","RHS_AFRF Bohemia Interactive: [ISC] Iraqi Army (Side: WEST)","RHS_AFRF Bohemia Interactive: [ISC] Islamic State (Side: GUER)","RHS_AFRF Bohemia Interactive: [ISC] Islamic State (Side: EAST)","RHS_AFRF Bohemia Interactive: [ISC] Peshmerga (Side: WEST)","RHS_AFRF Bohemia Interactive: [ISC] Syrian Arab Army (Side: EAST)","RHS_AFRF Red Hammer Studios: Eastern Militia (Side: GUER)","RHS_AFRF Red Hammer Studios: Russia (MSV) (Side: EAST)","RHS_AFRF Red Hammer Studios: Russia (RVA) (Side: EAST)","RHS_AFRF Red Hammer Studios: Russia (TV) (Side: EAST)","RHS_AFRF Red Hammer Studios: Russia (VDV) (Side: EAST)","RHS_AFRF Red Hammer Studios: Russia (VMF) (Side: EAST)","RHS_AFRF RHS: Russia (VPVO) (Side: EAST)","RHS_AFRF Red Hammer Studios: Russia (VV) (Side: EAST)","RHS_AFRF Bohemia Interactive: Russia (VVS - Grey) (Side: EAST)","RHS_AFRF Red Hammer Studios: Russia (VVS - Camo) (Side: EAST)","RHS_GREF Red Hammer Studios: Chernarus (Air Force) (Side: GUER)","RHS_GREF Red Hammer Studios: Chernarus (Air Force) (Side: WEST)","RHS_GREF RHS (A2 port): Chernarus (Ground Forces) (Side: GUER)","RHS_GREF Red Hammer Studios: Chernarus (Ground Forces) (Side: WEST)","RHS_GREF Red Hammer Studios: Chernarus (National Guard) (Side: GUER)","RHS_GREF Red Hammer Studios: Chernarus (National Guard) (Side: WEST)","RHS_GREF Red Hammer Studios: ChDKZ Insurgents (Side: EAST)","RHS_GREF Red Hammer Studios: ChDKZ Insurgents (Side: GUER)","RHS_GREF Red Hammer Studios: Chernarus (U.N. Peacekeepers) (Side: GUER)","RHS_SAF Red Hammer Studios: SAF (RVIPVO) (Side: GUER)","RHS_SAF Red Hammer Studios: SAF (KOV) (Side: GUER)","RHS_SAF Red Hammer Studios: SAF (UN Peacekeepers) (Side: GUER)","RHS_USAF Red Hammer Studios: USA (SOCOM) (Side: WEST)","RHS_USAF Red Hammer Studios: USA (USAF) (Side: WEST)","RHS_USAF Red Hammer Studios: USA (Army - D) (Side: WEST)","RHS_USAF Red Hammer Studios: USA (Army - W) (Side: WEST)","RHS_USAF Red Hammer Studios: USA (USMC - D) (Side: WEST)","RHS_USAF Red Hammer Studios: USA (USMC - W) (Side: WEST)","RHS_USAF Red Hammer Studios: USA (Navy) (Side: WEST)","RHSGREF Red Hammer Studios: Nationalist Troops (Side: GUER)","SG Stagler: Sturmtroopers (Side: WEST)","SG Stagler: [Winter] Sturmtroopers (Side: WEST)","SG Stagler: Tank Sturmtroopers (Side: WEST)","UNSC Morthon: UNSCMC (Side: WEST)","UNSUNG Bohemia Interactive: Australia (UNSUNG) (Side: GUER)","UNSUNG Razorback: N.V.A. (UNSUNG) (Side: EAST)","UNSUNG Bohemia Interactive: V.C. (UNSUNG) (Side: EAST)","UNSUNG Bohemia Interactive: A.R.V.N. (UNSUNG) (Side: GUER)","UNSUNG Bohemia Interactive: New Zealand (UNSUNG) (Side: GUER)","UNSUNG Bohemia Interactive: U.S. (UNSUNG) (Side: WEST)","USML segen: Armed Islamic Front (Side: GUER)"};
		default = 5;
	};
	class btc_p_AA {
		title = "			Enemy uses Anti-Air:";
		values[]={0,1};
		texts[]={"Off","On"};
		default = 0;
	};
	class btc_p_tank {
		title = "			Enemy uses Tank:";
		values[]={0,1};
		texts[]={"Off","On"};
		default = 0;
	};
	class btc_p_civ {
		title = "			Civil type:";
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
		texts[]={" EricJ: Afghan Civilians (Side: CIV)"," Bohemia Interactive: Civilians (Side: CIV)","btc_militia_mod Giallustio: Afghan Civilians (Side: CIV)","CAF CAF MOD TEAM: African (Side: CIV)","CAF CAF MOD TEAM: Middle Eastern (Side: CIV)","CUP_Units Community Upgrade Project: Civilians (Russian) (Side: CIV)","CUP_Vehicles Bohemia Interactive: Civilians (Chenarus) (Side: CIV)","CUP_Vehicles Bohemia Interactive: Civilians (Sahrani) (Side: CIV)","CUP_Vehicles Community Upgrade Project: Civilians (Takistan) (Side: CIV)","LIB Reyhard & Joarius: 40s Civilians (Side: CIV)","LOP_LeightsOPFOR Project OPFOR: African Civilians (Side: CIV)","LOP_LeightsOPFOR Project OPFOR: Eastern European Civilians (Side: CIV)","LOP_LeightsOPFOR Project OPFOR: Middle Eastern Civilians (Side: CIV)","OPTRE Bohemia Interactive: Civilians (UEG) (Side: CIV)","RDS_CIV_PACK reyhard: Russians (Side: CIV)","UNSUNG Bohemia Interactive: Vietnamese (UNSUNG) (Side: CIV)"};
		default = 1;
	};
	class btc_p_civ_veh {
		title = "			Civil vehicle type:";
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
		texts[]={" EricJ: Afghan Civilians (Side: CIV)"," Bohemia Interactive: Civilians (Side: CIV)","btc_militia_mod Giallustio: Afghan Civilians (Side: CIV)","CAF CAF MOD TEAM: African (Side: CIV)","CAF CAF MOD TEAM: Middle Eastern (Side: CIV)","CUP_Units Community Upgrade Project: Civilians (Russian) (Side: CIV)","CUP_Vehicles Bohemia Interactive: Civilians (Chenarus) (Side: CIV)","CUP_Vehicles Bohemia Interactive: Civilians (Sahrani) (Side: CIV)","CUP_Vehicles Community Upgrade Project: Civilians (Takistan) (Side: CIV)","LIB Reyhard & Joarius: 40s Civilians (Side: CIV)","LOP_LeightsOPFOR Project OPFOR: African Civilians (Side: CIV)","LOP_LeightsOPFOR Project OPFOR: Eastern European Civilians (Side: CIV)","LOP_LeightsOPFOR Project OPFOR: Middle Eastern Civilians (Side: CIV)","OPTRE Bohemia Interactive: Civilians (UEG) (Side: CIV)","RDS_CIV_PACK reyhard: Russians (Side: CIV)","UNSUNG Bohemia Interactive: Vietnamese (UNSUNG) (Side: CIV)"};
		default = 1;
	};
	class btc_p_IED_title {
		title = "<< IED options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_ied {
		title = "			IEDs ratio:";
		values[]={0, 1, 2, 3};
		texts[]={"Off","Low","Normal","High"};
		default = 2;
	};
	class btc_p_engineer {
		title = "			Everybody can disarm IED:";
		values[]={0,1};
		texts[]={"Off","On"};
		default = 0;
	};
	class btc_p_hideout_cache_title {
		title = "<< Hideout/Cache options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_hideout_n {
		title = "			Hideout numbers:";
		values[]={99,1,2,3,4,5};
		texts[]={"Random","1","2","3","4","5"};
		default = 5;
	};
	class btc_p_cache_info_def {
		title = "			Info cache distance:";
		values[]={500,1000,1500,2000,2500,3000,3500,4000,5000};
		texts[]={"500 m","1000 m","1500 m","2000 m","2500 m","3000 m","3500 m","4000 m","5000 m"};
		default = 1000;
	};
	class btc_p_cache_info_ratio {
		title = "			Cache info ratio:";
		values[]={50,100};
		texts[]={"50 m","100 m"};
		default = 100;
	};
	class btc_p_info_chance {
		title = "			Intel from dead bodies chance:";
		values[]={0,10,20,30,40,50,60,70,80,90,100};
		texts[]={"100 %","90 %","80 %","70 %","60 %","50 %","40 %","30 %","20 %","10 %","0 %"};
		default = 70;
	};
	class btc_p_medical_title {
		title = "<< Medical options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_redeploy {
		title = "			Allow re-deploy?";
		values[]={0,1};
		texts[]={"Off","On"};
		default = 1;
	};
	class btc_p_med_level {
	   title = "			Medical Level";
	   values[] = {1,2};
	   texts[] = {"Basic","Advanced"};
	   default = 1;
	};
	class btc_p_adv_wounds {
	   title = "			Advanced Wounds";
	   values[] = {0,1};
	   texts[] = {"Off","On"};
	   default = 1;
	};
	class btc_p_rev {
		title = "			Revive time:";
		values[]={0,60,120,180,240,300,600,900,1200,999999};
		texts[]={"Off","60","120","180","240","300","600","900","1200","999999"};
		default = 600;
	};
	class btc_p_skill_title {
		title = "<< A3 Skill options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_set_skill {
		title = "			Set skill?";
		values[]={0,1};
		texts[]={"Off","On"};
		default = 1;
	};
	class btc_p_set_skill_general {
		title = "			Set skill, general";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 0;
	};
	class btc_p_set_skill_aimingAccuracy {
		title = "			Set skill, aimingAccuracy";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 1;
	};
	class btc_p_set_skill_aimingShake {
		title = "			Set skill, aimingShake";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 7;
	};
	class btc_p_set_skill_aimingSpeed {
		title = "			Set skill, aimingSpeed";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 2;
	};
	class btc_p_set_skill_endurance {
		title = "			Set skill, endurance";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 7;
	};
	class btc_p_set_skill_spotDistance {
		title = "			Set skill, spotDistance";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 100;
	};
	class btc_p_set_skill_spotTime {
		title = "			Set skill, spotTime";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 100;
	};
	class btc_p_set_skill_courage {
		title = "			Set skill, courage";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 1;
	};
	class btc_p_set_skill_reloadSpeed {
		title = "			Set skill, reloadSpeed";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 20;
	};
	class btc_p_set_skill_commanding {
		title = "			Set skill, commanding";
		values[]={0,1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1","2","3","4","5","6","7","8","9","10"};
		default = 80;
	};
	class btc_p_gameplay_title {
		title = "<< Gameplay options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_sea {
		title = "			Extend battlefield to sea:";
		values[] = {0,1};
		texts[] = {"Off","On"};
		default = 1;
	};
	class btc_p_veh_armed_ho {
		title = "			Add armed vehicles in Hideout:";
		values[] = {0,1};
		texts[] = {"Off","On"};
		default = 0;
	};
	class btc_p_veh_armed_spawn_more {
		title = "			Add armed vehicles in Side mission/Cache:";
		values[] = {0,1};
		texts[] = {"Off","On"};
		default = 0;
	};
	class btc_p_side_mission_cycle {
		title = "			Side mission cycle:";
		values[] = {0,1};
		texts[] = {"Off","On"};
		default = 0;
	};
	class btc_p_main_title {
		title = "<< Other options >>";
		values[]={0};
		texts[]={""};
		default = 0;
	};
	class btc_p_rep {
		title = "			Reputation at start:";
		values[]={0, 200, 500, 750};
		texts[]={"Very Low","Low","Normal","High"};
		default = 200;
	};
	class btc_p_rearm {
		title = "			Rearm Level:";
		values[]={0,1,2};
		texts[]={"Entire vehicle","Entire magazine","Amount based on caliber"};
		default = 1;
	};
	class btc_p_garage {
		title = "			Activate garage for admin:";
		values[]={0,1};
		texts[]={"Off","On"};
		default = 0;
	};
	class btc_p_city_radius {
		title = "			Spawn city radius offset:";
		values[]={0,1,2,3,4,5,6,7,8};
		texts[]={"0 m","100 m","200 m","300 m (Default: Altis, Tanoa)","400 m","500 m (Takistan)","600 m","700 m","800 m"};
		default = 3;
	};
	class btc_p_trigger {
		title = "			Disable city activation when a plane or helicopter (>190Km/h) is flying above:";
		values[]={0,1};
		texts[]={"Off","On"};
		default = 0;
	};
	class btc_p_debug {
		title = "			Debug:";
		values[]={0,1,2};
		texts[]={"Off","On", "Log only"};
		default = 0;
	};
};