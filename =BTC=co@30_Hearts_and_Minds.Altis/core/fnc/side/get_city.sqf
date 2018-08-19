
private ["_useful","_city","_pos"];

_useful = btc_city_all select {((_x getVariable ["occupied",false]) && {_x getVariable ["type",""] != "NameLocal"} && {_x getVariable ["type",""] != "Hill"} && {_x getVariable ["type",""] != "NameMarine"})};
if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};

_city = selectRandom _useful;

_pos = getPos _city;

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;publicVariable "btc_side_assigned";

[6,_pos,_city getVariable "name"] remoteExec ["btc_fnc_task_create", 0];

btc_side_jip_data = [6,_pos,_city getVariable "name"];

_city setVariable ["spawn_more",true];

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || !(_city getVariable ["occupied",false]))};

btc_side_assigned = false;publicVariable "btc_side_assigned";

if (btc_side_aborted || btc_side_failed) exitWith {
    6 remoteExec ["btc_fnc_task_fail", 0];
};

80 call btc_fnc_rep_change;

6 remoteExec ["btc_fnc_task_set_done", 0];