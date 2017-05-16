
if !(isServer) exitWith {
	_this remoteExec ["btc_fnc_db_add_veh", 2];
};

btc_vehicles pushBackUnique _this;
_this addMPEventHandler ["MPKilled", {if (isServer) then {_this call btc_fnc_eh_veh_killed};}];
if ((isNumber (configfile >> "CfgVehicles" >> typeof _this >> "ace_fastroping_enabled")) && !(typeof _this isEqualTo "RHS_UH1Y_d")) then {[_this] call ace_fastroping_fnc_equipFRIES};