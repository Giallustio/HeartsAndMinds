/*
    If player is around: initiate patrol around the destination,
    Ifnot: save in database and delete units by calling btc_fnc_data_get_group.
*/

params ["_group"];

if (btc_debug_log) then {diag_log format ["ADD GROUP = %1", _group];};
_group setVariable ["no_cache", Nil];
while {!((waypoints _group) isEqualTo [])} do {deleteWaypoint ((waypoints _group) select 0);};

private _city = [leader _group, btc_city_all, false] call btc_fnc_find_closecity;
_city setVariable ["occupied", true];

if (_city getVariable ["marker", ""] != "") then {
    private _marker = _city getVariable ["marker", ""];
    _marker setMarkerColor "ColorRed";
    _marker setMarkerAlpha 0.3;
};

private _wp = if (vehicle leader _group isEqualTo leader _group) then {
    random 1;
} else {
    if ((vehicle leader _group) isKindOf "Air") then     {
        0.7;
    } else {
        0.3 + random 0.7;
    };
};

[_group, _city, 200, _wp] call btc_fnc_mil_addWP;

if !(_city getVariable ["active", false]) then {
    private _data_units = _city getVariable ["data_units", []];
    private _data_group = _group call btc_fnc_data_get_group;

    _data_units pushBack _data_group;
    _city setVariable ["data_units", _data_units];
    if (btc_debug_log) then {diag_log format ["PUSHBACK = %1", _data_group];};
};

if (btc_final_phase) then {
    btc_city_remaining pushBack _city;
};
if (btc_debug_log) then {diag_log format ["END = %1", []];};
