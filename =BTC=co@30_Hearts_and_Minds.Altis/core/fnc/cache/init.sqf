
/* ----------------------------------------------------------------------------
Function: btc_fnc_cache_init

Description:
    Fill me when you edit me !

Parameters:

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_cache_init;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

btc_cache_cities = + btc_city_all;
btc_cache_pos = [];
btc_cache_n = 0;
btc_cache_obj = objNull;
btc_cache_markers = [];
btc_cache_info = btc_info_cache_def;
[] call btc_fnc_cache_find_pos;
