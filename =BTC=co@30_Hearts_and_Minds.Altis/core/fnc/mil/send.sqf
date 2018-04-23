/*
    Send a group of units to a location then call btc_fnc_data_add_group. If player is around, initiate patrol around the destination, ifnot save in database and delete units.
*/
params ["_start", "_dest", "_typeOf_patrol", ["_veh_type", ""]];

private _pos = getPos _start;

private _group = grpNull;
switch (_typeOf_patrol) do {
    case 0 : {
        _group = ([_pos, 150, 3 + random 6, 1] call btc_fnc_mil_create_group) select 0;
        _group setVariable ["no_cache", true];
        while {!((waypoints _group) isEqualTo [])} do {deleteWaypoint ((waypoints _group) select 0);};

        private _wp_0 = _group addWaypoint [_dest, 60];
        private _wp = _group addWaypoint [_dest, 60];
        _wp setWaypointType "MOVE";
        _wp setWaypointCombatMode "RED";
        _wp setWaypointBehaviour "AWARE";
        _wp setWaypointSpeed "FULL";
        _wp setWaypointFormation "COLUMN";
        _wp setWaypointStatements ["true", "(group this) spawn btc_fnc_data_add_group;"];
    };
    case 1 : {
        _group = createGroup [btc_enemy_side, true];
        _group setVariable ["no_cache", true];

        if (_veh_type isEqualTo "") then {_veh_type = selectRandom btc_type_motorized};

        private _return_pos = [_pos, 10, 500, 13, false] call btc_fnc_findsafepos;

        private _veh = createVehicle [_veh_type, _return_pos, [], 0, "FLY"];
        [_veh, _group, false, "", btc_type_crewmen] call BIS_fnc_spawnCrew;
        private _cargo = (_veh emptyPositions "cargo") - 1;
        for "_i" from 0 to _cargo do {
            (selectRandom btc_type_units) createUnit [[0, 0, 0], _group, "this moveinCargo _veh;this assignAsCargo _veh;"];
        };

        _group selectLeader (driver _veh);

        private _wp = _group addWaypoint [_dest, 60];
        _wp setWaypointType "MOVE";
        _wp setWaypointCombatMode "RED";
        _wp setWaypointBehaviour "AWARE";
        _wp setWaypointSpeed "NORMAL";
        private _wp_1 = _group addWaypoint [_dest, 60];
        _wp_1 setWaypointType "GETOUT";
        private _wp_3 = _group addWaypoint [_dest, 60];
        _wp_3 setWaypointType "SENTRY";
        _wp setWaypointStatements ["true", "(group this) spawn btc_fnc_data_add_group;"];

        {_x call btc_fnc_mil_unit_create} forEach units _group;
    };
};

//Check if HC is connected
if !((entities "HeadlessClient_F") isEqualTo []) then {
    [_group] call btc_fnc_set_groupowner;
};

_group
