
/* ----------------------------------------------------------------------------
Function: btc_fnc_fob_init

Description:
    Add leaflets to drone which have parents classe: UAV_06_base_F and UAV_01_base_F.

Parameters:
    _structure - Not used. [Object]
    _flag - Drone where leaflets will be added. [Object]

Returns:

Examples:
    (begin example)
        [_structure] call btc_fnc_fob_init;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_structure", objNull, [objNull]],
    ["_flag", objNull, [objNull]],
    ["_marker", "", [""]],
    ["_fobs", btc_fobs, [[]]]
];

if (_marker isEqualTo "") then {
    _marker = "respawn_" + str btc_player_side + str _structure;
};

if (_marker in (_fobs select 0)) exitWith {};

(_fobs select 0) pushBack _marker;
(_fobs select 1) pushBack _structure;
(_fobs select 2) pushBack _flag;
