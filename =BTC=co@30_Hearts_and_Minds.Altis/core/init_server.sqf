call compile preprocessFile "core\fnc\city\init.sqf";

if (btc_db_load && {profileNamespace getVariable [format ["btc_hm_%1_db",worldName],false]}) then {
	if (btc_version isEqualTo (profileNamespace getVariable [format ["btc_hm_%1_version",worldName],1.13])) then	{
		call compile preprocessFile "core\fnc\db\load.sqf";
	} else {
		call compile preprocessFile "core\fnc\db\load_old.sqf";
	};
} else {
	for "_i" from 1 to btc_hideout_n do {[] call btc_fnc_mil_create_hideout;};

	setTimeMultiplier btc_p_acctime;

	[] execVM "core\fnc\cache\init.sqf";

	[] spawn {
		{
			waitUntil {!isNull _x};
			if (isNumber (configfile >> "CfgVehicles" >> typeof _x >> "ace_fastroping_enabled")) then {[_x] call ace_fastroping_fnc_equipFRIES};
			_x addMPEventHandler ["MPKilled", {if (isServer) then {_this call btc_fnc_eh_veh_killed};}];
		} foreach btc_vehicles;
	};
};

["Initialize"] call BIS_fnc_dynamicGroups;

{[_x,30,false] spawn btc_fnc_eh_veh_add_respawn;} forEach btc_helo;