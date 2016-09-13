
private ["_action"];

//Database
//_action = ["Database","Database","",{},{serverCommandAvailable "#logout"}] call ace_interact_menu_fnc_createAction;
_action = ["Database","Database","",{},{serverCommandAvailable "#logout" || !isMultiplayer}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["request_save","Save",'\A3\ui_f\data\igui\cfg\simpleTasks\types\download_ca.paa',{call btc_fnc_db_request_save;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","Database"], _action] call ace_interact_menu_fnc_addActionToObject;
_action = ["request_delete","Delete",'\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa',{call btc_fnc_db_request_delete;},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","Database"], _action] call ace_interact_menu_fnc_addActionToObject;

//Intel
_action = ["Search_intel", "Search for intel", '\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa', {(_this select 0) spawn btc_fnc_info_search_for_intel;}, {!Alive (_this select 0)}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach (btc_type_units + btc_type_divers);
_action = ["Interrogate_intel", "Interrogate", '\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa', {[(_this select 0),true] spawn btc_fnc_info_ask;}, {(Alive (_this select 0) && {[(_this select 0)] call ace_common_fnc_isAwake} && captive (_this select 0))}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach (btc_type_units + btc_type_divers);

//IEDs
_action = ["Check_IED", "Check for IED", '\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa', {(_this select 0) spawn btc_fnc_ied_check_for;}, {true}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach btc_type_ieds;
_action = ["Disarm_IED", "Disarm IED", '\z\ace\addons\disarming\UI\disarm_ca.paa', {(_this select 0) spawn btc_fnc_ied_disarm;}, {((_this select 0) getVariable ["active",false] && {"ACE_DefusalKit" in items player})}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach btc_type_ieds;

//Log point
_action = ["Logistic","Logistic",'\A3\ui_f\data\igui\cfg\simpleTasks\letters\L_ca.paa',{},{true}] call ace_interact_menu_fnc_createAction;
[btc_create_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
_action = ["Require_object", "Require object", '\A3\ui_f\data\igui\cfg\simpleTasks\types\rearm_ca.paa', {[btc_create_object_point] spawn btc_fnc_log_create}, {true}, {}, [], [0,0,0.4], 5] call ace_interact_menu_fnc_createAction;
[btc_create_object, 0, ["ACE_MainActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToObject;
_action = ["Repair_wreck", "Repair wreck", '\A3\ui_f\data\igui\cfg\simpleTasks\types\repair_ca.paa', {[btc_create_object_point] spawn btc_fnc_log_repair_wreck}, {true}, {}, [], [0,0,0], 5] call ace_interact_menu_fnc_createAction;
[btc_create_object, 0, ["ACE_MainActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToObject;

//Logistic
_action = ["Logistic","Logistic","",{},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;
{[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach btc_log_def_loadable;
_action = ["Load_in", "Load in", "", {(_this select 0) call btc_fnc_log_select;}, {true}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach btc_log_def_loadable;
_action = ["Load_selected", "Load selected", "", {(_this select 0) spawn btc_fnc_log_load;}, {!isNull btc_log_object_selected && {btc_log_object_selected distance (_this select 0) <= btc_log_max_distance_load}}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach btc_log_def_can_load;
_action = ["check_cargo", "Check cargo", '\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa', {(_this select 0) spawn btc_fnc_log_check_cargo;}, {true}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach btc_log_def_can_load;
_action = ["Mount_FOB", "Mount FOB", "\A3\Ui_f\data\Map\Markers\NATO\b_hq.paa", {(_this select 0) spawn btc_fnc_fob_create}, {true}] call ace_interact_menu_fnc_createAction;
[btc_fob_mat, 0, ["ACE_MainActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToClass;
_action = ["Dismantle_FOB", "Dismantle FOB", "", {(_this select 0) spawn btc_fnc_fob_dismantle}, {true},{},[], [0,0,-2], 5] call ace_interact_menu_fnc_createAction;
[btc_fob_flag, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;
_action = ["Place", "Place", "", {(_this select 0) spawn btc_fnc_log_place}, {!btc_log_placing}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach btc_log_def_placeable;

_action = ["check_cargo","Check cargo",'\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa',{(vehicle player) spawn btc_fnc_log_check_cargo;},{!(vehicle player isEqualto player)}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToObject;

//Lift
_action = ["Lift","Lift",'\A3\ui_f\data\igui\cfg\simpleTasks\letters\L_ca.paa',{},{(typeOf vehicle player) isKindOf "Helicopter"}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["Deploy_ropes","Deploy ropes",'\A3\Structures_F_Heli\VR\Helpers\Data\VR_Symbol_Heli_Slingloading_CA.paa',{[] spawn btc_fnc_log_lift_deploy_ropes;},{!btc_ropes_deployed && {((driver vehicle player) isEqualTo player)} && {(getposATL player) select 2 > 4}}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","Lift"], _action] call ace_interact_menu_fnc_addActionToObject;
_action = ["Cut_ropes","Cut ropes","",{[] spawn btc_fnc_log_lift_destroy_ropes;},{btc_ropes_deployed && {((driver vehicle player) isEqualTo player)}}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","Lift"], _action] call ace_interact_menu_fnc_addActionToObject;

//Orders
_action = ["Civil_Orders","Civil Orders",'\A3\ui_f\data\igui\cfg\simpleTasks\types\meet_ca.paa',{},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["Civil_Stop","Stop","",{[1] call btc_fnc_int_orders;},{(vehicle player isEqualTo player)}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","Civil_Orders"], _action] call ace_interact_menu_fnc_addActionToObject;
_action = ["Civil_Get_down","Get down","",{[2] call btc_fnc_int_orders;},{(vehicle player isEqualTo player)}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","Civil_Orders"], _action] call ace_interact_menu_fnc_addActionToObject;
_action = ["Civil_Go_away","Go away","",{[3] call btc_fnc_int_orders;},{(vehicle player isEqualTo player)}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions","Civil_Orders"], _action] call ace_interact_menu_fnc_addActionToObject;


_action = ["Civil_Orders","Civil Orders",'\A3\ui_f\data\igui\cfg\simpleTasks\types\meet_ca.paa',{},{true}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach btc_civ_type_units;
_action = ["Civil_Stop", "Stop", "", {[1,(_this select 0)] call btc_fnc_int_orders;}, {Alive (_this select 0)}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions","Civil_Orders"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach btc_civ_type_units;
_action = ["Civil_Get_down", "Get down", "", {[2,(_this select 0)] call btc_fnc_int_orders;}, {Alive (_this select 0)}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions","Civil_Orders"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach btc_civ_type_units;
_action = ["Civil_taxi", "Taxi", "", {[4,(_this select 0)] spawn btc_fnc_int_orders;}, {((Alive (_this select 0)) && !((vehicle (_this select 0)) isEqualTo (_this select 0)))}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions","Civil_Orders"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach btc_civ_type_units;
_action = ["Civil_Go_away", "Go away", "", {[3,(_this select 0)] call btc_fnc_int_orders;}, {Alive (_this select 0)}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions","Civil_Orders"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach btc_civ_type_units;
_action = ["Ask_Info", "Ask info", "", {[(_this select 0),false] spawn btc_fnc_info_ask;}, {Alive (_this select 0) && {[(_this select 0)] call ace_common_fnc_isAwake} && {side (_this select 0) isEqualTo civilian}}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach btc_civ_type_units;
_action = ["Ask_Reputation", "Ask Reputation", "", {[(_this select 0)] spawn btc_fnc_info_ask_reputation;}, {Alive (_this select 0) && {[(_this select 0)] call ace_common_fnc_isAwake} && {side (_this select 0) isEqualTo civilian}}] call ace_interact_menu_fnc_createAction;
{[_x, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;} foreach btc_civ_type_units;

//Re-deploy
_action = ["fob_redeploy", "Re-deploy", '\A3\ui_f\data\igui\cfg\simpleTasks\types\run_ca.paa', {[] spawn btc_fnc_fob_redeploy}, {btc_p_redeploy}, {}, [], [0.4,0,0.4], 5] call ace_interact_menu_fnc_createAction;
[btc_gear_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//Side missions
_action = ["side_mission","Side mission",'\A3\ui_f\data\igui\cfg\simpleTasks\types\whiteboard_ca.paa',{},{!(isNil {player getVariable "side_mission"})}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["side_mission","Abort",'\A3\ui_f\data\igui\cfg\simpleTasks\types\exit_ca.paa',{[] call btc_fnc_side_abort},{!(isNil {player getVariable "side_mission"}) && {btc_side_assigned}}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "side_mission"], _action] call ace_interact_menu_fnc_addActionToObject;
_action = ["side_mission","Request",'\A3\ui_f\data\igui\cfg\simpleTasks\types\default_ca.paa',{[] spawn btc_fnc_side_request},{!(isNil {player getVariable "side_mission"}) && {!btc_side_assigned}}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions", "side_mission"], _action] call ace_interact_menu_fnc_addActionToObject;