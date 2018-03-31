/*
    curator,object
*/

params ["_curator", "_object_placed"];

if !((_object_placed isKindOf "AllVehicles") || (_object_placed isKindOf "Module_F")) then {
    [_object_placed] remoteExec ["btc_fnc_log_CuratorObjectPlaced_s", 2];

    if (btc_debug_log) then {diag_log format ["CURATOR OBJECT %1", _object_placed];};
    if (btc_debug) then {hint str_object_placed;};
};

if (_object_placed isKindOf "Man") then {

    if (side _object_placed isEqualTo btc_enemy_side) then {
        [_object_placed] remoteExec ["btc_fnc_mil_CuratorMilPlaced_s", 2];
    };

    if (side _object_placed isEqualTo civilian) then {
        [_object_placed] remoteExec ["btc_fnc_civ_CuratorCivPlaced_s", 2];
    };

    if (btc_debug_log) then {diag_log format ["CURATOR MAN %1", _object_placed];};
    if (btc_debug) then {hint str _object_placed;};
};
