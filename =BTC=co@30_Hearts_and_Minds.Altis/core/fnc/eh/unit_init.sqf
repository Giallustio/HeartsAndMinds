
private ["_unit","_type","_action"];

_unit = _this select 0;

_type = typeOf _unit;

diag_log format ["UNIT INIT : %1",[_this,side (_this select 0), _type]];

switch true do {
	case (side _unit != west && side _unit != civilian) : {

		if (isServer) then {_unit call btc_fnc_mil_unit_create;};

		if (!isDedicated) then {
			if (isNil "btc_actions_units") then {btc_actions_units = [];};
			if !(_type in btc_actions_units) then {
				btc_actions_units pushBack _type;

				_action = ["Search_intel", "Search for intel", "\A3\ui_f\data\igui\cfg\simpleTasks\types\search_ca.pa", {(_this select 0) spawn btc_fnc_info_search_for_intel;}, {!Alive (_this select 0)}] call ace_interact_menu_fnc_createAction;
				[_type, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;
			};
		};
	};
	case (side _unit isEqualTo civilian) : {

		if (isServer) then {_unit call btc_fnc_civ_unit_create;};

		if (!isDedicated) then {
			if (isNil "btc_actions_units") then {btc_actions_units = [];};
			if !(_type in btc_actions_units) then {
				btc_actions_units pushBack _type;

				sleep 1;
				_action = ["Civil_Orders","Civil Orders","\A3\ui_f\data\igui\cfg\simpleTasks\types\meet_ca.paa",{},{true}] call ace_interact_menu_fnc_createAction;
				[_type, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;
				_action = ["Civil_Stop", "Stop", "", {[1,(_this select 0)] call btc_fnc_int_orders;}, {Alive (_this select 0)}] call ace_interact_menu_fnc_createAction;
				[_type, 0, ["ACE_MainActions","Civil_Orders"], _action] call ace_interact_menu_fnc_addActionToClass;
				_action = ["Civil_Get_down", "Get down", "\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa", {[2,(_this select 0)] call btc_fnc_int_orders;}, {Alive (_this select 0)}] call ace_interact_menu_fnc_createAction;
				[_type, 0, ["ACE_MainActions","Civil_Orders"], _action] call ace_interact_menu_fnc_addActionToClass;
				_action = ["Civil_Go_away", "Go away", "\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa", {[3,(_this select 0)] call btc_fnc_int_orders;}, {Alive (_this select 0)}] call ace_interact_menu_fnc_createAction;
				[_type, 0, ["ACE_MainActions","Civil_Orders"], _action] call ace_interact_menu_fnc_addActionToClass;
				_action = ["Ask_Info", "Ask info", "\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa", {[(_this select 0), false] spawn btc_fnc_info_ask;}, {Alive (_this select 0) && {side (_this select 0) isEqualTo civilian}}] call ace_interact_menu_fnc_createAction;
				[_type, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;
			};
		};
	};
};