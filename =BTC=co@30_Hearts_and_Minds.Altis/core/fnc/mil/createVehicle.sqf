
/* ----------------------------------------------------------------------------
Function: btc_fnc_mil_createVehicle

Description:
    Fill me when you edit me !

Parameters:
    _group - [Group]
    _pos - [Array]
    _veh_type - [String]
    _dir - [Number]
    _type_units - [Array]
    _type_divers - [Array]
    _type_crewmen - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_mil_createVehicle;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_group", grpNull, [grpNull]],
    ["_pos", [0, 0, 0], [[]]],
    ["_veh_type", selectRandom btc_type_motorized, [""]],
    ["_dir", 0, [0]],
    ["_type_units", btc_type_units, [[]]],
    ["_type_divers", btc_type_divers, [[]]],
    ["_type_crewmen", btc_type_crewmen, [[]]]
];

private _needdiver = getText (configFile >> "CfgVehicles" >> _veh_type >> "simulation") isEqualTo "submarinex";

private _veh = createVehicle [_veh_type, _pos, [], 0, "FLY"];
if !(_veh_type isKindOf "Plane") then {
    _veh setdir _dir;
};

private _units = [_veh, _group, false, "", [_type_crewmen, _type_divers select 0] select _needdiver] call BIS_fnc_spawnCrew;
_group selectLeader (driver _veh);
_units joinSilent _group;
{_x call btc_fnc_mil_unit_create} forEach _units;

private _cargo = _veh emptyPositions "cargo";
[_group, _pos, _cargo, _needdiver, _type_units, _type_divers] call btc_fnc_mil_createUnits;

_veh
