call compile preprocessFile "core\fnc\city\init.sqf";

if (btc_db_load && {profileNamespace getVariable [format ["btc_hm_%1_db",worldName],false]}) then {
	call compile preprocessFile "core\fnc\db\load.sqf";
} else {
	for "_i" from 1 to btc_hideout_n do {[] call btc_fnc_mil_create_hideout;};

	setTimeMultiplier btc_p_acctime;

	[] execVM "core\fnc\cache\init.sqf";

	[] spawn {{waitUntil {!isNull _x};_x addMPEventHandler ["MPKilled", {if (isServer) then {_this call btc_fnc_eh_veh_killed};}];} foreach btc_vehicles;};
};

{[_x,30,false] spawn btc_fnc_eh_veh_add_respawn;} forEach btc_helo;