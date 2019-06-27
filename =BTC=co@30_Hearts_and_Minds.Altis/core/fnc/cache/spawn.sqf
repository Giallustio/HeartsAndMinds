
/* ----------------------------------------------------------------------------
Function: btc_fnc_cache_spawn

Description:
    Spawn at a house an ammo cache.

Parameters:
    _house - House where to spawn the cache. [Object]

Returns:

Examples:
    (begin example)
        [] call btc_fnc_cache_spawn;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_house", objNull, [objNull]]
];

if ((_house buildingPos -1) isEqualTo []) exitWith {
    [] call btc_fnc_cache_find_pos;
};

btc_cache_pos = selectRandom (_house buildingPos -1);

call btc_fnc_cache_create;
