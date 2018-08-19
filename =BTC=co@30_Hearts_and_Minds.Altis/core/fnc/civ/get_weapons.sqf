
private ["_pos","_range","_units"];

_pos = _this select 0;
_range = _this select 1;
_units = [];
if (count _this > 2) then {_units = _this select 2;} else {_units = _pos nearEntities [btc_civ_type_units, _range];};

_units = _units select {side _x isEqualTo civilian};
{
    private ["_wp"];
    if (btc_debug_log) then    {diag_log format ["fnc_civ_get_weapons %1 - %2",_x,side _x];};

    _x call btc_fnc_rep_remove_eh;
    [_x, "", 2] call ace_common_fnc_doAnimation;
    [_x] call btc_fnc_civ_add_weapons;

    [_x] joinSilent createGroup [btc_enemy_side, true];

    (group _x) setVariable ["getWeapons",true];

    (group _x) setBehaviour "AWARE";
    _wp = (group _x) addWaypoint [getpos _x, 0];
    _wp setWaypointType "GUARD";
    _wp setWaypointCombatMode "RED";

} foreach _units;