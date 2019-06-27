
/* ----------------------------------------------------------------------------
Function: btc_fnc_cache_init

Description:
    Initialise the ammo cache system with all necessary variable and start the search of a suitable position for it.

Parameters:

Returns:

Examples:
    (begin example)
        [] call btc_fnc_cache_init;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

btc_cache_pos = [];
btc_cache_n = 0;
btc_cache_obj = objNull;
btc_cache_markers = [];
btc_cache_info = btc_info_cache_def;
[] call btc_fnc_cache_find_pos;
