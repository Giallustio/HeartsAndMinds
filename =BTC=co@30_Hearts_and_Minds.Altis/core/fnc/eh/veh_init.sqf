
private ["_veh","_type","_action"];

_veh = _this select 0;

_type = typeOf _veh;

switch true do {
	case (_type isKindOf "LandVehicle") : {
		if (isNil "btc_actions_veh") then {btc_actions_veh = [];};

		if !(_type in btc_actions_veh) then {
			private ["_action"];
			btc_actions_veh pushBack _type;
			_action = ["Logistic","Logistic","\A3\ui_f\data\igui\cfg\simpleTasks\letters\L_ca.paa",{},{true}] call ace_interact_menu_fnc_createAction;
			[_type, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;
			_action = ["log_tow", "Tow", "\z\ace\addons\attach\UI\attach_ca.paa", {(_this select 0) spawn btc_fnc_log_tow;}, {!isNull btc_log_vehicle_selected && {btc_log_vehicle_selected != (_this select 0)} && {[(_this select 0),btc_log_vehicle_selected] call btc_fnc_log_can_tow}}] call ace_interact_menu_fnc_createAction;
			[_type, 0, ["ACE_MainActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToClass;
			_action = ["log_hook", "Hook", "\z\ace\addons\attach\UI\attach_ca.paa", {(_this select 0) spawn btc_fnc_log_hook;}, {true}] call ace_interact_menu_fnc_createAction;
			[_type, 0, ["ACE_MainActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToClass;
			_action = ["log_hook", "Unhook", "\z\ace\addons\attach\UI\detach_ca.paa", {(_this select 0) spawn btc_fnc_log_unhook;}, {true}] call ace_interact_menu_fnc_createAction;
			[_type, 0, ["ACE_MainActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToClass;
			//Cargo
			_action = ["check_cargo", "Check Cargo", "\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa", {(_this select 0) spawn btc_fnc_log_check_cargo;}, {true}] call ace_interact_menu_fnc_createAction;
			[_type, 0, ["ACE_MainActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToClass;
			_action = ["Load_selected", "Load selected", "", {(_this select 0) spawn btc_fnc_log_load;}, {!isNull btc_log_object_selected && {btc_log_object_selected distance (_this select 0) <= btc_log_max_distance_load}}] call ace_interact_menu_fnc_createAction;
			[_type, 0, ["ACE_MainActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToClass;
		};
	};
	case (_type isKindOf "Helicopter") : {
		if (isNil "btc_actions_veh") then {btc_actions_veh = [];};

		if !(_type in btc_actions_veh) then {
			private ["_action"];
			btc_actions_veh pushBack _type;
			_action = ["Logistic","Logistic","\A3\ui_f\data\igui\cfg\simpleTasks\letters\L_ca.paa",{},{true}] call ace_interact_menu_fnc_createAction;
			[_type, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;
			//Cargo
			_action = ["check_cargo", "Check Cargo", "\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.paa", {(_this select 0) spawn btc_fnc_log_check_cargo;}, {true}] call ace_interact_menu_fnc_createAction;
			[_type, 0, ["ACE_MainActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToClass;
			_action = ["Load_selected", "Load selected", "", {(_this select 0) spawn btc_fnc_log_load;}, {!isNull btc_log_object_selected && {btc_log_object_selected distance (_this select 0) <= btc_log_max_distance_load}}] call ace_interact_menu_fnc_createAction;
			[_type, 0, ["ACE_MainActions","Logistic"], _action] call ace_interact_menu_fnc_addActionToClass;
		};
	};
};