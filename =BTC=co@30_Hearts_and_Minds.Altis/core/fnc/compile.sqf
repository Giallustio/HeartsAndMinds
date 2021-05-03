/////////////////////SERVER\\\\\\\\\\\\\\\\\\\\\
if (isServer) then {
    //CACHE
    btc_fnc_cache_find_pos = compileScript ["core\fnc\cache\find_pos.sqf"];
    btc_fnc_cache_create = compileScript ["core\fnc\cache\create.sqf"];
    btc_fnc_cache_create_attachto = compileScript ["core\fnc\cache\create_attachto.sqf"];
    btc_fnc_cache_init = compileScript ["core\fnc\cache\init.sqf"];

    //COMMON
    btc_fnc_check_los = compileScript ["core\fnc\common\check_los.sqf"];
    btc_fnc_create_composition = compileScript ["core\fnc\common\create_composition.sqf"];
    btc_fnc_house_addWP = compileScript ["core\fnc\common\house_addWP.sqf"];
    btc_fnc_set_damage = compileScript ["core\fnc\common\set_damage.sqf"];
    btc_fnc_road_direction = compileScript ["core\fnc\common\road_direction.sqf"];
    btc_fnc_findsafepos = compileScript ["core\fnc\common\findsafepos.sqf"];
    btc_fnc_find_closecity = compileScript ["core\fnc\common\find_closecity.sqf"];
    btc_fnc_delete = compileScript ["core\fnc\common\delete.sqf"];
    btc_fnc_deleteEntities = compileScript ["core\fnc\common\deleteEntities.sqf"];
    btc_fnc_final_phase = compileScript ["core\fnc\common\final_phase.sqf"];
    btc_fnc_findPosOutsideRock = compileScript ["core\fnc\common\findposoutsiderock.sqf"];
    btc_fnc_set_groupsOwner = compileScript ["core\fnc\common\set_groupsOwner.sqf"];
    btc_fnc_typeOf = compileScript ["core\fnc\common\typeOf.sqf"];
    btc_fnc_getVehProperties = compileScript ["core\fnc\common\getVehProperties.sqf"];
    btc_fnc_setVehProperties = compileScript ["core\fnc\common\setVehProperties.sqf"];
    btc_fnc_roof = compileScript ["core\fnc\common\roof.sqf"];

    //CHEM
    btc_fnc_chem_checkLoop = compileScript ["core\fnc\chem\checkLoop.sqf"];
    btc_fnc_chem_propagate = compileScript ["core\fnc\chem\propagate.sqf"];
    btc_fnc_chem_handleShower = compileScript ["core\fnc\chem\handleShower.sqf"];

    //SPECT
    btc_fnc_spect_checkLoop = compileScript ["core\fnc\spect\checkLoop.sqf"];
    btc_fnc_spect_electronicFailure = compileScript ["core\fnc\spect\electronicFailure.sqf"];

    //CITY
    btc_fnc_city_activate = compileScript ["core\fnc\city\activate.sqf"];
    btc_fnc_city_create = compileScript ["core\fnc\city\create.sqf"];
    btc_fnc_city_de_activate = compileScript ["core\fnc\city\de_activate.sqf"];
    btc_fnc_city_set_clear = compileScript ["core\fnc\city\set_clear.sqf"];
    btc_fnc_city_trigger_player_side = compileScript ["core\fnc\city\trigger_player_side.sqf"];
    btc_fnc_city_findPos = compileScript ["core\fnc\city\findPos.sqf"];
    btc_fnc_city_cleanUp = compileScript ["core\fnc\city\cleanUp.sqf"];
    btc_fnc_city_trigger_free_condition = compileScript ["core\fnc\city\trigger_free_condition.sqf"];
    btc_fnc_city_getHouses = compileScript ["core\fnc\city\getHouses.sqf"];

    //CIV
    btc_fnc_civ_add_weapons = compileScript ["core\fnc\civ\add_weapons.sqf"];
    btc_fnc_civ_add_grenade = compileScript ["core\fnc\civ\add_grenade.sqf"];
    btc_fnc_civ_get_weapons = compileScript ["core\fnc\civ\get_weapons.sqf"];
    btc_fnc_civ_get_grenade = compileScript ["core\fnc\civ\get_grenade.sqf"];
    btc_fnc_civ_populate = compileScript ["core\fnc\civ\populate.sqf"];
    btc_fnc_civ_create_patrol = compileScript ["core\fnc\civ\create_patrol.sqf"];
    btc_fnc_civ_evacuate = compileScript ["core\fnc\civ\evacuate.sqf"];
    btc_fnc_civ_createFlower = compileScript ["core\fnc\civ\createFlower.sqf"];

    //DATA
    btc_fnc_data_add_group = compileScript ["core\fnc\data\add_group.sqf"];
    btc_fnc_data_get_group = compileScript ["core\fnc\data\get_group.sqf"];
    btc_fnc_data_spawn_group = compileScript ["core\fnc\data\spawn_group.sqf"];

    //DB
    btc_fnc_db_save = compileScript ["core\fnc\db\save.sqf"];
    btc_fnc_db_delete = compileScript ["core\fnc\db\delete.sqf"];
    btc_fnc_db_loadObjectStatus = compileScript ["core\fnc\db\loadObjectStatus.sqf"];
    btc_fnc_db_saveObjectStatus = compileScript ["core\fnc\db\saveObjectStatus.sqf"];
    btc_fnc_db_loadCargo = compileScript ["core\fnc\db\loadcargo.sqf"];
    btc_fnc_db_autoRestart = compileScript ["core\fnc\db\autoRestart.sqf"];

    //DELAY
    btc_fnc_delay_createUnit = compileScript ["core\fnc\delay\createUnit.sqf"];
    btc_fnc_delay_createVehicle = compileScript ["core\fnc\delay\createVehicle.sqf"];
    btc_fnc_delay_createAgent = compileScript ["core\fnc\delay\createAgent.sqf"];
    btc_fnc_delay_exec = compileScript ["core\fnc\delay\exec.sqf"];

    //DOOR
    btc_fnc_door_lock = compileScript ["core\fnc\door\lock.sqf"];

    //EH
    btc_fnc_eh_server = compileScript ["core\fnc\eh\server.sqf"];

    //IED
    btc_fnc_ied_boom = compileScript ["core\fnc\ied\boom.sqf"];
    btc_fnc_ied_check = compileScript ["core\fnc\ied\check.sqf"];
    btc_fnc_ied_checkLoop = compileScript ["core\fnc\ied\checkLoop.sqf"];
    btc_fnc_ied_create = compileScript ["core\fnc\ied\create.sqf"];
    btc_fnc_ied_fired_near = compileScript ["core\fnc\ied\fired_near.sqf"];
    btc_fnc_ied_initArea = compileScript ["core\fnc\ied\initArea.sqf"];
    btc_fnc_ied_suicider_active = compileScript ["core\fnc\ied\suicider_active.sqf"];
    btc_fnc_ied_suicider_activeLoop = compileScript ["core\fnc\ied\suicider_activeLoop.sqf"];
    btc_fnc_ied_suicider_create = compileScript ["core\fnc\ied\suicider_create.sqf"];
    btc_fnc_ied_suiciderLoop = compileScript ["core\fnc\ied\suiciderLoop.sqf"];
    btc_fnc_ied_allahu_akbar = compileScript ["core\fnc\ied\allahu_akbar.sqf"];
    btc_fnc_ied_drone_active = compileScript ["core\fnc\ied\drone_active.sqf"];
    btc_fnc_ied_drone_create = compileScript ["core\fnc\ied\drone_create.sqf"];
    btc_fnc_ied_droneLoop = compileScript ["core\fnc\ied\droneLoop.sqf"];
    btc_fnc_ied_drone_fire = compileScript ["core\fnc\ied\drone_fire.sqf"];
    btc_fnc_ied_randomRoadPos = compileScript ["core\fnc\ied\randomRoadPos.sqf"];

    //INFO
    btc_fnc_info_cache = compileScript ["core\fnc\info\cache.sqf"];
    btc_fnc_info_give_intel = compileScript ["core\fnc\info\give_intel.sqf"];
    btc_fnc_info_has_intel = compileScript ["core\fnc\info\has_intel.sqf"];
    btc_fnc_info_hideout = compileScript ["core\fnc\info\hideout.sqf"];
    btc_fnc_info_cacheMarker = compileScript ["core\fnc\info\cacheMarker.sqf"];
    btc_fnc_info_path = compileScript ["core\fnc\info\path.sqf"];

    //FOB
    btc_fnc_fob_create_s = compileScript ["core\fnc\fob\create_s.sqf"];
    btc_fnc_fob_dismantle_s = compileScript ["core\fnc\fob\dismantle_s.sqf"];
    btc_fnc_fob_killed = compileScript ["core\fnc\fob\killed.sqf"];
    btc_fnc_fob_rallypointTimer = compileScript ["core\fnc\fob\rallypointTimer.sqf"];

    //MIL
    btc_fnc_mil_addWP = compileScript ["core\fnc\mil\addWP.sqf"];
    btc_fnc_mil_check_cap = compileScript ["core\fnc\mil\check_cap.sqf"];
    btc_fnc_mil_create_group = compileScript ["core\fnc\mil\create_group.sqf"];
    btc_fnc_mil_create_static = compileScript ["core\fnc\mil\create_static.sqf"];
    btc_fnc_mil_create_patrol = compileScript ["core\fnc\mil\create_patrol.sqf"];
    btc_fnc_mil_send = compileScript ["core\fnc\mil\send.sqf"];
    btc_fnc_mil_set_skill = compileScript ["core\fnc\mil\set_skill.sqf"];
    btc_fnc_mil_getStructures = compileScript ["core\fnc\mil\getStructures.sqf"];
    btc_fnc_mil_getBuilding = compileScript ["core\fnc\mil\getBuilding.sqf"];
    btc_fnc_mil_createVehicle = compileScript ["core\fnc\mil\createVehicle.sqf"];
    btc_fnc_mil_createUnits = compileScript ["core\fnc\mil\createUnits.sqf"];
    btc_fnc_mil_unit_killed = compileScript ["core\fnc\mil\unit_killed.sqf"];
    btc_fnc_mil_create_staticOnRoof = compileScript ["core\fnc\mil\create_staticOnRoof.sqf"];

    //HIDEOUT
    btc_fnc_hideout_hd = compileScript ["core\fnc\hideout\hd.sqf"];
    btc_fnc_hideout_create = compileScript ["core\fnc\hideout\create.sqf"];
    btc_fnc_hideout_create_composition = compileScript ["core\fnc\hideout\create_composition.sqf"];

    //PATROL
    btc_fnc_patrol_playersInAreaCityGroup = compileScript ["core\fnc\patrol\playersInAreaCityGroup.sqf"];
    btc_fnc_patrol_usefulCity = compileScript ["core\fnc\patrol\usefulCity.sqf"];
    btc_fnc_patrol_WPCheck = compileScript ["core\fnc\patrol\WPCheck.sqf"];
    btc_fnc_patrol_init = compileScript ["core\fnc\patrol\init.sqf"];
    btc_fnc_patrol_addWP = compileScript ["core\fnc\patrol\addWP.sqf"];
    btc_fnc_patrol_eh = compileScript ["core\fnc\patrol\eh.sqf"];
    btc_fnc_patrol_addEH = compileScript ["core\fnc\patrol\addEH.sqf"];

    //REP
    btc_fnc_rep_call_militia = compileScript ["core\fnc\rep\call_militia.sqf"];
    btc_fnc_rep_change = compileScript ["core\fnc\rep\change.sqf"];
    btc_fnc_rep_eh_effects = compileScript ["core\fnc\rep\eh_effects.sqf"];
    btc_fnc_rep_hh = compileScript ["core\fnc\rep\hh.sqf"];
    btc_fnc_rep_buildingchanged = compileScript ["core\fnc\rep\buildingchanged.sqf"];
    btc_fnc_rep_explosives_defuse = compileScript ["core\fnc\rep\explosives_defuse.sqf"];
    btc_fnc_rep_notify = compileScript ["core\fnc\rep\notify.sqf"];
    btc_fnc_rep_killed = compileScript ["core\fnc\rep\killed.sqf"];

    //SIDE
    btc_fnc_side_create = compileScript ["core\fnc\side\create.sqf"];
    btc_fnc_side_get_city = compileScript ["core\fnc\side\get_city.sqf"];
    btc_fnc_side_mines = compileScript ["core\fnc\side\mines.sqf"];
    btc_fnc_side_supply = compileScript ["core\fnc\side\supply.sqf"];
    btc_fnc_side_vehicle = compileScript ["core\fnc\side\vehicle.sqf"];
    btc_fnc_side_civtreatment = compileScript ["core\fnc\side\civtreatment.sqf"];
    btc_fnc_side_tower = compileScript ["core\fnc\side\tower.sqf"];
    btc_fnc_side_checkpoint = compileScript ["core\fnc\side\checkpoint.sqf"];
    btc_fnc_side_civtreatment_boat = compileScript ["core\fnc\side\civtreatment_boat.sqf"];
    btc_fnc_side_underwater_generator= compileScript ["core\fnc\side\underwater_generator.sqf"];
    btc_fnc_side_convoy = compileScript ["core\fnc\side\convoy.sqf"];
    btc_fnc_side_rescue = compileScript ["core\fnc\side\rescue.sqf"];
    btc_fnc_side_capture_officer = compileScript ["core\fnc\side\capture_officer.sqf"];
    btc_fnc_side_hostage = compileScript ["core\fnc\side\hostage.sqf"];
    btc_fnc_side_hack = compileScript ["core\fnc\side\hack.sqf"];
    btc_fnc_side_kill = compileScript ["core\fnc\side\kill.sqf"];
    btc_fnc_side_chemicalLeak = compileScript ["core\fnc\side\chemicalLeak.sqf"];
    btc_fnc_side_EMP = compileScript ["core\fnc\side\EMP.sqf"];
    btc_fnc_side_removeRubbish = compileScript ["core\fnc\side\removeRubbish.sqf"];

    //TAG
    btc_fnc_tag_initArea = compileScript ["core\fnc\tag\initArea.sqf"];
    btc_fnc_tag_eh = compileScript ["core\fnc\tag\eh.sqf"];
    btc_fnc_tag_create = compileScript ["core\fnc\tag\create.sqf"];

    //LOG
    btc_fnc_log_createVehicle = compileScript ["core\fnc\log\createVehicle.sqf"];
    btc_fnc_log_getRearmMagazines = compileScript ["core\fnc\log\getRearmMagazines.sqf"];
    btc_fnc_log_init = compileScript ["core\fnc\log\init.sqf"];
    btc_fnc_log_setCargo = compileScript ["core\fnc\log\setCargo.sqf"];
    btc_fnc_log_server_delete = compileScript ["core\fnc\log\server_delete.sqf"];
    btc_fnc_log_create_s = compileScript ["core\fnc\log\create_s.sqf"];
    btc_fnc_log_get_cc = compileScript ["core\fnc\log\get_cc.sqf"];
    btc_fnc_log_get_rc = compileScript ["core\fnc\log\get_rc.sqf"];
    btc_fnc_log_server_repair_wreck = compileScript ["core\fnc\log\server_repair_wreck.sqf"];

    //DEAF
    btc_fnc_deaf_earringing = compileScript ["core\fnc\deaf\earringing.sqf"];

    //TASK
    btc_fnc_task_create = compileScript ["core\fnc\task\create.sqf"];
    btc_fnc_task_setState = compileScript ["core\fnc\task\setState.sqf"];

    //TOW
    btc_fnc_tow_ropeBreak = compileScript ["core\fnc\tow\ropeBreak.sqf"];
    btc_fnc_tow_ViV = compileScript ["core\fnc\tow\ViV.sqf"];

    //VEH
    btc_fnc_veh_addRespawn = compileScript ["core\fnc\veh\addRespawn.sqf"];
    btc_fnc_veh_killed = compileScript ["core\fnc\veh\killed.sqf"];
    btc_fnc_veh_respawn = compileScript ["core\fnc\veh\respawn.sqf"];
};

/////////////////////CLIENT AND SERVER\\\\\\\\\\\\\\\\\\\\\

//CACHE
btc_fnc_cache_hd = compileScript ["core\fnc\cache\hd.sqf"];

//COMMON
btc_fnc_find_veh_with_turret = compileScript ["core\fnc\common\find_veh_with_turret.sqf"];
btc_fnc_get_class = compileScript ["core\fnc\common\get_class.sqf"];
btc_fnc_randomize_pos = compileScript ["core\fnc\common\randomize_pos.sqf"];
btc_fnc_getHouses = compileScript ["core\fnc\common\getHouses.sqf"];
btc_fnc_house_addWP_loop = compileScript ["core\fnc\common\house_addWP_loop.sqf"];

//CHEM
btc_fnc_chem_damage = compileScript ["core\fnc\chem\damage.sqf"];
btc_fnc_chem_deconShowerAnimLarge = {(_this select 0) setVariable ["BIN_Shower_Stop",false]; _this call BIN_fnc_deconShowerAnimLarge;};

//DEBUG
btc_fnc_debug_message = compileScript ["core\fnc\debug\message.sqf"];

//DB
btc_fnc_db_add_veh = compileScript ["core\fnc\db\add_veh.sqf"];

//EH
btc_fnc_eh_trackItem = compileScript ["core\fnc\eh\trackItem.sqf"];

//CIV
btc_fnc_civ_class = compileScript ["core\fnc\civ\class.sqf"];
btc_fnc_civ_addWP = compileScript ["core\fnc\civ\addWP.sqf"];

//IED
btc_fnc_ied_belt = compileScript ["core\fnc\ied\belt.sqf"];

//INT
btc_fnc_int_orders_give = compileScript ["core\fnc\int\orders_give.sqf"];
btc_fnc_int_orders_behaviour = compileScript ["core\fnc\int\orders_behaviour.sqf"];
btc_fnc_int_ask_var = compileScript ["core\fnc\int\ask_var.sqf"];

//LOG
btc_fnc_log_place_destroy_camera = compileScript ["core\fnc\log\place_destroy_camera.sqf"];

//MIL
btc_fnc_mil_class = compileScript ["core\fnc\mil\class.sqf"];
btc_fnc_mil_ammoUsage = compileScript ["core\fnc\mil\ammoUsage.sqf"];

//PATROL
btc_fnc_patrol_disabled = compileScript ["core\fnc\patrol\disabled.sqf"];

//REP
btc_fnc_rep_hd = compileScript ["core\fnc\rep\hd.sqf"];
btc_fnc_rep_suppressed = compileScript ["core\fnc\rep\suppressed.sqf"];

//ARSENAL
btc_fnc_arsenal_ammoUsage = compileScript ["core\fnc\arsenal\ammoUsage.sqf"];

/////////////////////CLIENT\\\\\\\\\\\\\\\\\\\\\
if (!isDedicated) then {
    //COMMON
    btc_fnc_end_mission = compileScript ["core\fnc\common\end_mission.sqf"];
    btc_fnc_get_cardinal = compileScript ["core\fnc\common\get_cardinal.sqf"];
    btc_fnc_show_hint = compileScript ["core\fnc\common\show_hint.sqf"];
    btc_fnc_intro = compileScript ["core\fnc\common\intro.sqf"];
    btc_fnc_set_markerTextLocal = compileScript ["core\fnc\common\set_markerTextLocal.sqf"];
    btc_fnc_showSubtitle = compileScript ["core\fnc\common\showSubtitle.sqf"];
    btc_fnc_get_composition = compileScript ["core\fnc\common\get_composition.sqf"];
    btc_fnc_checkArea = compileScript ["core\fnc\common\checkArea.sqf"];
    btc_fnc_typeOfPreview = compileScript ["core\fnc\common\typeOfPreview.sqf"];

    //CHEM
    btc_fnc_chem_biopsy = compileScript ["core\fnc\chem\biopsy.sqf"];
    btc_fnc_chem_damageLoop = compileScript ["core\fnc\chem\damageLoop.sqf"];
    btc_fnc_chem_ehDetector = compileScript ["core\fnc\chem\ehDetector.sqf"];
    btc_fnc_chem_updateDetector = compileScript ["core\fnc\chem\updateDetector.sqf"];

    //DEBUG
    btc_fnc_debug_marker = compileScript ["core\fnc\debug\marker.sqf"];
    btc_fnc_debug_units = compileScript ["core\fnc\debug\units.sqf"];
    btc_fnc_debug_fps = compileScript ["core\fnc\debug\fps.sqf"];
    btc_fnc_debug_graph = compileScript ["core\fnc\debug\graph.sqf"];

    //CIV
    btc_fnc_civ_add_leaflets = compileScript ["core\fnc\civ\add_leaflets.sqf"];
    btc_fnc_civ_leaflets = compileScript ["core\fnc\civ\leaflets.sqf"];

    //DOOR
    btc_fnc_door_break = compileScript ["core\fnc\door\break.sqf"];
    btc_fnc_door_broke = compileScript ["core\fnc\door\broke.sqf"];

    //IED
    btc_fnc_ied_effects = compileScript ["core\fnc\ied\effects.sqf"];
    btc_fnc_ied_effect_smoke = compileScript ["core\fnc\ied\effect_smoke.sqf"];
    btc_fnc_ied_effect_color_smoke = compileScript ["core\fnc\ied\effect_color_smoke.sqf"];
    btc_fnc_ied_effect_rocks = compileScript ["core\fnc\ied\effect_rocks.sqf"];
    btc_fnc_ied_effect_blurEffect = compileScript ["core\fnc\ied\effect_blurEffect.sqf"];
    btc_fnc_ied_effect_shock_wave = compileScript ["core\fnc\ied\effect_shock_wave.sqf"];
    btc_fnc_ied_deleteLoop = compileScript ["core\fnc\ied\deleteLoop.sqf"];

    //EH
    btc_fnc_eh_CuratorObjectPlaced = compileScript ["core\fnc\eh\CuratorObjectPlaced.sqf"];
    btc_fnc_eh_player = compileScript ["core\fnc\eh\player.sqf"];

    //FOB
    btc_fnc_fob_create = compileScript ["core\fnc\fob\create.sqf"];
    btc_fnc_fob_rallypointAssemble = compileScript ["core\fnc\fob\rallypointAssemble.sqf"];
    btc_fnc_fob_redeploy = compileScript ["core\fnc\fob\redeploy.sqf"];
    btc_fnc_fob_redeployCheck = compileScript ["core\fnc\fob\redeployCheck.sqf"];

    //INT
    btc_fnc_int_add_actions = compileScript ["core\fnc\int\add_actions.sqf"];
    btc_fnc_int_orders = compileScript ["core\fnc\int\orders.sqf"];
    btc_fnc_int_shortcuts = compileScript ["core\fnc\int\shortcuts.sqf"];
    btc_fnc_int_terminal = compileScript ["core\fnc\int\terminal.sqf"];

    //INFO
    btc_fnc_info_ask = compileScript ["core\fnc\info\ask.sqf"];
    btc_fnc_info_hideout_asked = compileScript ["core\fnc\info\hideout_asked.sqf"];
    btc_fnc_info_search_for_intel = compileScript ["core\fnc\info\search_for_intel.sqf"];
    btc_fnc_info_troops = compileScript ["core\fnc\info\troops.sqf"];
    btc_fnc_info_ask_reputation = compileScript ["core\fnc\info\ask_reputation.sqf"];
    btc_fnc_info_cachePicture = compileScript ["core\fnc\info\cachePicture.sqf"];

    //LIFT
    btc_fnc_lift_check = compileScript ["core\fnc\lift\check.sqf"];
    btc_fnc_lift_deployRopes = compileScript ["core\fnc\lift\deployRopes.sqf"];
    btc_fnc_lift_destroyRopes = compileScript ["core\fnc\lift\destroyRopes.sqf"];
    btc_fnc_lift_hook = compileScript ["core\fnc\lift\hook.sqf"];
    btc_fnc_lift_hookFake = compileScript ["core\fnc\lift\hookFake.sqf"];
    btc_fnc_lift_hud = compileScript ["core\fnc\lift\hud.sqf"];
    btc_fnc_lift_hudLoop = compileScript ["core\fnc\lift\hudLoop.sqf"];

    //LOG
    btc_fnc_log_get_corner_points = compileScript ["core\fnc\log\get_corner_points.sqf"];
    btc_fnc_log_delete = compileScript ["core\fnc\log\delete.sqf"];
    btc_fnc_log_create = compileScript ["core\fnc\log\create.sqf"];
    btc_fnc_log_create_apply = compileScript ["core\fnc\log\create_apply.sqf"];
    btc_fnc_log_create_load = compileScript ["core\fnc\log\create_load.sqf"];
    btc_fnc_log_create_change_target = compileScript ["core\fnc\log\create_change_target.sqf"];
    btc_fnc_log_place_create_camera = compileScript ["core\fnc\log\place_create_camera.sqf"];
    btc_fnc_log_place = compileScript ["core\fnc\log\place.sqf"];
    btc_fnc_log_place_key_down = compileScript ["core\fnc\log\place_key_down.sqf"];
    btc_fnc_log_repair_wreck = compileScript ["core\fnc\log\repair_wreck.sqf"];
    btc_fnc_log_copy = compileScript ["core\fnc\log\copy.sqf"];
    btc_fnc_log_paste = compileScript ["core\fnc\log\paste.sqf"];
    btc_fnc_log_refuelSource = compileScript ["core\fnc\log\refuelSource.sqf"];

    //REP
    btc_fnc_rep_treatment = compileScript ["core\fnc\rep\treatment.sqf"];

    //SPECT
    btc_fnc_spect_updateDevice = compileScript ["core\fnc\spect\updateDevice.sqf"];
    btc_fnc_spect_frequencies = compileScript ["core\fnc\spect\frequencies.sqf"];
    btc_fnc_spect_disableDevice = compileScript ["core\fnc\spect\disableDevice.sqf"];

    //ARSENAL
    btc_fnc_arsenal_data = compileScript ["core\fnc\arsenal\data.sqf"];
    btc_fnc_arsenal_garage = compileScript ["core\fnc\arsenal\garage.sqf"];
    btc_fnc_arsenal_loadout = compileScript ["core\fnc\arsenal\loadout.sqf"];
    btc_fnc_arsenal_trait = compileScript ["core\fnc\arsenal\trait.sqf"];
    btc_fnc_arsenal_ammoUsage = compileScript ["core\fnc\arsenal\ammoUsage.sqf"];
    btc_fnc_arsenal_weaponsFilter = compileScript ["core\fnc\arsenal\weaponsfilter.sqf"];

    //TASK
    btc_fnc_task_setDescription = compileScript ["core\fnc\task\setDescription.sqf"];
    btc_fnc_task_abort = compileScript ["core\fnc\task\abort.sqf"];

    //TOW
    btc_fnc_tow_ropeCreate = compileScript ["core\fnc\tow\ropeCreate.sqf"];
    btc_fnc_tow_hitch_points = compileScript ["core\fnc\tow\hitch_points.sqf"];
    btc_fnc_tow_unhook = compileScript ["core\fnc\tow\unhook.sqf"];
    btc_fnc_tow_check = compileScript ["core\fnc\tow\check.sqf"];
};

/////////////////////HEADLESS\\\\\\\\\\\\\\\\\\\\\
if (!hasInterface && !isDedicated) then {
    btc_fnc_eh_headless = compileScript ["core\fnc\eh\headless.sqf"];
};
