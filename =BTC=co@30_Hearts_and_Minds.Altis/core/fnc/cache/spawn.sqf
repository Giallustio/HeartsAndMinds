params [
    ["_house", objNull, [objNull]]
];

if ((_house buildingPos -1) isEqualTo []) exitWith {
    [] call btc_fnc_cache_find_pos;
};

btc_cache_pos = selectRandom (_house buildingPos -1);

call btc_fnc_cache_create;
