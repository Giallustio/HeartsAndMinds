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
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227};
		texts[]={"0 - Bohemia Interactive: OTAN (Side: WEST)","1 - Bohemia Interactive: FIA (Side: WEST)","2 - jarrad96: Central African Militia (Side: EAST)","3 - Scar and Jmax: Galactic Empire (Side: EAST)","4 - SWOP: Geonosians (Side: EAST)","5 - Bohemia Interactive: AAF (Side: GUER)","6 - Bohemia Interactive: FIA (Side: GUER)","7 - Bohemia Interactive: CSAT (Side: EAST)","8 - Bohemia Interactive: FIA (Side: EAST)","9 - Bohemia Interactive: Rebel Alliance (Side: WEST)","10 - EricJ: Taliban (Side: EAST)","11 - Bohemia Interactive:  (Side: WEST)","12 -AFR BIS/IceBreakr: Afrenian Army (Side: WEST)","13 -ARA Bohemia Interactive: Abramian Rebel Alliance (Side: WEST)","14 -ARL BIS/IceBreakr: ARL Lingor Rebels (Side: EAST)","15 -btc_militia_mod Giallustio: Afghan Militia (Side: EAST)","16 -C SWOP: Confederacy of Independent Systems (Side: EAST)","17 -CAF CAF MOD TEAM: Africa - Pirates (Side: EAST)","18 -CAF CAF MOD TEAM: East Europe - Rebels (Side: EAST)","19 -CAF CAF MOD TEAM: Middle East - Tribal (Side: EAST)","20 -CEC HcPookie: Cecanian Army (Side: EAST)","21 -COREVMod WarfareThai: African State Defense Force (Side: EAST)","22 -COREVMod WarfareThai: African State Defense Force INDEP (Side: GUER)","23 -COREVMod WarfareThai: Insurgents (Africans) (Side: EAST)","24 -COREVMod WarfareThai: Insurgents (Africans) INDEP (Side: GUER)","25 -COREVMod WarfareThai: Drug Cartel (Asians) (Side: EAST)","26 -COREVMod WarfareThai: Drug Cartel (Asians) INDEP (Side: GUER)","27 -COREVMod WarfareThai: Eastern European Armed Force (Side: EAST)","28 -COREVMod WarfareThai: Eastern European Armed Force INDEP (Side: GUER)","29 -COREVMod WarfareThai: Insurgents (Eastern Europeons) (Side: EAST)","30 -COREVMod WarfareThai: Insurgents (Eastern Europeons) INDEP (Side: GUER)","31 -COREVMod WarfareThai: Pirates (Africans) (Side: EAST)","32 -COREVMod WarfareThai: Pirates (Africans) INDEP (Side: GUER)","33 -COREVMod WarfareThai: Cops (Side: WEST)","34 -COREVMod WarfareThai: Cops INDEP (Side: GUER)","35 -COREVMod WarfareThai: Terrorists (Africans) (Side: EAST)","36 -COREVMod WarfareThai: Terrorists (Africans) INDEP (Side: GUER)","37 -COREVMod WarfareThai: TAF (Modern) (Side: WEST)","38 -COREVMod WarfareThai: TAF (2035) (Side: EAST)","39 -COREVMod WarfareThai: Free Thai (Side: WEST)","40 -COREVMod WarfareThai: Free Thai (Side: GUER)","41 -COREVMod WarfareThai: Gangsters (Side: EAST)","42 -COREVMod WarfareThai: Gangsters INDEP (Side: GUER)","43 -COREVMod WarfareThai: Middle-East Armed Force (Side: EAST)","44 -COREVMod WarfareThai: Middle-East Armed Force (Woodland) (Side: EAST)","45 -COREVMod WarfareThai: Insurgents (Middle-Easterns) (Side: EAST)","46 -COREVMod WarfareThai: Insurgents (Middle-Easterns) INDEP (Side: GUER)","47 -COREVMod WarfareThai: Terrorists (Middle-Easterns) (Side: EAST)","48 -COREVMod WarfareThai: Terrorists (Middle-Easterns) INDEP (Side: GUER)","49 -CUP Community Upgrade Project: Army of the Czech Republic (Side: WEST)","50 -CUP Bohemia Interactive: Bundeswehr (Side: WEST)","51 -CUP Bohemia Interactive: United States Army (Side: WEST)","52 -CUP Bohemia Interactive: National Party of Chernarus (Side: GUER)","53 -CUP Bohemia Interactive: ION PMC (Side: GUER)","54 -CUP Bohemia Interactive: Royal Army Corps of Sahrani (Side: GUER)","55 -CUP Bohemia Interactive: Takistani Army (Side: EAST)","56 -CUP_Units Community Upgrade Project: British Armed Forces (Side: WEST)","57 -CUP_Units Bohemia Interactive: Takistani Locals (Side: GUER)","58 -CUP_Units Community Upgrade Project: United Nations (Side: GUER)","59 -CUP_Units Community Upgrade Project: Chernarussian Movement of the Red Star (Side: EAST)","60 -CUP_Units Bohemia Interactive: Takistani Militia (Side: EAST)","61 -CUP_Vehicles Community Upgrade Project: Chernarus Defense Forces (Side: WEST)","62 -CUP_Vehicles Community Upgrade Project: Royal New Zealand Navy (Side: WEST)","63 -CUP_Vehicles Community Upgrade Project: United States Marine Corps (Side: WEST)","64 -CUP_Vehicles Community Upgrade Project: Armed Forces of the Russian Federation (Side: EAST)","65 -CUP_Vehicles Community Upgrade Project: Sahrani Liberation Army (Side: EAST)","66 -Expansion Bohemia Interactive: CTRG (Side: WEST)","67 -Expansion Bohemia Interactive: Gendarmerie (Side: WEST)","68 -Expansion Bohemia Interactive: OTAN (Pacifique) (Side: WEST)","69 -Expansion Bohemia Interactive: Syndikat (Side: GUER)","70 -Expansion Bohemia Interactive: CSAT (Pacifique) (Side: EAST)","71 -Expansion Burgess: OPCAN (Colonial Police) (Side: WEST)","72 -Expansion Burgess: OPCAN (Colonial Sheriff) (Side: WEST)","73 -FOW Bohemia Interactive: [AUS] Australian Army (Side: GUER)","74 -FOW Bohemia Interactive: [DE] Heer (Side: WEST)","75 -FOW Bohemia Interactive: [IT] Regio Esercito (Side: WEST)","76 -FOW Bohemia Interactive: [DE] Luftwaffe (Side: WEST)","77 -FOW Bohemia Interactive: [UK] Army (Side: GUER)","78 -FOW FOW Team: [DE] Waffen-SS (Side: WEST)","79 -fow_mod FOW team: [JP] Imperial Army (Side: WEST)","80 -fow_mod FOW team: [US] Army (Europe) (Side: GUER)","81 -fow_mod Bohemia Interactive: [US] Army (Pacific) (Side: GUER)","82 -fow_mod FOW team: [US] Marines Corps (Side: GUER)","83 -GAL HcPookie: GAL (Government Army of Lingor) (Side: WEST)","84 -GALACTIC SWOP: Galactic Republic (Side: WEST)","85 -GANGBLUE BIS/IceBreakr: Blue Gang (Side: WEST)","86 -GANGRED BIS/IceBreakr: Red Gang (Side: EAST)","87 -IBR Bohemia Interactive: Alienz (Side: GUER)","88 -ISC Bohemia Interactive: [ISC] Iraqi Police (Side: WEST)","89 -ISC Bohemia Interactive: [ISC] YPG (Side: WEST)","90 -LIB AWAR: ACI (Side: GUER)","91 -LIB AWAR & Lennard: ARR (Side: WEST)","92 -LIB Lennard: Deutsches Afrikakorps (Side: WEST)","93 -LIB AWAR & Joarius: FFI (Side: GUER)","94 -LIB AWAR: Armia Krajowa (Polonais) (Side: GUER)","95 -LIB AWAR: Luftwaffe (Side: WEST)","96 -LIB AWAR & Lennard: [Winter] Luftwaffe (Side: WEST)","97 -LIB AWAR & Lennard: MKHL (Side: WEST)","98 -LIB Lennard: US North African Corps (Side: GUER)","99 -LIB Lennard: NKVD (Side: EAST)","100 -LIB IFA3 Team: Panzerwaffe (Side: WEST)","101 -LIB AWAR & Lennard: [Winter] Panzerwaffe (Side: WEST)","102 -LIB AWAR: RAAF (Side: GUER)","103 -LIB IFA3 Team: RAF (Side: GUER)","104 -LIB AWAR & Lennard: RBAF (Side: WEST)","105 -LIB AWAR: Red Army (Side: EAST)","106 -LIB AWAR & Lennard: [Winter] Red Army (Side: EAST)","107 -LIB El Tyranos & Jove Chiere: 101st Airborne Division (Side: GUER)","108 -LIB El Tyranos: 82nd Airborne Division (Side: GUER)","109 -LIB AWAR: US Army Air Forces (Side: GUER)","110 -LIB AWAR: [Winter] US Airforce (Side: GUER)","111 -LIB IFA3 Team: US Army (Side: GUER)","112 -LIB XXX: [Winter] US Army (Side: GUER)","113 -LIB Lennard: US 2nd Ranger Battalion (Side: GUER)","114 -LIB I44: US Tank Troops (Side: GUER)","115 -LIB AWAR & Lennard: [Winter] US Tank Troops (Side: GUER)","116 -LIB AWAR: USSR Airforce (Side: EAST)","117 -LIB AWAR & Lennard: [Winter] USSR Airforce (Side: EAST)","118 -LIB AWAR: Tank troops of USSR (Side: EAST)","119 -LIB AWAR & Lennard: [Winter] Tank troops of USSR (Side: EAST)","120 -LIB AWAR: Wehrmacht (Side: WEST)","121 -LIB AWAR & Lennard: [Winter] Wehrmacht (Side: WEST)","122 -LM Burgess: UNSCMC (Urban) (Side: WEST)","123 -LM Burgess: UNSCMC (Desert) (Side: WEST)","124 -LM Burgess: ONI Security (Side: WEST)","125 -LM Burgess: UNSCMC (Snow) (Side: WEST)","126 -LM Burgess: UNSCMC (Wood) (Side: WEST)","127 -LM Burgess: OPCANTest (Side: WEST)","128 -LOP Project OPFOR: Boko Haram (Side: EAST)","129 -LOP Project OPFOR: Irish Republican Army (Side: EAST)","130 -LOP Project OPFOR: Ulster Volunteer Force (Side: GUER)","131 -LOP_LeightsOPFOR Project OPFOR: Afghan National Army and Police (Side: WEST)","132 -LOP_LeightsOPFOR Project OPFOR: African Militia (Side: GUER)","133 -LOP_LeightsOPFOR Project OPFOR: African Militia (Side: EAST)","134 -LOP_LeightsOPFOR Project OPFOR: Middle Eastern Militia (Side: GUER)","135 -LOP_LeightsOPFOR Project OPFOR: Middle Eastern Militia (Side: EAST)","136 -LOP_LeightsOPFOR Project OPFOR: Chernarussian Defence Forces (Side: WEST)","137 -LOP_LeightsOPFOR Project OPFOR: ChDKZ (Side: EAST)","138 -LOP_LeightsOPFOR Project OPFOR: Iraqi Armed Forces (Side: WEST)","139 -LOP_LeightsOPFOR Project OPFOR: Iranian Armed Forces (Side: GUER)","140 -LOP_LeightsOPFOR Project OPFOR: Islamic State (Side: GUER)","141 -LOP_LeightsOPFOR Project OPFOR: Islamic State (Side: EAST)","142 -LOP_LeightsOPFOR Project OPFOR: Chernarussian National Insurgents (Side: GUER)","143 -LOP_LeightsOPFOR Project OPFOR: Kurdish Peshmerga Forces (Side: WEST)","144 -LOP_LeightsOPFOR Project OPFOR: Kurdish Peshmerga Forces (Side: GUER)","145 -LOP_LeightsOPFOR Project OPFOR: Private Military Company (Side: GUER)","146 -LOP_LeightsOPFOR Project OPFOR: Royal Army Corps of Sahrani (Side: GUER)","147 -LOP_LeightsOPFOR Project OPFOR: Sahrani Liberation Army (Side: EAST)","148 -LOP_LeightsOPFOR Project OPFOR: Takistani Armed Forces (Side: EAST)","149 -LOP_LeightsOPFOR Project OPFOR: Ultranationalists (Side: GUER)","150 -LOP_LeightsOPFOR Project OPFOR: Ukrainian Armed Forces (Side: WEST)","151 -LOP_LeightsOPFOR Project OPFOR: United Nations (Side: GUER)","152 -LOP_LeightsOPFOR Project OPFOR: United Armed Forces of Novorossiya (Side: EAST)","153 -Mark Bohemia Interactive: AAF (Side: EAST)","154 -MOL HcPookie: Molatian Army (Side: EAST)","155 -OPTRE Article 2 Studios: Insurrectionists (Side: EAST)","156 -OPTRE Burgess: OPCAN (Side: WEST)","157 -OPTRE Burgess: OPCAN (UEG Colonial Guard) (Side: WEST)","158 -OPTRE Burgess: Colonial Militia (OPCAN) (Side: GUER)","159 -OPTRE Burgess: OPCAN (PMC) (Side: GUER)","160 -OPTRE Burgess: Halo Wars Rebels (OPCAN) (Side: EAST)","161 -OPTRE Burgess: Common Criminals (OPCAN) (Side: EAST)","162 -OPTRE Burgess: OPCAN (UNSC Army) (Side: WEST)","163 -OPTRE Burgess: United Rebel Air Force(OPCAN) (Side: EAST)","164 -OPTRE Burgess: United Rebel Army Desert(OPCAN) (Side: EAST)","165 -OPTRE Burgess: United Rebel Army BattleJumpers (OPCAN) (Side: EAST)","166 -OPTRE Burgess: United Rebel Army Tropic(OPCAN) (Side: EAST)","167 -OPTRE Bohemia Interactive: United Rebel Army Ground Vehicles (OPCAN) (Side: EAST)","168 -OPTRE Burgess: United Rebel Army Wood(OPCAN) (Side: EAST)","169 -OPTRE Burgess: OPCAN (WARZONE BLUE) (Side: WEST)","170 -OPTRE Burgess: OPCAN (WARZONE RED) (Side: EAST)","171 -OPTRE Article 2 Studios: Colonial Police (Side: GUER)","172 -OPTRE Article 2 Studios: UNSCDF (Side: WEST)","173 -RHS_AFRF Bohemia Interactive: [ISC] al-Nusra Front (Side: GUER)","174 -RHS_AFRF Bohemia Interactive: [ISC] Iraqi Army (Side: WEST)","175 -RHS_AFRF Bohemia Interactive: [ISC] Islamic State (Side: GUER)","176 -RHS_AFRF Bohemia Interactive: [ISC] Islamic State (Side: EAST)","177 -RHS_AFRF Bohemia Interactive: [ISC] Peshmerga (Side: WEST)","178 -RHS_AFRF Bohemia Interactive: [ISC] Syrian Arab Army (Side: EAST)","179 -RHS_AFRF Red Hammer Studios: Eastern Militia (Side: GUER)","180 -RHS_AFRF Red Hammer Studios: Russia (MSV) (Side: EAST)","181 -RHS_AFRF Red Hammer Studios: Russia (RVA) (Side: EAST)","182 -RHS_AFRF Red Hammer Studios: Russia (TV) (Side: EAST)","183 -RHS_AFRF Red Hammer Studios: Russia (VDV) (Side: EAST)","184 -RHS_AFRF Red Hammer Studios: Russia (VMF) (Side: EAST)","185 -RHS_AFRF RHS: Russia (VPVO) (Side: EAST)","186 -RHS_AFRF Red Hammer Studios: Russia (VV) (Side: EAST)","187 -RHS_AFRF Bohemia Interactive: Russia (VVS - Grey) (Side: EAST)","188 -RHS_AFRF Red Hammer Studios: Russia (VVS - Camo) (Side: EAST)","189 -RHS_GREF Red Hammer Studios: Chernarus (Air Force) (Side: GUER)","190 -RHS_GREF Red Hammer Studios: Chernarus (Air Force) (Side: WEST)","191 -RHS_GREF RHS (A2 port): Chernarus (Ground Forces) (Side: GUER)","192 -RHS_GREF Red Hammer Studios: Chernarus (Ground Forces) (Side: WEST)","193 -RHS_GREF Red Hammer Studios: Chernarus (National Guard) (Side: GUER)","194 -RHS_GREF Red Hammer Studios: Chernarus (National Guard) (Side: WEST)","195 -RHS_GREF Red Hammer Studios: ChDKZ Insurgents (Side: EAST)","196 -RHS_GREF Red Hammer Studios: ChDKZ Insurgents (Side: GUER)","197 -RHS_GREF Red Hammer Studios: Chernarus (U.N. Peacekeepers) (Side: GUER)","198 -RHS_SAF Red Hammer Studios: SAF (RVIPVO) (Side: GUER)","199 -RHS_SAF Bohemia Interactive: SAF (KOV) (Side: GUER)","200 -RHS_SAF Red Hammer Studios: SAF (Casques Bleus) (Side: GUER)","201 -RHS_USAF Red Hammer Studios: USA (SOCOM) (Side: WEST)","202 -RHS_USAF Red Hammer Studios: USA (USAF) (Side: WEST)","203 -RHS_USAF Red Hammer Studios: USA (Army - D) (Side: WEST)","204 -RHS_USAF Red Hammer Studios: USA (Army - W) (Side: WEST)","205 -RHS_USAF Red Hammer Studios: USA (USMC - D) (Side: WEST)","206 -RHS_USAF Red Hammer Studios: USA (USMC - W) (Side: WEST)","207 -RHS_USAF Red Hammer Studios: USA (Navy) (Side: WEST)","208 -RHSGREF Red Hammer Studios: Horizon Islands Defence Force (Side: WEST)","209 -RHSGREF Red Hammer Studios: Nationalist Troops (Side: GUER)","210 -SG Stagler: Sturmtroopers (Side: WEST)","211 -SG Stagler: [Winter] Sturmtroopers (Side: WEST)","212 -SG Stagler: Tank Sturmtroopers (Side: WEST)","213 -SWOP_MODs SWOP: Bandits (Side: GUER)","214 -SWOP_MODs SWOP: DeathWatch (Side: GUER)","215 -SWOP_MODs SWOP: First Order (Side: EAST)","216 -SWOP_MODs SWOP: Jedi Order (Side: WEST)","217 -SWOP_MODs SWOP: Mandalorians (Side: GUER)","218 -SWOP_MODs SWOP: Resistance (Side: WEST)","219 -SWOP_MODs SWOP: Tusken Raiders (Side: GUER)","220 -UNSC Morthon: UNSCMC (Side: WEST)","221 -UNSUNG Bohemia Interactive: Australia (UNSUNG) (Side: WEST)","222 -UNSUNG HCPOOKIE - SAM pack: N.V.A. (UNSUNG) (Side: EAST)","223 -UNSUNG Bohemia Interactive: V.C. (UNSUNG) (Side: EAST)","224 -UNSUNG Bohemia Interactive: A.R.V.N. (UNSUNG) (Side: GUER)","225 -UNSUNG Bohemia Interactive: New Zealand (UNSUNG) (Side: WEST)","226 -UNSUNG Bohemia Interactive: U.S. (UNSUNG) (Side: WEST)","227 -USML segen: Armed Islamic Front (Side: GUER)"};
		default = 8;
	};
	class btc_p_AA {
		title = "			Anti-Air infantry:";
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
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
		texts[]={"0 - EricJ: Afghan Civilians (Side: CIV)","1 - Bohemia Interactive: Civils (Side: CIV)","2 -btc_militia_mod Giallustio: Afghan Civilians (Side: CIV)","3 -CAF CAF MOD TEAM: African (Side: CIV)","4 -CAF CAF MOD TEAM: Middle Eastern (Side: CIV)","5 -COREVMod WarfareThai: Civilians (Africans) (Side: CIV)","6 -COREVMod WarfareThai: Civilians (Asians) (Side: CIV)","7 -COREVMod WarfareThai: Civilians (Eastern Europeons) (Side: CIV)","8 -COREVMod WarfareThai: Civilians (Middle-Easterns) (Side: CIV)","9 -CUP_Units Community Upgrade Project: Civilians (Russian) (Side: CIV)","10 -CUP_Vehicles Community Upgrade Project: Civilians (Chernarus) (Side: CIV)","11 -CUP_Vehicles Bohemia Interactive: Civilians (Sahrani) (Side: CIV)","12 -CUP_Vehicles Community Upgrade Project: Civilians (Takistan) (Side: CIV)","13 -LIB Reyhard & Joarius: 40s Civilians (Side: CIV)","14 -LOP_LeightsOPFOR Project OPFOR: Civilians (African) (Side: CIV)","15 -LOP_LeightsOPFOR Project OPFOR: Civilians (Eastern European) (Side: CIV)","16 -LOP_LeightsOPFOR Project OPFOR: Civilians (Middle Eastern) (Side: CIV)","17 -OPTRE Article 2 Studios: Civilians (UEG) (Side: CIV)","18 -ORANGE Bohemia Interactive: IDAP (Side: CIV)","19 -RDS_CIV_PACK reyhard: Russians (Side: CIV)","20 -UNSUNG Bohemia Interactive: Vietnamese (UNSUNG) (Side: CIV)"};
		default = 1;
	};
	class btc_p_civ_veh {
		title = "			Civil vehicle type:";
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
		texts[]={"0 - EricJ: Afghan Civilians (Side: CIV)","1 - Bohemia Interactive: Civils (Side: CIV)","2 -btc_militia_mod Giallustio: Afghan Civilians (Side: CIV)","3 -CAF CAF MOD TEAM: African (Side: CIV)","4 -CAF CAF MOD TEAM: Middle Eastern (Side: CIV)","5 -COREVMod WarfareThai: Civilians (Africans) (Side: CIV)","6 -COREVMod WarfareThai: Civilians (Asians) (Side: CIV)","7 -COREVMod WarfareThai: Civilians (Eastern Europeons) (Side: CIV)","8 -COREVMod WarfareThai: Civilians (Middle-Easterns) (Side: CIV)","9 -CUP_Units Community Upgrade Project: Civilians (Russian) (Side: CIV)","10 -CUP_Vehicles Community Upgrade Project: Civilians (Chernarus) (Side: CIV)","11 -CUP_Vehicles Bohemia Interactive: Civilians (Sahrani) (Side: CIV)","12 -CUP_Vehicles Community Upgrade Project: Civilians (Takistan) (Side: CIV)","13 -LIB Reyhard & Joarius: 40s Civilians (Side: CIV)","14 -LOP_LeightsOPFOR Project OPFOR: Civilians (African) (Side: CIV)","15 -LOP_LeightsOPFOR Project OPFOR: Civilians (Eastern European) (Side: CIV)","16 -LOP_LeightsOPFOR Project OPFOR: Civilians (Middle Eastern) (Side: CIV)","17 -OPTRE Article 2 Studios: Civilians (UEG) (Side: CIV)","18 -ORANGE Bohemia Interactive: IDAP (Side: CIV)","19 -RDS_CIV_PACK reyhard: Russians (Side: CIV)","20 -UNSUNG Bohemia Interactive: Vietnamese (UNSUNG) (Side: CIV)"};
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
		values[]={0,1,2,3,4,5,6,7,8,9,10};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
		default = 0;
	};
	class btc_p_set_skill_aimingAccuracy {
		title = "			Set skill, aimingAccuracy";
		values[]={0,1,2,3,4,5,6,7,8,9,10};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
		default = 1;
	};
	class btc_p_set_skill_aimingShake {
		title = "			Set skill, aimingShake";
		values[]={0,1,2,3,4,5,6,7,8,9,10};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
		default = 4;
	};
	class btc_p_set_skill_aimingSpeed {
		title = "			Set skill, aimingSpeed";
		values[]={0,1,2,3,4,5,6,7,8,9,10};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
		default = 3;
	};
	class btc_p_set_skill_endurance {
		title = "			Set skill, endurance";
		values[]={0,1,2,3,4,5,6,7,8,9,10};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
		default = 5;
	};
	class btc_p_set_skill_spotDistance {
		title = "			Set skill, spotDistance";
		values[]={0,1,2,3,4,5,6,7,8,9,10};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
		default = 9;
	};
	class btc_p_set_skill_spotTime {
		title = "			Set skill, spotTime";
		values[]={0,1,2,3,4,5,6,7,8,9,10};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
		default = 7;
	};
	class btc_p_set_skill_courage {
		title = "			Set skill, courage";
		values[]={0,1,2,3,4,5,6,7,8,9,10};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
		default = 2;
	};
	class btc_p_set_skill_reloadSpeed {
		title = "			Set skill, reloadSpeed";
		values[]={0,1,2,3,4,5,6,7,8,9,10};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
		default = 10;
	};
	class btc_p_set_skill_commanding {
		title = "			Set skill, commanding";
		values[]={0,1,2,3,4,5,6,7,8,9,10};
		texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
		default = 7;
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