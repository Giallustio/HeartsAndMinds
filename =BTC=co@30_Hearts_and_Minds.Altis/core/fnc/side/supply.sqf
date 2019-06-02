
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_supply

Description:
    Fill me when you edit me !

Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_side_supply;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

private _useful = btc_city_all select {!((_x getVariable ["type", ""]) in ["NameLocal", "Hill", "NameMarine"])} ;

if (_useful isEqualTo []) then {_useful = + btc_city_all;};

private _city = selectRandom _useful;
private _pos = [getPos _city, 100] call btc_fnc_randomize_pos;
_pos = [_pos, 0, 300, 20, false] call btc_fnc_findsafepos;

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;
publicVariable "btc_side_assigned";

btc_side_jip_data = [3, _pos, _city getVariable "name"];
btc_side_jip_data remoteExec ["btc_fnc_task_create", 0];

private _area = createMarker [format ["sm_%1", _pos], _pos];
_area setMarkerShape "ELLIPSE";
_area setMarkerBrush "SolidBorder";
_area setMarkerSize [30, 30];
_area setMarkerAlpha 0.3;
_area setmarkercolor "colorBlue";

private _marker = createMarker [format ["sm_2_%1", _pos], _pos];
_marker setMarkerType "hd_flag";
[_marker, "str_a3_cfgeditorcategories_edcat_supplies0"] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker]; //Supplies
_marker setMarkerSize [0.6, 0.6];

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || !((nearestObjects [_pos, [btc_supplies_mat], 30]) isEqualTo []))};

btc_side_assigned = false;
publicVariable "btc_side_assigned";

if (btc_side_aborted || btc_side_failed) exitWith {
    3 remoteExec ["btc_fnc_task_fail", 0];
    [[_area, _marker], [], []] call btc_fnc_delete;
};

50 call btc_fnc_rep_change;

3 remoteExec ["btc_fnc_task_set_done", 0];

[[_area, _marker], [(nearestObjects [_pos, [btc_supplies_mat], 30]) select 0], []] call btc_fnc_delete;
