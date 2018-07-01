params ["_pos", "_radius"];

private _cfgVehicles = configFile >> "CfgVehicles";
private _structures = (nearestTerrainObjects [_pos, ["House", "BUNKER", "FORTRESS"], _radius]) select {getText(_cfgVehicles >> typeOf _x >> "editorSubcategory") isEqualTo "EdSubcat_Military"};

private _useful = _structures select {(
    !((_x buildingPos -1) isEqualTo []) &&
    {damage _x isEqualTo 0}
)};

_useful
