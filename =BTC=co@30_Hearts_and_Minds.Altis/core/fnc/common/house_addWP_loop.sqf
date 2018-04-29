params ["_group", "_house"];

private _allpositions = _house buildingPos -1;
private _copyallpositions = +_allpositions;

if (btc_debug_log) then {
    diag_log format ["setWaypoint : count all pos %1 in %2 ", count _allpositions, _house];
};
{
    private _index = _copyallpositions find selectRandom _copyallpositions;

    private _wp = [_group, _copyallpositions deleteAt _index, 0.2, "MOVE", "UNCHANGED", "NO CHANGE", "UNCHANGED", "NO CHANGE", "", [15, 20, 30]] call CBA_fnc_addWaypoint;
    _wp waypointAttachObject _house;
    _wp setWaypointHousePosition _index;
} forEach _allpositions;

_allpositions
