private _units = allUnits select {alive _x};
_units append entities "Car";
_units append entities "Tank";
_units append entities "Ship";
_units append entities "Air";
private _owners = _units apply {[_x, owner _x]};

missionNamespace setVariable ["btc_units_owners", _owners, remoteExecutedOwner];
missionNamespace setVariable ["btc_patrol_active", btc_patrol_active, remoteExecutedOwner];
missionNamespace setVariable ["btc_civ_veh_active", btc_civ_veh_active, remoteExecutedOwner];
