
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_CuratorObjectPlaced

Description:
    Initialise object placed by curator.

Parameters:
    _curator - Curator. [Object]
    _object_placed - Object/Unit placed. [Object]

Returns:

Examples:
    (begin example)
        [cursorObject] call btc_fnc_eh_CuratorObjectPlaced;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_curator", objNull, [objNull]],
    ["_object_placed", objNull, [objNull]]
];

if !((_object_placed isKindOf "AllVehicles") || (_object_placed isKindOf "Module_F")) then {
    [_object_placed] remoteExecCall ["btc_fnc_log_CuratorObjectPlaced_s", 2];

    if (btc_debug_log) then {
        [format ["OBJECT %1", _object_placed], __FILE__, [false]] call btc_fnc_debug_message;
    };
    if (btc_debug) then {
        [str _object_placed, __FILE__, [btc_debug, false]] call btc_fnc_debug_message;
    };
};

if (_object_placed isKindOf "Man") then {

    if (side _object_placed isEqualTo btc_enemy_side) then {
        [_object_placed] remoteExecCall ["btc_fnc_mil_CuratorMilPlaced_s", 2];
    };

    if (side _object_placed isEqualTo civilian) then {
        [_object_placed] remoteExecCall ["btc_fnc_civ_CuratorCivPlaced_s", 2];
    };

    if (btc_debug_log) then {
        [format ["MAN %1", _object_placed], __FILE__, [false]] call btc_fnc_debug_message;
    };
    if (btc_debug) then {
        [str _object_placed, __FILE__, [btc_debug, false]] call btc_fnc_debug_message;
    };
};
