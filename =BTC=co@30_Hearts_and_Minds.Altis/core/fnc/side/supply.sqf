
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
_pos = [_pos, 0, 300, 20, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;

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

private _type_cone = selectRandom btc_type_cones;
private _fences = selectRandom btc_type_fences;
private _composition = [
    [_type_cone,random 360,[0.751953,-0.587891,0]],
    [selectRandom btc_type_foodSack, random 360,[-0.498047,-0.949219,0]],
    [_type_cone,random 360,[0.671875,0.769531,0]],
    [_type_cone,random 360,[-1.25586,-0.566406,0]],
    [selectRandom btc_type_garbage,0,[0.808594,1.31055,0]],
    [_type_cone,random 360,[-1.33594,0.791016,0]],
    [selectRandom btc_type_table,0,[-0.195313,-1.65039,0]],
    [_type_cone,random 360,[0.648438,2.17578,0]],
    [selectRandom btc_type_table,0,[1.82031,-1.66406,0]],
    [_type_cone,random 360,[-1.35938,2.19727,0]],
    [_type_cone,random 360,[2.57227,0.550781,0]],
    [selectRandom btc_type_table,0,[-2.19727,-1.64844,0]],
    [_type_cone,random 360,[2.65234,-0.806641,0]],
    ["Land_ShelvesWooden_F",0,[0.748047,-2.67383,0]],
    [selectRandom btc_type_seat,169,[0.0859375,-2.95898,0]],
    ["Land_ShelvesWooden_F",0,[-1.19922,-2.7168,0]],
    [_type_cone,random 360,[-3.09766,-0.724609,0]],
    [_type_cone,random 360,[2.54883,1.95703,0]],
    [_type_cone,random 360,[-3.17773,0.632813,0]],
    [selectRandom btc_type_seat,175,[2.02148,-2.80078,0]],
    [selectRandom btc_type_seat,198,[-2.48242,-2.75781,0]],
    [_type_cone,random 360,[-3.20117,2.03906,0]],
    [selectRandom btc_type_PaperBox,random 360,[0.732422,-3.97656,0]],
    [selectRandom btc_type_PaperBox,random 360,[-1.16016,-3.96289,0]],
    [selectRandom btc_type_EmergencyBlanket,random 360,[-3.34766,-3.17383,0]],
    [selectRandom btc_type_Sponsor,201,[-4.64453,2.35352,0]],
    [selectRandom btc_type_Scrapyard, random 360,[-5.15234,-4.17969,0]],
    [selectRandom btc_type_portable_light,150,[2.60156,-6.82031,0]],
    [_fences,24,[6.77148,-3.02344,0]],
    [_fences,321,[-6.625,-3.70313,0]],
    [selectRandom btc_type_power,117,[5.92578,-5.69336,0]],
    ["Flag_IDAP_F",0,[-3.80859,-6.70703,0]],
    [selectRandom btc_type_EmergencyBlanket,random 360,[-2.17969,-8.61328,0]],
    [selectRandom btc_type_foodSack, random 360,[2.6875,-9.44531,0]],
    [selectRandom btc_type_Sponsor,204,[9.34766,-5.02539,0]],
    [selectRandom btc_type_PlasticCase,353,[-2.60156,-11.7715,0]],
    [selectRandom btc_type_MedicalTent,0,[0.322266,-12.4043,0]],
    [selectRandom btc_type_PaperBox,random 360,[2.94531,-14.9102,0]],
    [selectRandom btc_type_seat,229,[-2.07422,-15.2441,0]],
    [selectRandom btc_type_cargo_ruins,300,[-10.0488,-12.1152,0]]
];
private _direction_composition = random 360;
private _composition_objects = [_pos, _direction_composition, _composition] call btc_fnc_create_composition;

btc_supplies_mat params ["_food", "_water"];
waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || !((nearestObjects [_pos, [btc_supplies_cargo] + _food + _water, 30]) isEqualTo []))};

[getPos _city, _pos getPos [10, _direction_composition]] call btc_fnc_civ_evacuate;

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || (count (nearestObjects [_pos, _food + _water, 30]) >= 2))};

btc_side_assigned = false;
publicVariable "btc_side_assigned";

if (btc_side_aborted || btc_side_failed) exitWith {
    3 remoteExec ["btc_fnc_task_fail", 0];
    [[_area, _marker], _composition_objects, []] call btc_fnc_delete;
};

50 call btc_fnc_rep_change;

3 remoteExec ["btc_fnc_task_set_done", 0];

[[_area, _marker], _composition_objects + nearestObjects [_pos, _food + _water + [btc_supplies_cargo], 30], []] call btc_fnc_delete;
