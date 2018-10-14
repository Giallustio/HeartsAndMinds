
/* ----------------------------------------------------------------------------
Function: btc_fnc_patrol_addWP

Description:
    Fill me when you edit me !

Parameters:
    _group - [Group]
    _pos - [Array]
    _waypointStatements - [String]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_patrol_addWP;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_group", grpNull, [grpNull]],
    ["_pos", [0, 0, 0], [[]]],
    ["_waypointStatements", "", [""]]
];

[_group] call CBA_fnc_clearWaypoints;

if (btc_debug) then {
    [format ["_waypointStatements = %1 ID: %2", _waypointStatements,  _group getVariable ["btc_patrol_id", -1]], __FILE__, [True]] call btc_fnc_debug_message;
};

private _vehicle = vehicle leader _group;
if (_vehicle isKindOf "Air" || _vehicle isKindOf "LandVehicle") then {
    _vehicle setFuel 1;
};
_group setBehaviour "SAFE";

if !(_vehicle isKindOf "Air") then {
    [_group, _pos, 0, "MOVE", "UNCHANGED", "RED", "LIMITED", "STAG COLUMN", "", [0, 0, 0], 20] call CBA_fnc_addWaypoint;
    for "_i" from 0 to (2 + (floor (random 3))) do {
        private _newPos = [_pos, 150] call CBA_fnc_randPos;

        [_group, _newPos, 0, "MOVE", "UNCHANGED", "RED", "UNCHANGED", "NO CHANGE", "", [0, 0, 0], 20] call CBA_fnc_addWaypoint;
    };
    [_group, _pos, 0, "MOVE", "UNCHANGED", "NO CHANGE", "UNCHANGED", "NO CHANGE", _waypointStatements, [0, 0, 0], 20] call CBA_fnc_addWaypoint;
    [_group, _pos, 0, "MOVE", "UNCHANGED", "NO CHANGE", "UNCHANGED", "NO CHANGE", "[format ['ID: %1, _waypointStatements not executed, units in group %2', (group this) getVariable 'btc_patrol_id', thislist apply {typeOf _x}], __FILE__] call btc_fnc_debug_message;", [0, 0, 0], 20] call CBA_fnc_addWaypoint;

} else {
    [_group, _pos, 0, "MOVE", "UNCHANGED", "RED", "LIMITED", "STAG COLUMN", _waypointStatements, [0, 0, 0], 20] call CBA_fnc_addWaypoint;
};

if (btc_debug) then {
    if (!isNil {_group getVariable "btc_patrol_id"}) then {
        private _marker = createMarker [format ["Patrol_fant_%1", _group getVariable "btc_patrol_id"] , [(_pos select 0) + random 30, (_pos select 1) + random 30, 0]];
        _marker setMarkerType "mil_dot";
        _marker setMarkerText format ["P %1", _group getVariable "btc_patrol_id"];
        _marker setMarkerColor (["ColorWhite", "ColorRed"] select ((_group getVariable "btc_patrol_id") > 0));
        _marker setMarkerSize [0.5, 0.5];
    };
};
