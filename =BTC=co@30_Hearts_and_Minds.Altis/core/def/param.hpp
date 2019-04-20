class Params {
    class btc_p_time_title {  // << Time options >>
        title = $STR_BTC_HAM_PARAM_TIME_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_time { // Set the start time:
        title = __EVAL(format ["      %1", localize "STR_A3_CFGVEHICLES_MODULEDATE_F_ARGUMENTS_HOUR_0"]);
        values[]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24};
        texts[]={"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24"};
        default = 12;
    };
    class btc_p_acctime { // Acceleration time multiplier:
        title = __EVAL(format ["      %1", localize "STR_USRACT_TIME_INC"]);
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
        values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212};
        texts[]={"0 - Bohemia Interactive: 2035 NATO (Side: WEST)","1 - Bohemia Interactive: 2035 FIA (Side: WEST)","2 - Bohemia Interactive: 2035 AAF (Side: GUER)","3 - Bohemia Interactive: 2035 FIA (Side: GUER)","4 - Bohemia Interactive: 2035 CSAT (Side: EAST)","5 - Bohemia Interactive: 2035 FIA (Side: EAST)","6 - EricJ: Taliban (Side: EAST)","7 - Bohemia Interactive:  (Side: WEST)","8 -AFR BIS/IceBreakr: Afrenian Army (Side: WEST)","9 -ARA Bohemia Interactive: Abramian Rebel Alliance (Side: WEST)","10 -ARL BIS/IceBreakr: ARL Lingor Rebels (Side: EAST)","11 -btc_militia_mod Giallustio: Afghan Militia (Side: EAST)","12 -CAF CAF MOD TEAM: Africa - Pirates (Side: EAST)","13 -CAF CAF MOD TEAM: East Europe - Rebels (Side: EAST)","14 -CAF CAF MOD TEAM: Middle East - Tribal (Side: EAST)","15 -CEC HcPookie: Cecanian Army (Side: EAST)","16 -CFP Drew: Afghan Army (Side: WEST)","17 -CFP Drew: Afghan Police (Side: WEST)","18 -CFP Tupolov: Army of the Czech Rep. (Jungle / Woodland) (Side: WEST)","19 -CFP Drew: Bundeswehr (Jungle / Woodland) (Side: WEST)","20 -CFP Drew: Israeli Defense Force (Side: WEST)","21 -CFP Bohemia Interactive: Iraqi Army (Side: WEST)","22 -CFP Bohemia Interactive: Iraqi Police (Side: WEST)","23 -CFP Drew: Kenyan Defense Force (Side: WEST)","24 -CFP Drew: Nigerian Army (Side: WEST)","25 -CFP Bohemia Interactive: Peshmerga (Side: WEST)","26 -CFP Archduke: Sudanese Armed Forces (Side: WEST)","27 -CFP Archduke: Sudan Rapid Support Forces / Janjaweed (Side: WEST)","28 -CFP Drew: Uganda People's Defense Force (Side: WEST)","29 -CFP Tupolov: US Marine Corps (Arid / Desert) (Side: WEST)","30 -CFP Drew: US 75th Rangers (Jungle/Woodland) (Side: WEST)","31 -CFP Drew: US Navy Seals (Arid / Desert) (Side: WEST)","32 -CFP Drew: US Navy Seals (Jungle / Woodland) (Side: WEST)","33 -CFP Bohemia Interactive: YPG (Side: WEST)","34 -CFP Bohemia Interactive: al-Nusra Front (Side: GUER)","35 -CFP Bohemia Interactive: Islamic State (Side: GUER)","36 -CFP Archduke: Sudan People's Liberation Movement North (Side: GUER)","37 -CFP Archduke: South Sudan People's Defense Force (Side: GUER)","38 -CFP Drew: Tuareg Rebels (Side: GUER)","39 -CFP Tupolov: Western Ultranationalists (Side: GUER)","40 -CFP Drew: Al Qaeda (Side: EAST)","41 -CFP Drew: Al-Shabaab (Side: EAST)","42 -CFP Tupolov: Ansar Allah (Houthis) (Side: EAST)","43 -CFP Drew: Boko Haram (Side: EAST)","44 -CFP jarrad96: Central African Rebels (Side: EAST)","45 -CFP Drew: Hamas Al Qassam Brigades (Side: EAST)","46 -CFP Drew: Hezbollah (Side: EAST)","47 -CFP Drew: Islamic Republic of Iran Army (Side: EAST)","48 -CFP Bohemia Interactive: Islamic State (Side: EAST)","49 -CFP Tupolov: Russian National Guard (Side: EAST)","50 -CFP Bohemia Interactive: Sudan Revolutionary Front (Side: EAST)","51 -CFP Drew: Somali Rebels (Side: EAST)","52 -CFP Bohemia Interactive: Sudan People's Liberation Movement In Opposition (Side: EAST)","53 -CFP Bohemia Interactive: Syrian Arab Army (Side: EAST)","54 -CFP Drew: Taliban Insurgents (Side: EAST)","55 -CUP Community Upgrade Project: Army of the Czech Rep. (Arid / Desert) (Side: WEST)","56 -CUP Bohemia Interactive: Bundeswehr (Arid / Desert) (Side: WEST)","57 -CUP Bohemia Interactive: US Army (Arid / Desert) (Side: WEST)","58 -CUP Bohemia Interactive: National Party of Chernarus (Side: GUER)","59 -CUP Bohemia Interactive: Royal Army Corps of Sahrani (Side: GUER)","60 -CUP Bohemia Interactive: Takistani Army (Side: EAST)","61 -CUP_Units Community Upgrade Project: British Army (Jungle / Woodland) (Side: WEST)","62 -CUP_Units Tupolov: US CIA (Middle East) (Side: WEST)","63 -CUP_Units Community Upgrade Project: British Army (Arid / Desert) (Side: WEST)","64 -CUP_Units Bohemia Interactive: Takistani Locals (Side: GUER)","65 -CUP_Units Community Upgrade Project: United Nations (Side: GUER)","66 -CUP_Units Community Upgrade Project: Chernarussian Movement of the Red Star (Side: EAST)","67 -CUP_Units Bohemia Interactive: Takistani Militia (Side: EAST)","68 -CUP_Vehicles Tupolov: US Army (Jungle / Woodland) (Side: WEST)","69 -CUP_Vehicles Tupolov: Russian Ground Forces (Arid / Desert) (Side: EAST)","70 -CUP_Vehicles Community Upgrade Project: Chernarus Defense Forces (Side: WEST)","71 -CUP_Vehicles Community Upgrade Project: Royal New Zealand Navy (Side: WEST)","72 -CUP_Vehicles Community Upgrade Project: US Marine Corps (Jungle / Woodland) (Side: WEST)","73 -CUP_Vehicles Community Upgrade Project: Russian Ground Forces (Jungle / Woodland) (Side: EAST)","74 -CUP_Vehicles Community Upgrade Project: Sahrani Liberation Army (Side: EAST)","75 -Expansion Bohemia Interactive: 2035 CTRG (Side: WEST)","76 -Expansion Bohemia Interactive: 2035 Gendarmerie (Side: WEST)","77 -Expansion Bohemia Interactive: 2035 NATO (Pacific) (Side: WEST)","78 -Expansion Community Upgrade Project: ION PMC (Side: GUER)","79 -Expansion Bohemia Interactive: 2035 CSAT (Pacific) (Side: EAST)","80 -FOW Bohemia Interactive: [AUS] Army (Pacific) (Side: GUER)","81 -FOW Bohemia Interactive: [DE] Heer (Side: WEST)","82 -FOW Bohemia Interactive: [HI] Army (Side: GUER)","83 -FOW Bohemia Interactive: [JP] Navy Air Service (Side: WEST)","84 -FOW Bohemia Interactive: [IT] Regio Esercito (Side: WEST)","85 -FOW Bohemia Interactive: [DE] Luftwaffe (Side: WEST)","86 -FOW Bohemia Interactive: [UK] Army (Side: GUER)","87 -FOW Bohemia Interactive: [UK] Fleet Air Arm (Side: GUER)","88 -FOW Bohemia Interactive: [US] Navy (Side: GUER)","89 -FOW FOW Team: [DE] Waffen-SS (Side: WEST)","90 -fow_mod FOW team: [JP] Imperial Army (Side: WEST)","91 -fow_mod FOW team: [US] Army (Europe) (Side: GUER)","92 -fow_mod Bohemia Interactive: [US] Army (Pacific) (Side: GUER)","93 -fow_mod FOW team: [US] Marines Corps (Side: GUER)","94 -GAL HcPookie: GAL (Government Army of Lingor) (Side: WEST)","95 -GANGBLUE BIS/IceBreakr: Blue Gang (Side: WEST)","96 -GANGRED BIS/IceBreakr: Red Gang (Side: EAST)","97 -IBR Bohemia Interactive: Alienz (Side: GUER)","98 -ISC Bohemia Interactive: [ISC] Iraqi Police (Side: WEST)","99 -ISC Bohemia Interactive: [ISC] YPG (Side: WEST)","100 -Jets Bravo Zero One Studios: Insurrectionists (OPCAN) (Side: EAST)","101 -Jets Bravo Zero One Studios: UNSCDF (OPCAN) (Side: WEST)","102 -LIB AWAR: ACI (Side: GUER)","103 -LIB AWAR & Lennard: ARR (Side: WEST)","104 -LIB Lennard: Deutsches Afrikakorps (Side: WEST)","105 -LIB Reyhard & Joarius: FFI (Side: GUER)","106 -LIB IFA3 Team: FallschirmjÃ¤ger (Side: WEST)","107 -LIB AWAR: Armia Krajowa (Polonais) (Side: GUER)","108 -LIB AWAR: Luftwaffe (Side: WEST)","109 -LIB AWAR & Lennard: [Winter] Luftwaffe (Side: WEST)","110 -LIB AWAR & Lennard: MKHL (Side: WEST)","111 -LIB Lennard: US North African Corps (Side: GUER)","112 -LIB Lennard: NKVD (Side: EAST)","113 -LIB AWAR: Panzerwaffe (Side: WEST)","114 -LIB AWAR & Lennard: [Winter] Panzerwaffe (Side: WEST)","115 -LIB AWAR: RAAF (Side: GUER)","116 -LIB IFA3 Team: Royal Air Force (Side: GUER)","117 -LIB AWAR & Lennard: RBAF (Side: WEST)","118 -LIB AWAR: Red Army (Side: EAST)","119 -LIB AWAR & Lennard: [Winter] Red Army (Side: EAST)","120 -LIB El Tyranos & Jove Chiere: 101st Airborne Division (Side: GUER)","121 -LIB El Tyranos: 82nd Airborne Division (Side: GUER)","122 -LIB IFA3 team: US Army Air Forces (Side: GUER)","123 -LIB AWAR: [Winter] US Airforce (Side: GUER)","124 -LIB IFA3 team: US Army (Side: GUER)","125 -LIB IFA3 team: [Winter] US Army (Side: GUER)","126 -LIB Lennard: US 2nd Ranger Battalion (Side: GUER)","127 -LIB IFA3 team: US Tank Troops (Side: GUER)","128 -LIB AWAR & Lennard: [Winter] US Tank Troops (Side: GUER)","129 -LIB AWAR: USSR Airforce (Side: EAST)","130 -LIB AWAR & Lennard: [Winter] USSR Airforce (Side: EAST)","131 -LIB AWAR: Tank troops of USSR (Side: EAST)","132 -LIB AWAR & Lennard: [Winter] Tank troops of USSR (Side: EAST)","133 -LIB AWAR: Wehrmacht (Side: WEST)","134 -LIB AWAR & Lennard: [Winter] Wehrmacht (Side: WEST)","135 -LOP Project OPFOR: Boko Haram (Side: EAST)","136 -LOP Project OPFOR: Irish Republican Army (Side: EAST)","137 -LOP Project OPFOR: Ulster Volunteer Force (Side: GUER)","138 -LOP_LeightsOPFOR Project OPFOR: Afghan National Army and Police (Side: WEST)","139 -LOP_LeightsOPFOR Project OPFOR: African Militia (Side: GUER)","140 -LOP_LeightsOPFOR Project OPFOR: African Militia (Side: EAST)","141 -LOP_LeightsOPFOR Project OPFOR: Middle Eastern Militia (Side: GUER)","142 -LOP_LeightsOPFOR Project OPFOR: Middle Eastern Militia (Side: EAST)","143 -LOP_LeightsOPFOR Project OPFOR: Chernarussian Defence Forces (Side: WEST)","144 -LOP_LeightsOPFOR Project OPFOR: ChDKZ (Side: EAST)","145 -LOP_LeightsOPFOR Project OPFOR: Iraqi Armed Forces (Side: WEST)","146 -LOP_LeightsOPFOR Project OPFOR: Iranian Armed Forces (Side: GUER)","147 -LOP_LeightsOPFOR Project OPFOR: Islamic State (Side: GUER)","148 -LOP_LeightsOPFOR Project OPFOR: Islamic State (Side: EAST)","149 -LOP_LeightsOPFOR Project OPFOR: Chernarussian National Insurgents (Side: GUER)","150 -LOP_LeightsOPFOR Project OPFOR: Kurdish Peshmerga Forces (Side: WEST)","151 -LOP_LeightsOPFOR Project OPFOR: Kurdish Peshmerga Forces (Side: GUER)","152 -LOP_LeightsOPFOR Project OPFOR: Private Military Company (Side: GUER)","153 -LOP_LeightsOPFOR Project OPFOR: Royal Army Corps of Sahrani (Side: GUER)","154 -LOP_LeightsOPFOR Project OPFOR: Sahrani Liberation Army (Side: EAST)","155 -LOP_LeightsOPFOR Project OPFOR: Takistani Armed Forces (Side: EAST)","156 -LOP_LeightsOPFOR Project OPFOR: Ultranationalists (Side: GUER)","157 -LOP_LeightsOPFOR Project OPFOR: Ukrainian Armed Forces (Side: WEST)","158 -LOP_LeightsOPFOR Project OPFOR: United Nations (Side: GUER)","159 -LOP_LeightsOPFOR Project OPFOR: United Armed Forces of Novorossiya (Side: EAST)","160 -MOL HcPookie: Molatian Army (Side: EAST)","161 -O jarrad96: Central African Rebels (Side: EAST)","162 -OPTRE Article 2 Studios: Insurrectionists (Side: EAST)","163 -OPTRE Article 2 Studios: Colonial Police (Side: GUER)","164 -OPTRE Article 2 Studios: UNSCDF (Side: WEST)","165 -RHS_AFRF Bohemia Interactive: [ISC] al-Nusra Front (Side: GUER)","166 -RHS_AFRF Bohemia Interactive: [ISC] Iraqi Army (Side: WEST)","167 -RHS_AFRF Bohemia Interactive: [ISC] Islamic State (Side: GUER)","168 -RHS_AFRF Bohemia Interactive: [ISC] Islamic State (Side: EAST)","169 -RHS_AFRF Bohemia Interactive: [ISC] Peshmerga (Side: WEST)","170 -RHS_AFRF Bohemia Interactive: [ISC] Syrian Arab Army (Side: EAST)","171 -RHS_AFRF Red Hammer Studios: Eastern Militia (Side: GUER)","172 -RHS_AFRF Red Hammer Studios: Russia (MSV) (Side: EAST)","173 -RHS_AFRF Red Hammer Studios: Russia (RVA) (Side: EAST)","174 -RHS_AFRF Red Hammer Studios: Russia (TV) (Side: EAST)","175 -RHS_AFRF Red Hammer Studios: Russia (VDV) (Side: EAST)","176 -RHS_AFRF Red Hammer Studios: Russia (VMF) (Side: EAST)","177 -RHS_AFRF RHS: Russia (VPVO) (Side: EAST)","178 -RHS_AFRF Red Hammer Studios: Russia (VV) (Side: EAST)","179 -RHS_AFRF Red Hammer Studios: Russia (VVS - Grey) (Side: EAST)","180 -RHS_AFRF Red Hammer Studios: Russia (VVS - Camo) (Side: EAST)","181 -RHS_GREF Red Hammer Studios: Chernarus (Air Force) (Side: GUER)","182 -RHS_GREF Red Hammer Studios: Chernarus (Air Force) (Side: WEST)","183 -RHS_GREF RHS (A2 port): Chernarus (Ground Forces) (Side: GUER)","184 -RHS_GREF Red Hammer Studios: Chernarus (Ground Forces) (Side: WEST)","185 -RHS_GREF Red Hammer Studios: Chernarus (National Guard) (Side: GUER)","186 -RHS_GREF Red Hammer Studios: Chernarus (National Guard) (Side: WEST)","187 -RHS_GREF Red Hammer Studios: ChDKZ Insurgents (Side: EAST)","188 -RHS_GREF Red Hammer Studios: ChDKZ Insurgents (Side: GUER)","189 -RHS_SAF Red Hammer Studios: SAF (RVIPVO) (Side: GUER)","190 -RHS_SAF Red Hammer Studios: SAF (KOV) (Side: GUER)","191 -RHS_SAF Red Hammer Studios: SAF (Casques Bleus) (Side: GUER)","192 -RHS_USAF Red Hammer Studios: USA (SOCOM) (Side: WEST)","193 -RHS_USAF Red Hammer Studios: USA (USAF) (Side: WEST)","194 -RHS_USAF Red Hammer Studios: USA (Army - D) (Side: WEST)","195 -RHS_USAF Red Hammer Studios: USA (Army - W) (Side: WEST)","196 -RHS_USAF Red Hammer Studios: USA (USMC - D) (Side: WEST)","197 -RHS_USAF Red Hammer Studios: USA (USMC - W) (Side: WEST)","198 -RHS_USAF Red Hammer Studios: USA (Navy) (Side: WEST)","199 -RHSGREF Red Hammer Studios: Horizon Islands Defence Force (Side: WEST)","200 -RHSGREF Red Hammer Studios: Nationalist Troops (Side: GUER)","201 -RHSGREF Red Hammer Studios: Chernarus (U.N. Peacekeepers) (Side: GUER)","202 -SG Stagler: Sturmtroopers (Side: WEST)","203 -SG Stagler: [Winter] Sturmtroopers (Side: WEST)","204 -SG Stagler: Tank Sturmtroopers (Side: WEST)","205 -Tank Bohemia Interactive: 2035 Syndikat (Side: GUER)","206 -UNSUNG Bohemia Interactive: Australia (UNSUNG) (Side: WEST)","207 -UNSUNG Razorback: N.V.A. (UNSUNG) (Side: EAST)","208 -UNSUNG Bohemia Interactive: V.C. (UNSUNG) (Side: EAST)","209 -UNSUNG UNSUNG: A.R.V.N. (UNSUNG) (Side: GUER)","210 -UNSUNG Bohemia Interactive: New Zealand (UNSUNG) (Side: WEST)","211 -UNSUNG Bohemia Interactive: U.S. (UNSUNG) (Side: WEST)","212 -USML segen: Armed Islamic Front (Side: GUER)"};
        default = 5;
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
        values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21};
        texts[]={"0 - EricJ: Afghan Civilians (Side: CIV)","1 - Bohemia Interactive: Civils (Side: CIV)","2 -btc_militia_mod Giallustio: Afghan Civilians (Side: CIV)","3 -CAF CAF MOD TEAM: African (Side: CIV)","4 -CAF CAF MOD TEAM: Middle Eastern (Side: CIV)","5 -CFP Drew: Civilians (Afghanistan) (Side: CIV)","6 -CFP Drew: Civilians (African Christian) (Side: CIV)","7 -CFP Drew: Civilians (African Islamic) (Side: CIV)","8 -CFP Drew: Civilians (Asian) (Side: CIV)","9 -CFP Drew: Civilians (Middle Eastern) (Side: CIV)","10 -CUP_Units Community Upgrade Project: Civilians (Russian) (Side: CIV)","11 -CUP_Vehicles Community Upgrade Project: Civilians (Chernarus) (Side: CIV)","12 -CUP_Vehicles Bohemia Interactive: Civilians (Sahrani) (Side: CIV)","13 -CUP_Vehicles Community Upgrade Project: Civilians (Takistan) (Side: CIV)","14 -Expansion Bohemia Interactive: Civilians (UEG) (Side: CIV)","15 -LIB Reyhard & Joarius: 40s Civilians (Side: CIV)","16 -LOP_LeightsOPFOR Project OPFOR: Civilians (African) (Side: CIV)","17 -LOP_LeightsOPFOR Project OPFOR: Civilians (Eastern European) (Side: CIV)","18 -LOP_LeightsOPFOR Project OPFOR: Civilians (Middle Eastern) (Side: CIV)","19 -ORANGE Bohemia Interactive: IDAP (Side: CIV)","20 -RDS_CIV_PACK reyhard: Russians (Side: CIV)","21 -UNSUNG Bohemia Interactive: Vietnamese (UNSUNG) (Side: CIV)"};
        default = 1;
    };
    class btc_p_civ_veh { // Civil vehicle type:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_FAC_CTYPEVEH"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21};
        texts[]={"0 - EricJ: Afghan Civilians (Side: CIV)","1 - Bohemia Interactive: Civils (Side: CIV)","2 -btc_militia_mod Giallustio: Afghan Civilians (Side: CIV)","3 -CAF CAF MOD TEAM: African (Side: CIV)","4 -CAF CAF MOD TEAM: Middle Eastern (Side: CIV)","5 -CFP Drew: Civilians (Afghanistan) (Side: CIV)","6 -CFP Drew: Civilians (African Christian) (Side: CIV)","7 -CFP Drew: Civilians (African Islamic) (Side: CIV)","8 -CFP Drew: Civilians (Asian) (Side: CIV)","9 -CFP Drew: Civilians (Middle Eastern) (Side: CIV)","10 -CUP_Units Community Upgrade Project: Civilians (Russian) (Side: CIV)","11 -CUP_Vehicles Community Upgrade Project: Civilians (Chernarus) (Side: CIV)","12 -CUP_Vehicles Bohemia Interactive: Civilians (Sahrani) (Side: CIV)","13 -CUP_Vehicles Community Upgrade Project: Civilians (Takistan) (Side: CIV)","14 -Expansion Bohemia Interactive: Civilians (UEG) (Side: CIV)","15 -LIB Reyhard & Joarius: 40s Civilians (Side: CIV)","16 -LOP_LeightsOPFOR Project OPFOR: Civilians (African) (Side: CIV)","17 -LOP_LeightsOPFOR Project OPFOR: Civilians (Eastern European) (Side: CIV)","18 -LOP_LeightsOPFOR Project OPFOR: Civilians (Middle Eastern) (Side: CIV)","19 -ORANGE Bohemia Interactive: IDAP (Side: CIV)","20 -RDS_CIV_PACK reyhard: Russians (Side: CIV)","21 -UNSUNG Bohemia Interactive: Vietnamese (UNSUNG) (Side: CIV)"};
        default = 1;
    };
    class btc_p_spawn_title { // << Spawn options >>
        title = $STR_BTC_HAM_PARAM_SPAWN_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_is_free_prob { // Probability for a city to be free:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPWAN_ISFREE_PROB"]);
        values[]={0,10,20,30,40,45,50,60,70,80,90,100};
        texts[]={"0%","10%","20%","30%","40%","45%","50%","60%","70%","80%","90%","100%"};
        default = 45;
    };
    class btc_p_mil_group_ratio { // Enemy density:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPWAN_ENEMY_DENSITY"]);
        values[]={0,10,20,30,40,50,60,70,80,90,100};
        texts[]={"0%","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"};
        default = 100;
    };
    class btc_p_civ_group_ratio { // Civilian density:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPWAN_CIVILIAN_DENSITY"]);
        values[]={0,10,20,30,40,50,60,70,80,90,100};
        texts[]={"0%","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"};
        default = 100;
    };
    class btc_p_wp_house_probability { // Density of military in house:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPWAN_MIL_INHOUSE_DENSITY"]);
        values[]={0,10,20,30,40,50,60,70,80,90,100};
        texts[]={"0%","10%","20%","30%","40%","50%","60%","70%","80%","90%","100%"};
        default = 30;
    };
    class btc_p_veh_armed_ho { // Add armed vehicles in Hideout:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPAWN_ARMEDHIDEOUT"]);
        values[] = {0,1};
        texts[] = {$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_veh_armed_spawn_more { // Add armed vehicles in Side mission/Cache:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPAWN_ARMEDOTHER"]);
        values[] = {0,1};
        texts[] = {$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_patrol_max { // Maximum number of military patrol:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPWAN_PATROL_MAX"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"1","2","3","4","5","6","7","8","9","10"};
        default = 8;
    };
    class btc_p_civ_max_veh { // Maximum number of civilian patrol:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_SPWAN_CIV_MAX_VEH"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"1","2","3","4","5","6","7","8","9","10"};
        default = 10;
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
        texts[]={$STR_DISABLED,$STR_A3_TIME_TRIALS_MISCTT_ROF_25,$STR_3DEN_ATTRIBUTES_SPEEDMODE_NORMAL,$STR_A3_TIME_TRIALS_MISCTT_ROF_21}; //texts[]={"Off","Low","Normal","High"};
        default = 2;
    };
    class btc_p_ied_spot { // IEDs spotting difficulty:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_IED_SPOT"]);
        values[]={0, 1, 2};
        texts[]={$STR_BTC_HAM_PARAM_IED_SPOT_VERYEASY,$STR_BTC_HAM_PARAM_IED_SPOT_EASY,$STR_3DEN_ATTRIBUTES_SPEEDMODE_NORMAL}; //texts[]={"Very easy","Easy","Normal"};
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
        texts[]={$STR_3DEN_ATTRIBUTES_OBJECTTEXTURE_RANDOM_TEXT,"1","2","3","4","5"}; //texts[]={"Random","1","2","3","4","5"};
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
        title = __EVAL(format ["      %1?", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 1;
    };
    class btc_p_set_skill_general {  // Set skill, general
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_3DEN_SCENARIO_TEXTSINGULAR"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 0;
    };
    class btc_p_set_skill_aimingAccuracy { // Set skill, aimingAccuracy
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_BTC_HAM_PARAM_SKILL_AIMACC"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 1;
    };
    class btc_p_set_skill_aimingShake {  // Set skill, aimingShake
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_BTC_HAM_PARAM_SKILL_AIMSKILL"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 4;
    };
    class btc_p_set_skill_aimingSpeed { // Set skill, aimingSpeed
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_BTC_HAM_PARAM_SKILL_AIMSPEED"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 3;
    };
    class btc_p_set_skill_endurance { // Set skill, endurance
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_A3_VR_STAMINA"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 5;
    };
    class btc_p_set_skill_spotDistance { // Set skill, spotDistance
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_BTC_HAM_PARAM_SKILL_SPOTDIST"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 9;
    };
    class btc_p_set_skill_spotTime { // Set skill, spotTime
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_BTC_HAM_PARAM_SKILL_SPOTTIME"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 7;
    };
    class btc_p_set_skill_courage { // Set skill, courage
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_BTC_HAM_PARAM_SKILL_COURAGE"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 2;
    };
    class btc_p_set_skill_reloadSpeed { // Set skill, reloadSpeed
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_BTC_HAM_PARAM_SKILL_RELOAD"]);
        values[]={0,1,2,3,4,5,6,7,8,9,10};
        texts[]={"0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1"};
        default = 10;
    };
    class btc_p_set_skill_commanding { // Set skill, commanding
        title = __EVAL(format ["      %1, %2", localize "STR_A3_CFGVEHICLES_MODULESKILL_F_0", localize "STR_A3_CFGHINTS0"]);
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
    class btc_p_side_mission_cycle {  // Side mission cycle:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_GAMEPLAY_SIDEM"]);
        values[] = {0,1};
        texts[] = {$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_arsenal_title { // << Arsenal options >>
        title = $STR_BTC_HAM_PARAM_ARSENAL_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_arsenal_Type { // Type of the arsenal:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_ARSENAL_ARSENALTYPE"]);
        values[]={0,1,2,3,4};
        texts[]={$STR_BTC_HAM_PARAM_ARSENAL_ARSENALTYPE_BIS,$STR_BTC_HAM_PARAM_ARSENAL_ARSENALTYPE_BA,$STR_BTC_HAM_PARAM_ARSENAL_ARSENALTYPE_BA_PLUS,$STR_BTC_HAM_PARAM_ARSENAL_ARSENALTYPE_ACE,$STR_BTC_HAM_PARAM_ARSENAL_ARSENALTYPE_ACE_PLUS}; //texts[]={"BIS - Vanilla","BIS - Vanilla and ACE 3","BIS - Vanilla and ACE 3 (scroll wheel action)","ACE 3","ACE 3 (scroll wheel action)"};
        default = 4;
    };
    class btc_p_arsenal_Restrict { // Restricted arsenal (See /define_mod.sqf):
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_ARSENAL_ARSENALRESTR"]);
        values[]={0,1,2,3};
        texts[] = {$STR_DISABLED,$STR_3DEN_ATTRIBUTES_SPEEDMODE_FULL,$STR_BTC_HAM_PARAM_ARSENAL_ARSENALRESTR_REMOVEONLY,$STR_BTC_HAM_PARAM_ARSENAL_ARSENALRESTR_FILTER}; //texts[]={"Off","Full","Remove only (works only with ACE3-Arsenal)","Filter on player role (works only with ACE3-Arsenal)"};
        default = 3;
    };
    class btc_p_autoloadout { // loadout:
        title = __EVAL(format ["      %1:", localize "STR_ACE_Interaction_Equipment"]);
        values[]={0,1,2};
        texts[]={$STR_DISABLED,$STR_BTC_HAM_PARAM_ARSENAL_AUTOLOADOUT, $STR_BTC_HAM_PARAM_ARSENAL_RMVWEAPONS};
        default = 1;
    };
    class btc_p_garage { // Activate garage for admin:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_ARSENAL_GARAGEADMIN"]);
        values[]={0,1};
        texts[]={$STR_DISABLED,$STR_ENABLED};
        default = 0;
    };
    class btc_p_main_title { // << Other options >>
        title = $STR_BTC_HAM_PARAM_OTHER_TITLE;
        values[]={0};
        texts[]={""};
        default = 0;
    };
    class btc_p_rep { // Reputation at start:
        title = __EVAL(format ["      %1", localize "STR_BTC_HAM_PARAM_OTHER_REPSTART"]);
        values[]={0, 200, 500, 750};
        texts[]={$STR_ACE_ViewDistance_object_verylow,$STR_A3_TIME_TRIALS_MISCTT_ROF_25,$STR_3DEN_ATTRIBUTES_SPEEDMODE_NORMAL,$STR_A3_TIME_TRIALS_MISCTT_ROF_21}; //texts[]={"Very Low","Low","Normal","High"};
        default = 200;
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
