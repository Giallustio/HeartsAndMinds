[] call compile preprocessFileLineNumbers "core\fnc\city\init.sqf";

{[_x] spawn btc_fnc_task_create} forEach [0, 1];

if (btc_db_load && {profileNamespace getVariable [format ["btc_hm_%1_db", worldName], false]}) then {
    if (btc_version isEqualTo (profileNamespace getVariable [format ["btc_hm_%1_version", worldName], 1.13])) then {
        [] call compile preprocessFileLineNumbers "core\fnc\db\load.sqf";
    } else {
        [] call compile preprocessFileLineNumbers "core\fnc\db\load_old.sqf";
    };
} else {
    for "_i" from 1 to btc_hideout_n do {[] call btc_fnc_mil_create_hideout;};
    [] call compile preprocessFileLineNumbers "core\fnc\cache\init.sqf";

    private _date = date;
    _date set [3, btc_p_time];
    setDate _date;

    {
        [{!isNull _this}, {_this call btc_fnc_db_add_veh;}, _x] call CBA_fnc_waitUntilAndExecute;
    } forEach btc_vehicles;
};

[] call btc_fnc_db_autosave;
[] call btc_fnc_eh_server;
[btc_ied_list] call btc_fnc_ied_fired_near;

["Initialize"] call BIS_fnc_dynamicGroups;

setTimeMultiplier btc_p_acctime;

{[_x, 30, false] call btc_fnc_eh_veh_add_respawn;} forEach btc_helo;

if (btc_p_side_mission_cycle) then {
    [true] spawn btc_fnc_side_create;
};
