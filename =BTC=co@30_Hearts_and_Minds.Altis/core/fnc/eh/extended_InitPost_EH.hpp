class Extended_InitPost_EventHandlers {
    class LandVehicle {
        class btc_actions {
            init = "[typeof (_this select 0)] call btc_fnc_eh_veh_init";
        };
    };
    class Air {
        class btc_actions {
            init = "[typeof (_this select 0)] call btc_fnc_eh_veh_init";
        };
    };
    class Ship {
        class btc_actions {
            init = "[typeof (_this select 0)] call btc_fnc_eh_veh_init";
        };
    };
    class CAManBase {
        class btc_remove_action {
            init = "if (side(_this select 0) isEqualTo civilian) then {[_this select 0] call btc_fnc_eh_civ_removeAction};";
        };
    };
	/*class CAManBase {
		class btc_actions {
			init = "_this call btc_fnc_eh_unit_init";
		};
	};*/
};
