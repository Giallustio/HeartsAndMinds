params ["_pos", "_radius"];

private _buildings = nearestObjects [_pos, ["Building"], _radius];
private _useful = _buildings select {!((_x buildingPos -1) isEqualTo []) && {damage _x isEqualTo 0}};

_useful
