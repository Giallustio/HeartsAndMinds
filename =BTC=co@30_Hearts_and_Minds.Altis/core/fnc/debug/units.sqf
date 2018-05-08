params ["_args", "_id"];
_args params ["_display", "_TXTunits"];

if (isNull _display || !btc_debug_graph) exitWith {
    [_id] call CBA_fnc_removePerFrameHandler;
    _display closeDisplay 1;
};

private _count_units = count (allUnits select {alive _x});

private _count_units_own = 0;
if (!((entities "HeadlessClient_F") isEqualTo [])) then {
    remoteExecCall ["btc_fnc_debug_get_owners", 2];
    _count_units_own = {((_x select 1) isEqualTo 2) && ((_x select 0) isKindOf "man")} count btc_units_owners;
} else {
    _count_units_own = _count_units;
};

_TXTunits ctrlSetText format ["UNITS:%1 NOT-ON-SERVER:%2 | GROUPS:%3 | Patrol:%4 Traffic:%5", _count_units, _count_units - _count_units_own, count allGroups, count btc_patrol_active, count btc_civ_veh_active];
