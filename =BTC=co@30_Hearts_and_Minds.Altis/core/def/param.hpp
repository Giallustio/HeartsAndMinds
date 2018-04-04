class Params {
    class btc_p_time_title {  // << Time options >>
        title = $STR_BTC_HAM_PARAM_TIME_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_time { // Set the start time:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_TIME_START"]);
        values[]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24};
        texts[]={"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"};
        default = 12;
    };
    class btc_p_acctime { // Acceleration time multiplier:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_TIME_MULTIP"]);
        values[]={1,2,3,4,5,6,7,8,9,10,11,12};
        texts[]={"1","2","3","4","5","6","7","8","9","10","11","12"};
        default = 5;
    };
    class btc_p_load { // Load the savegame (if available)
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_DB_LOAD"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 1;
    };
    class btc_p_auto_db { // Auto savegame (can break player immersion)
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_DB_ASAVE"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,24,48,72};
        texts[]={$STR_DISABLED,"1h","2h","3h","4h","5h","6h","7h","8h","9h","10h","11h","12h","24h","48h","72h"}; // texts[]={"Off","1h","2h","3h","4h","5h","6h","7h","8h","9h","10h","11h","12h","24h","48h","72h"};
        default = 0;
    };
    class btc_p_type_title { // << Faction options >>
        title = $STR_BTC_HAM_PARAM_FAC_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_en { // Enemy type:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_FAC_ETYPE"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227};
        texts[]={"0 - Bohemia Interactive: OTAN (Side: WEST)","1 - Bohemia Interactive: FIA (Side: WEST)","2 - jarrad96: Central African Militia (Side: EAST)","3 - Scar and Jmax: Galactic Empire (Side: EAST)","4 - SWOP: Geonosians (Side: EAST)","5 - Bohemia Interactive: AAF (Side: GUER)","6 - Bohemia Interactive: FIA (Side: GUER)","7 - Bohemia Interactive: CSAT (Side: EAST)","8 - Bohemia Interactive: FIA (Side: EAST)","9 - Bohemia Interactive: Rebel Alliance (Side: WEST)","10 - EricJ: Taliban (Side: EAST)","11 - Bohemia Interactive:  (Side: WEST)","12 -AFR BIS/IceBreakr: Afrenian Army (Side: WEST)","13 -ARA Bohemia Interactive: Abramian Rebel Alliance (Side: WEST)","14 -ARL BIS/IceBreakr: ARL Lingor Rebels (Side: EAST)","15 -btc_militia_mod Giallustio: Afghan Militia (Side: EAST)","16 -C SWOP: Confederacy of Independent Systems (Side: EAST)","17 -CAF CAF MOD TEAM: Africa - Pirates (Side: EAST)","18 -CAF CAF MOD TEAM: East Europe - Rebels (Side: EAST)","19 -CAF CAF MOD TEAM: Middle East - Tribal (Side: EAST)","20 -CEC HcPookie: Cecanian Army (Side: EAST)","21 -COREVMod WarfareThai: African State Defense Force (Side: EAST)","22 -COREVMod WarfareThai: African State Defense Force INDEP (Side: GUER)","23 -COREVMod WarfareThai: Insurgents (Africans) (Side: EAST)","24 -COREVMod WarfareThai: Insurgents (Africans) INDEP (Side: GUER)","25 -COREVMod WarfareThai: Drug Cartel (Asians) (Side: EAST)","26 -COREVMod WarfareThai: Drug Cartel (Asians) INDEP (Side: GUER)","27 -COREVMod WarfareThai: Eastern European Armed Force (Side: EAST)","28 -COREVMod WarfareThai: Eastern European Armed Force INDEP (Side: GUER)","29 -COREVMod WarfareThai: Insurgents (Eastern Europeons) (Side: EAST)","30 -COREVMod WarfareThai: Insurgents (Eastern Europeons) INDEP (Side: GUER)","31 -COREVMod WarfareThai: Pirates (Africans) (Side: EAST)","32 -COREVMod WarfareThai: Pirates (Africans) INDEP (Side: GUER)","33 -COREVMod WarfareThai: Cops (Side: WEST)","34 -COREVMod WarfareThai: Cops INDEP (Side: GUER)","35 -COREVMod WarfareThai: Terrorists (Africans) (Side: EAST)","36 -COREVMod WarfareThai: Terrorists (Africans) INDEP (Side: GUER)","37 -COREVMod WarfareThai: TAF (Modern) (Side: WEST)","38 -COREVMod WarfareThai: TAF (2035) (Side: EAST)","39 -COREVMod WarfareThai: Free Thai (Side: WEST)","40 -COREVMod WarfareThai: Free Thai (Side: GUER)","41 -COREVMod WarfareThai: Gangsters (Side: EAST)","42 -COREVMod WarfareThai: Gangsters INDEP (Side: GUER)","43 -COREVMod WarfareThai: Middle-East Armed Force (Side: EAST)","44 -COREVMod WarfareThai: Middle-East Armed Force (Woodland) (Side: EAST)","45 -COREVMod WarfareThai: Insurgents (Middle-Easterns) (Side: EAST)","46 -COREVMod WarfareThai: Insurgents (Middle-Easterns) INDEP (Side: GUER)","47 -COREVMod WarfareThai: Terrorists (Middle-Easterns) (Side: EAST)","48 -COREVMod WarfareThai: Terrorists (Middle-Easterns) INDEP (Side: GUER)","49 -CUP Community Upgrade Project: Army of the Czech Republic (Side: WEST)","50 -CUP Bohemia Interactive: Bundeswehr (Side: WEST)","51 -CUP Bohemia Interactive: United States Army (Side: WEST)","52 -CUP Bohemia Interactive: National Party of Chernarus (Side: GUER)","53 -CUP Bohemia Interactive: ION PMC (Side: GUER)","54 -CUP Bohemia Interactive: Royal Army Corps of Sahrani (Side: GUER)","55 -CUP Bohemia Interactive: Takistani Army (Side: EAST)","56 -CUP_Units Community Upgrade Project: British Armed Forces (Side: WEST)","57 -CUP_Units Bohemia Interactive: Takistani Locals (Side: GUER)","58 -CUP_Units Community Upgrade Project: United Nations (Side: GUER)","59 -CUP_Units Community Upgrade Project: Chernarussian Movement of the Red Star (Side: EAST)","60 -CUP_Units Bohemia Interactive: Takistani Militia (Side: EAST)","61 -CUP_Vehicles Community Upgrade Project: Chernarus Defense Forces (Side: WEST)","62 -CUP_Vehicles Community Upgrade Project: Royal New Zealand Navy (Side: WEST)","63 -CUP_Vehicles Community Upgrade Project: United States Marine Corps (Side: WEST)","64 -CUP_Vehicles Community Upgrade Project: Armed Forces of the Russian Federation (Side: EAST)","65 -CUP_Vehicles Community Upgrade Project: Sahrani Liberation Army (Side: EAST)","66 -Expansion Bohemia Interactive: CTRG (Side: WEST)","67 -Expansion Bohemia Interactive: Gendarmerie (Side: WEST)","68 -Expansion Bohemia Interactive: OTAN (Pacifique) (Side: WEST)","69 -Expansion Bohemia Interactive: Syndikat (Side: GUER)","70 -Expansion Bohemia Interactive: CSAT (Pacifique) (Side: EAST)","71 -Expansion Burgess: OPCAN (Colonial Police) (Side: WEST)","72 -Expansion Burgess: OPCAN (Colonial Sheriff) (Side: WEST)","73 -FOW Bohemia Interactive: [AUS] Australian Army (Side: GUER)","74 -FOW Bohemia Interactive: [DE] Heer (Side: WEST)","75 -FOW Bohemia Interactive: [IT] Regio Esercito (Side: WEST)","76 -FOW Bohemia Interactive: [DE] Luftwaffe (Side: WEST)","77 -FOW Bohemia Interactive: [UK] Army (Side: GUER)","78 -FOW FOW Team: [DE] Waffen-SS (Side: WEST)","79 -fow_mod FOW team: [JP] Imperial Army (Side: WEST)","80 -fow_mod FOW team: [US] Army (Europe) (Side: GUER)","81 -fow_mod Bohemia Interactive: [US] Army (Pacific) (Side: GUER)","82 -fow_mod FOW team: [US] Marines Corps (Side: GUER)","83 -GAL HcPookie: GAL (Government Army of Lingor) (Side: WEST)","84 -GALACTIC SWOP: Galactic Republic (Side: WEST)","85 -GANGBLUE BIS/IceBreakr: Blue Gang (Side: WEST)","86 -GANGRED BIS/IceBreakr: Red Gang (Side: EAST)","87 -IBR Bohemia Interactive: Alienz (Side: GUER)","88 -ISC Bohemia Interactive: [ISC] Iraqi Police (Side: WEST)","89 -ISC Bohemia Interactive: [ISC] YPG (Side: WEST)","90 -LIB AWAR: ACI (Side: GUER)","91 -LIB AWAR & Lennard: ARR (Side: WEST)","92 -LIB Lennard: Deutsches Afrikakorps (Side: WEST)","93 -LIB AWAR & Joarius: FFI (Side: GUER)","94 -LIB AWAR: Armia Krajowa (Polonais) (Side: GUER)","95 -LIB AWAR: Luftwaffe (Side: WEST)","96 -LIB AWAR & Lennard: [Winter] Luftwaffe (Side: WEST)","97 -LIB AWAR & Lennard: MKHL (Side: WEST)","98 -LIB Lennard: US North African Corps (Side: GUER)","99 -LIB Lennard: NKVD (Side: EAST)","100 -LIB IFA3 Team: Panzerwaffe (Side: WEST)","101 -LIB AWAR & Lennard: [Winter] Panzerwaffe (Side: WEST)","102 -LIB AWAR: RAAF (Side: GUER)","103 -LIB IFA3 Team: RAF (Side: GUER)","104 -LIB AWAR & Lennard: RBAF (Side: WEST)","105 -LIB AWAR: Red Army (Side: EAST)","106 -LIB AWAR & Lennard: [Winter] Red Army (Side: EAST)","107 -LIB El Tyranos & Jove Chiere: 101st Airborne Division (Side: GUER)","108 -LIB El Tyranos: 82nd Airborne Division (Side: GUER)","109 -LIB AWAR: US Army Air Forces (Side: GUER)","110 -LIB AWAR: [Winter] US Airforce (Side: GUER)","111 -LIB IFA3 Team: US Army (Side: GUER)","112 -LIB XXX: [Winter] US Army (Side: GUER)","113 -LIB Lennard: US 2nd Ranger Battalion (Side: GUER)","114 -LIB I44: US Tank Troops (Side: GUER)","115 -LIB AWAR & Lennard: [Winter] US Tank Troops (Side: GUER)","116 -LIB AWAR: USSR Airforce (Side: EAST)","117 -LIB AWAR & Lennard: [Winter] USSR Airforce (Side: EAST)","118 -LIB AWAR: Tank troops of USSR (Side: EAST)","119 -LIB AWAR & Lennard: [Winter] Tank troops of USSR (Side: EAST)","120 -LIB AWAR: Wehrmacht (Side: WEST)","121 -LIB AWAR & Lennard: [Winter] Wehrmacht (Side: WEST)","122 -LM Burgess: UNSCMC (Urban) (Side: WEST)","123 -LM Burgess: UNSCMC (Desert) (Side: WEST)","124 -LM Burgess: ONI Security (Side: WEST)","125 -LM Burgess: UNSCMC (Snow) (Side: WEST)","126 -LM Burgess: UNSCMC (Wood) (Side: WEST)","127 -LM Burgess: OPCANTest (Side: WEST)","128 -LOP Project OPFOR: Boko Haram (Side: EAST)","129 -LOP Project OPFOR: Irish Republican Army (Side: EAST)","130 -LOP Project OPFOR: Ulster Volunteer Force (Side: GUER)","131 -LOP_LeightsOPFOR Project OPFOR: Afghan National Army and Police (Side: WEST)","132 -LOP_LeightsOPFOR Project OPFOR: African Militia (Side: GUER)","133 -LOP_LeightsOPFOR Project OPFOR: African Militia (Side: EAST)","134 -LOP_LeightsOPFOR Project OPFOR: Middle Eastern Militia (Side: GUER)","135 -LOP_LeightsOPFOR Project OPFOR: Middle Eastern Militia (Side: EAST)","136 -LOP_LeightsOPFOR Project OPFOR: Chernarussian Defence Forces (Side: WEST)","137 -LOP_LeightsOPFOR Project OPFOR: ChDKZ (Side: EAST)","138 -LOP_LeightsOPFOR Project OPFOR: Iraqi Armed Forces (Side: WEST)","139 -LOP_LeightsOPFOR Project OPFOR: Iranian Armed Forces (Side: GUER)","140 -LOP_LeightsOPFOR Project OPFOR: Islamic State (Side: GUER)","141 -LOP_LeightsOPFOR Project OPFOR: Islamic State (Side: EAST)","142 -LOP_LeightsOPFOR Project OPFOR: Chernarussian National Insurgents (Side: GUER)","143 -LOP_LeightsOPFOR Project OPFOR: Kurdish Peshmerga Forces (Side: WEST)","144 -LOP_LeightsOPFOR Project OPFOR: Kurdish Peshmerga Forces (Side: GUER)","145 -LOP_LeightsOPFOR Project OPFOR: Private Military Company (Side: GUER)","146 -LOP_LeightsOPFOR Project OPFOR: Royal Army Corps of Sahrani (Side: GUER)","147 -LOP_LeightsOPFOR Project OPFOR: Sahrani Liberation Army (Side: EAST)","148 -LOP_LeightsOPFOR Project OPFOR: Takistani Armed Forces (Side: EAST)","149 -LOP_LeightsOPFOR Project OPFOR: Ultranationalists (Side: GUER)","150 -LOP_LeightsOPFOR Project OPFOR: Ukrainian Armed Forces (Side: WEST)","151 -LOP_LeightsOPFOR Project OPFOR: United Nations (Side: GUER)","152 -LOP_LeightsOPFOR Project OPFOR: United Armed Forces of Novorossiya (Side: EAST)","153 -Mark Bohemia Interactive: AAF (Side: EAST)","154 -MOL HcPookie: Molatian Army (Side: EAST)","155 -OPTRE Article 2 Studios: Insurrectionists (Side: EAST)","156 -OPTRE Burgess: OPCAN (Side: WEST)","157 -OPTRE Burgess: OPCAN (UEG Colonial Guard) (Side: WEST)","158 -OPTRE Burgess: Colonial Militia (OPCAN) (Side: GUER)","159 -OPTRE Burgess: OPCAN (PMC) (Side: GUER)","160 -OPTRE Burgess: Halo Wars Rebels (OPCAN) (Side: EAST)","161 -OPTRE Burgess: Common Criminals (OPCAN) (Side: EAST)","162 -OPTRE Burgess: OPCAN (UNSC Army) (Side: WEST)","163 -OPTRE Burgess: United Rebel Air Force(OPCAN) (Side: EAST)","164 -OPTRE Burgess: United Rebel Army Desert(OPCAN) (Side: EAST)","165 -OPTRE Burgess: United Rebel Army BattleJumpers (OPCAN) (Side: EAST)","166 -OPTRE Burgess: United Rebel Army Tropic(OPCAN) (Side: EAST)","167 -OPTRE Bohemia Interactive: United Rebel Army Ground Vehicles (OPCAN) (Side: EAST)","168 -OPTRE Burgess: United Rebel Army Wood(OPCAN) (Side: EAST)","169 -OPTRE Burgess: OPCAN (WARZONE BLUE) (Side: WEST)","170 -OPTRE Burgess: OPCAN (WARZONE RED) (Side: EAST)","171 -OPTRE Article 2 Studios: Colonial Police (Side: GUER)","172 -OPTRE Article 2 Studios: UNSCDF (Side: WEST)","173 -RHS_AFRF Bohemia Interactive: [ISC] al-Nusra Front (Side: GUER)","174 -RHS_AFRF Bohemia Interactive: [ISC] Iraqi Army (Side: WEST)","175 -RHS_AFRF Bohemia Interactive: [ISC] Islamic State (Side: GUER)","176 -RHS_AFRF Bohemia Interactive: [ISC] Islamic State (Side: EAST)","177 -RHS_AFRF Bohemia Interactive: [ISC] Peshmerga (Side: WEST)","178 -RHS_AFRF Bohemia Interactive: [ISC] Syrian Arab Army (Side: EAST)","179 -RHS_AFRF Red Hammer Studios: Eastern Militia (Side: GUER)","180 -RHS_AFRF Red Hammer Studios: Russia (MSV) (Side: EAST)","181 -RHS_AFRF Red Hammer Studios: Russia (RVA) (Side: EAST)","182 -RHS_AFRF Red Hammer Studios: Russia (TV) (Side: EAST)","183 -RHS_AFRF Red Hammer Studios: Russia (VDV) (Side: EAST)","184 -RHS_AFRF Red Hammer Studios: Russia (VMF) (Side: EAST)","185 -RHS_AFRF RHS: Russia (VPVO) (Side: EAST)","186 -RHS_AFRF Red Hammer Studios: Russia (VV) (Side: EAST)","187 -RHS_AFRF Bohemia Interactive: Russia (VVS - Grey) (Side: EAST)","188 -RHS_AFRF Red Hammer Studios: Russia (VVS - Camo) (Side: EAST)","189 -RHS_GREF Red Hammer Studios: Chernarus (Air Force) (Side: GUER)","190 -RHS_GREF Red Hammer Studios: Chernarus (Air Force) (Side: WEST)","191 -RHS_GREF RHS (A2 port): Chernarus (Ground Forces) (Side: GUER)","192 -RHS_GREF Red Hammer Studios: Chernarus (Ground Forces) (Side: WEST)","193 -RHS_GREF Red Hammer Studios: Chernarus (National Guard) (Side: GUER)","194 -RHS_GREF Red Hammer Studios: Chernarus (National Guard) (Side: WEST)","195 -RHS_GREF Red Hammer Studios: ChDKZ Insurgents (Side: EAST)","196 -RHS_GREF Red Hammer Studios: ChDKZ Insurgents (Side: GUER)","197 -RHS_GREF Red Hammer Studios: Chernarus (U.N. Peacekeepers) (Side: GUER)","198 -RHS_SAF Red Hammer Studios: SAF (RVIPVO) (Side: GUER)","199 -RHS_SAF Bohemia Interactive: SAF (KOV) (Side: GUER)","200 -RHS_SAF Red Hammer Studios: SAF (Casques Bleus) (Side: GUER)","201 -RHS_USAF Red Hammer Studios: USA (SOCOM) (Side: WEST)","202 -RHS_USAF Red Hammer Studios: USA (USAF) (Side: WEST)","203 -RHS_USAF Red Hammer Studios: USA (Army - D) (Side: WEST)","204 -RHS_USAF Red Hammer Studios: USA (Army - W) (Side: WEST)","205 -RHS_USAF Red Hammer Studios: USA (USMC - D) (Side: WEST)","206 -RHS_USAF Red Hammer Studios: USA (USMC - W) (Side: WEST)","207 -RHS_USAF Red Hammer Studios: USA (Navy) (Side: WEST)","208 -RHSGREF Red Hammer Studios: Horizon Islands Defence Force (Side: WEST)","209 -RHSGREF Red Hammer Studios: Nationalist Troops (Side: GUER)","210 -SG Stagler: Sturmtroopers (Side: WEST)","211 -SG Stagler: [Winter] Sturmtroopers (Side: WEST)","212 -SG Stagler: Tank Sturmtroopers (Side: WEST)","213 -SWOP_MODs SWOP: Bandits (Side: GUER)","214 -SWOP_MODs SWOP: DeathWatch (Side: GUER)","215 -SWOP_MODs SWOP: First Order (Side: EAST)","216 -SWOP_MODs SWOP: Jedi Order (Side: WEST)","217 -SWOP_MODs SWOP: Mandalorians (Side: GUER)","218 -SWOP_MODs SWOP: Resistance (Side: WEST)","219 -SWOP_MODs SWOP: Tusken Raiders (Side: GUER)","220 -UNSC Morthon: UNSCMC (Side: WEST)","221 -UNSUNG Bohemia Interactive: Australia (UNSUNG) (Side: WEST)","222 -UNSUNG HCPOOKIE - SAM pack: N.V.A. (UNSUNG) (Side: EAST)","223 -UNSUNG Bohemia Interactive: V.C. (UNSUNG) (Side: EAST)","224 -UNSUNG Bohemia Interactive: A.R.V.N. (UNSUNG) (Side: GUER)","225 -UNSUNG Bohemia Interactive: New Zealand (UNSUNG) (Side: WEST)","226 -UNSUNG Bohemia Interactive: U.S. (UNSUNG) (Side: WEST)","227 -USML segen: Armed Islamic Front (Side: GUER)"};
        default = 8;
    };
    class btc_p_AA { // Anti-Air infantry:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_FAC_EAA"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_tank { // Enemy uses Tank:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_FAC_ETANK"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_civ { // Civil type:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_FAC_CTYPE"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
        texts[]={"0 - EricJ: Afghan Civilians (Side: CIV)","1 - Bohemia Interactive: Civils (Side: CIV)","2 -btc_militia_mod Giallustio: Afghan Civilians (Side: CIV)","3 -CAF CAF MOD TEAM: African (Side: CIV)","4 -CAF CAF MOD TEAM: Middle Eastern (Side: CIV)","5 -COREVMod WarfareThai: Civilians (Africans) (Side: CIV)","6 -COREVMod WarfareThai: Civilians (Asians) (Side: CIV)","7 -COREVMod WarfareThai: Civilians (Eastern Europeons) (Side: CIV)","8 -COREVMod WarfareThai: Civilians (Middle-Easterns) (Side: CIV)","9 -CUP_Units Community Upgrade Project: Civilians (Russian) (Side: CIV)","10 -CUP_Vehicles Community Upgrade Project: Civilians (Chernarus) (Side: CIV)","11 -CUP_Vehicles Bohemia Interactive: Civilians (Sahrani) (Side: CIV)","12 -CUP_Vehicles Community Upgrade Project: Civilians (Takistan) (Side: CIV)","13 -LIB Reyhard & Joarius: 40s Civilians (Side: CIV)","14 -LOP_LeightsOPFOR Project OPFOR: Civilians (African) (Side: CIV)","15 -LOP_LeightsOPFOR Project OPFOR: Civilians (Eastern European) (Side: CIV)","16 -LOP_LeightsOPFOR Project OPFOR: Civilians (Middle Eastern) (Side: CIV)","17 -OPTRE Article 2 Studios: Civilians (UEG) (Side: CIV)","18 -ORANGE Bohemia Interactive: IDAP (Side: CIV)","19 -RDS_CIV_PACK reyhard: Russians (Side: CIV)","20 -UNSUNG Bohemia Interactive: Vietnamese (UNSUNG) (Side: CIV)"};
        default = 1;
    };
    class btc_p_civ_veh { // Civil vehicle type:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_FAC_CTYPEVEH"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
        texts[]={"0 - EricJ: Afghan Civilians (Side: CIV)","1 - Bohemia Interactive: Civils (Side: CIV)","2 -btc_militia_mod Giallustio: Afghan Civilians (Side: CIV)","3 -CAF CAF MOD TEAM: African (Side: CIV)","4 -CAF CAF MOD TEAM: Middle Eastern (Side: CIV)","5 -COREVMod WarfareThai: Civilians (Africans) (Side: CIV)","6 -COREVMod WarfareThai: Civilians (Asians) (Side: CIV)","7 -COREVMod WarfareThai: Civilians (Eastern Europeons) (Side: CIV)","8 -COREVMod WarfareThai: Civilians (Middle-Easterns) (Side: CIV)","9 -CUP_Units Community Upgrade Project: Civilians (Russian) (Side: CIV)","10 -CUP_Vehicles Community Upgrade Project: Civilians (Chernarus) (Side: CIV)","11 -CUP_Vehicles Bohemia Interactive: Civilians (Sahrani) (Side: CIV)","12 -CUP_Vehicles Community Upgrade Project: Civilians (Takistan) (Side: CIV)","13 -LIB Reyhard & Joarius: 40s Civilians (Side: CIV)","14 -LOP_LeightsOPFOR Project OPFOR: Civilians (African) (Side: CIV)","15 -LOP_LeightsOPFOR Project OPFOR: Civilians (Eastern European) (Side: CIV)","16 -LOP_LeightsOPFOR Project OPFOR: Civilians (Middle Eastern) (Side: CIV)","17 -OPTRE Article 2 Studios: Civilians (UEG) (Side: CIV)","18 -ORANGE Bohemia Interactive: IDAP (Side: CIV)","19 -RDS_CIV_PACK reyhard: Russians (Side: CIV)","20 -UNSUNG Bohemia Interactive: Vietnamese (UNSUNG) (Side: CIV)"};
        default = 1;
    };
    class btc_p_IED_title { // << IED options >>
        title = $STR_BTC_HAM_PARAM_IED_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_ied { // IEDs ratio:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_IED_RATIO"]);
        values[]={0, 1, 2, 3};
        texts[]={$STR_DISABLED,$STR_BTC_HAM_PARAM_IED_RATIO_LOW,$STR_BTC_HAM_PARAM_IED_RATIO_NORMAL,$STR_BTC_HAM_PARAM_IED_RATIO_HIGH}; //texts[]={"Off","Low","Normal","High"};
        default = 2;
    };
    class btc_p_ied_spot { // IEDs spotting difficulty:
        title = __EVAL(format ["      %1",(localize "STR_BTC_HAM_PARAM_IED_SPOT")]);
        values[]={0, 1, 2};
        texts[]={$STR_BTC_HAM_PARAM_IED_SPOT_VERYEASY,$STR_BTC_HAM_PARAM_IED_SPOT_EASY,$STR_BTC_HAM_PARAM_IED_RATIO_NORMAL}; //texts[]={"Very easy","Easy","Normal"};
        default = 2;
    };
    class btc_p_ied_drone { // Drone bomber:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_IED_DRONE"]);
        values[]={0, 1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 1;
    };
    class btc_p_hideout_cache_title { // << Hideout/Cache options >>
        title = $STR_BTC_HAM_PARAM_HIDE_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_hideout_n { // Hideout numbers:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_HIDE_NUMBERS"]);
        values[]={99,1,2,3,4,5};
        texts[]={$STR_BTC_HAM_PARAM_HIDE_NUMBERS_RND,"1","2","3","4","5"}; //texts[]={"Random","1","2","3","4","5"};
        default = 5;
    };
    class btc_p_cache_info_def { // Info cache distance:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_CACHE_DISTANCE"]);
        values[]={500,1000,1500,2000,2500,3000,3500,4000,5000};
        texts[]={"500 m","1000 m","1500 m","2000 m","2500 m","3000 m","3500 m","4000 m","5000 m"};
        default = 1000;
    };
    class btc_p_cache_info_ratio { //Cache info ratio:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_CACHE_RATIO"]);
        values[]={50,100};
        texts[]={"50 m","100 m"};
        default = 100;
    };
    class btc_p_info_chance { // Intel from dead bodies chance:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_CACHE_DEADINFO"]);
        values[]={0,10,20,30,40,50,60,70,80,90,100};
        texts[]={"100 %","90 %","80 %","70 %","60 %","50 %","40 %","30 %","20 %","10 %","0 %"};
        default = 70;
    };
    class btc_p_medical_title { // << Medical options >>
        title = $STR_BTC_HAM_MEDI_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_redeploy { // Allow re-deploy?
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_MEDI_REDEPLOY"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 1;
    };
    class btc_p_skill_title { // << A3 Skill options >>
        title = $STR_BTC_HAM_PARAM_SKILL_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_set_skill { // Set skill?
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SKILL_ONOFF"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 1;
    };
    class btc_p_set_skill_general {  // Set skill, general
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SKILL_GEN"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 0;
    };
    class btc_p_set_skill_aimingAccuracy { // Set skill, aimingAccuracy
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SKILL_AIMACC"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 1;
    };
    class btc_p_set_skill_aimingShake {  // Set skill, aimingShake
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SKILL_AIMSKILL"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 4;
    };
    class btc_p_set_skill_aimingSpeed { // Set skill, aimingSpeed
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SKILL_AIMSPEED"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 3;
    };
    class btc_p_set_skill_endurance { // Set skill, endurance
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SKILL_ENDURANCE"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 5;
    };
    class btc_p_set_skill_spotDistance { // Set skill, spotDistance
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SKILL_SPOTDIST"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 9;
    };
    class btc_p_set_skill_spotTime { // Set skill, spotTime
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SKILL_SPOTTIME"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 7;
    };
    class btc_p_set_skill_courage { // Set skill, courage
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SKILL_COURAGE"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 2;
    };
    class btc_p_set_skill_reloadSpeed { // Set skill, reloadSpeed
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SKILL_RELOAD"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 10;
    };
    class btc_p_set_skill_commanding { // Set skill, commanding
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SKILL_COMMANDING"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 7;
    };
    class btc_p_gameplay_title { // << Gameplay options >>
        title = $STR_BTC_HAM_PARAM_GAMEPLAY_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_sea { // Extend battlefield to sea:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_GAMEPLAY_SEA"]);
        values[] = {0,1};
        texts[] = {$STR_DISABLED,$STR_ENABLED};
        default = 1;
    };
    class btc_p_veh_armed_ho { // Add armed vehicles in Hideout:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_GAMEPLAY_ARMEDHIDEOUT"]);
        values[] = {0,1};
        texts[] = {$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_veh_armed_spawn_more { // Add armed vehicles in Side mission/Cache:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_GAMEPLAY_ARMEDOTHER"]);
        values[] = {0,1};
        texts[] = {$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_side_mission_cycle {  // Side mission cycle:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_GAMEPLAY_SIDEM"]);
        values[] = {0,1};
        texts[] = {$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_main_title { // << Other options >>
        title = $STR_BTC_HAM_PARAM_OTHER_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_arsenalType { // Type of the arsenal:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_OTHER_ARSENALTYPE"]);
        values[]={0,1,2,3,4};
        texts[]={$STR_BTC_HAM_PARAM_OTHER_ARSENALTYPE_BIS,$STR_BTC_HAM_PARAM_OTHER_ARSENALTYPE_BA,$STR_BTC_HAM_PARAM_OTHER_ARSENALTYPE_BA_PLUS,$STR_BTC_HAM_PARAM_OTHER_ARSENALTYPE_ACE,$STR_BTC_HAM_PARAM_OTHER_ARSENALTYPE_ACE_PLUS}; //texts[]={"BIS - Vanilla","BIS - Vanilla and ACE 3","BIS - Vanilla and ACE 3 (scroll wheel action)","ACE 3","ACE 3 (scroll wheel action)"};
        default = 2;
    };
    class btc_p_arsenalRestrict { // Restricted arsenal:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_OTHER_ARSENALRESTR"]);
        values[]={0,1,2};
        texts[] = {$STR_DISABLED,$STR_BTC_HAM_PARAM_OTHER_ARSENALRESTR_FULL,$STR_BTC_HAM_PARAM_OTHER_ARSENALRESTR_REMOVEONLY}; //texts[]={"Off","Full","Remove only (works only with ACE3-Arsenal)"};
        default = 0;
    };
    class btc_p_rep { // Reputation at start:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_OTHER_REPSTART"]);
        values[]={0, 200, 500, 750};
        texts[]={$STR_BTC_HAM_PARAM_OTHER_REPSTART_VLOW,$STR_BTC_HAM_PARAM_IED_RATIO_LOW,$STR_BTC_HAM_PARAM_IED_RATIO_NORMAL,$STR_BTC_HAM_PARAM_IED_RATIO_HIGH}; //texts[]={"Very Low","Low","Normal","High"};
        default = 200;
    };
    class btc_p_garage { // Activate garage for admin:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_OTHER_GARAGEADMIN"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_city_radius { // Spawn city radius offset:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_OTHER_SPAWNRAD"]);
        values[]={0,1,2,3,4,5,6,7,8};
        texts[]={"0 m","100 m","200 m",$STR_BTC_HAM_PARAM_OTHER_SPAWNRAD_DEF,"400 m","500 m (Takistan)","600 m","700 m","800 m"}; // texts[]={"0 m","100 m","200 m","300 m","400 m","500 m (Takistan)","600 m","700 m","800 m"};
        default = 3;
    };
    class btc_p_trigger { // Disable city activation when a plane or helicopter (>190Km/h) is flying above:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_OTHER_DISABLESPAWN"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_debug { // Debug:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_OTHER_DEBUG"]);
        values[]={0,1,2};
        texts[]={$STR_DISABLED,$STR_ENABLED, $STR_BTC_HAM_PARAM_OTHER_DEBUG_LOGONLY}; // texts[]={"Off","On","Log only"};
        default = 0;
    };
};
