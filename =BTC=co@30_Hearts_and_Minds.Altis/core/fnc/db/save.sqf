
call btc_fnc_db_delete;

if (btc_debug) then {hint "saving...1";};
[8] remoteExec ["btc_fnc_show_hint", 0];

btc_db_is_saving = true;
private _name = worldName;

//Version
profileNamespace setVariable [format ["btc_hm_%1_version", _name], btc_version];

//World Date
profileNamespace setVariable [format ["btc_hm_%1_date", _name], date];

for "_i" from 0 to (count btc_city_all - 1) do {
    private _s = [_i] spawn btc_fnc_city_de_activate;
    waitUntil {scriptDone _s};
};
if (btc_debug) then {hint "saving...2";};

//City status
private _cities_status = [];
{
    //[151,false,false,true,false,false,[]]
    private _city_status = [];
    _city_status pushBack (_x getVariable "id");

    _city_status pushBack (_x getVariable "initialized");

    _city_status pushBack (_x getVariable "spawn_more");
    _city_status pushBack (_x getVariable "occupied");

    _city_status pushBack (_x getVariable "data_units");

    _city_status pushBack (_x getVariable ["has_ho", false]);
    _city_status pushBack (_x getVariable ["ho_units_spawned", false]);
    _city_status pushBack (_x getVariable ["ieds", []]);
    _city_status pushBack (_x getVariable ["has_suicider", false]);

    _cities_status pushBack _city_status;
    if (btc_debug_log) then {diag_log format ["SAVE: %1 - %2", _x getVariable "id", _x getVariable "occupied"];};
} foreach btc_city_all;
profileNamespace setVariable [format ["btc_hm_%1_cities", _name], _cities_status];

//HIDEOUT
private _array_ho = [];
{
    private _data = [];
    _data pushBack (getPos _x);
    _data pushBack (_x getVariable ["id", 0]);
    _data pushBack (_x getVariable ["rinf_time", 0]);
    _data pushBack (_x getVariable ["cap_time", 0]);
    _data pushBack ((_x getVariable ["assigned_to", objNull]) getVariable "id");

    private _ho_markers = [];
    {
        private _marker = [];
        _marker pushback (getMarkerPos _x);
        _marker pushback (markerText _x);
        _ho_markers pushback _marker;
    } foreach (_x getVariable ["markers", []]);
    _data pushback _ho_markers;
    if (btc_debug_log) then {diag_log format ["HO %1 DATA %2", _x, _data];};
    _array_ho pushBack _data;
} foreach btc_hideouts;
profileNamespace setVariable [format ["btc_hm_%1_ho", _name], _array_ho];

profileNamespace setVariable [format ["btc_hm_%1_ho_sel", _name], btc_hq getVariable ["id",0]];

//CACHE
private _array_cache = [];
_array_cache pushback (getposATL btc_cache_obj);
_array_cache pushback btc_cache_n;
_array_cache pushback btc_cache_info;
private _cache_markers = [];
{
    private _data = [];
    _data pushback (getMarkerPos _x);
    _data pushback (markerText _x);
    _cache_markers pushBack _data;
} foreach btc_cache_markers;
_array_cache pushback _cache_markers;
profileNamespace setVariable [format ["btc_hm_%1_cache", _name], _array_cache];

//REPUTATION
profileNamespace setVariable [format ["btc_hm_%1_rep", _name], btc_global_reputation];

//FOBS
private _fobs = [[], []];
{
    private _pos = getMarkerPos _x;
    (_fobs select 0) pushBack [_x, _pos];
} foreach (btc_fobs select 0);
(_fobs select 1) append (btc_fobs select 1);
profileNamespace setVariable [format ["btc_hm_%1_fobs", _name], _fobs];

//Vehicles status
private _array_veh = [];
{
    private _data = [];
    _data pushBack (typeOf _x);
    _data pushBack (getPosASL _x);
    _data pushBack (getDir _x);
    _data pushBack (fuel _x);
    _data pushBack (getAllHitPointsDamage _x);
    private _cargo = [];
    {_cargo pushBack [typeOf _x, _x getVariable ["ace_rearm_magazineClass", ""], [getWeaponCargo _x,getMagazineCargo _x,getItemCargo _x]]} foreach (_x getVariable ["cargo", []]);
    _data pushBack _cargo;
    private _cont = [getWeaponCargo _x, getMagazineCargo _x, getItemCargo _x];
    _data pushBack _cont;
    _data pushback ([_x] call BIS_fnc_getVehicleCustomization);
    _array_veh pushBack _data;
    if (btc_debug_log) then {diag_log format ["VEH %1 DATA %2", _x, _data]};
} foreach (btc_vehicles - [objNull]);
profileNamespace setVariable [format ["btc_hm_%1_vehs", _name], _array_veh];

//Objects status
private _array_obj = [];
{
    private _data = [_x] call btc_fnc_db_saveObjectStatus;
    if !(_data isEqualTo []) then {
        _array_obj pushBack _data;
    };
} foreach btc_log_obj_created;
profileNamespace setVariable [format ["btc_hm_%1_objs", _name], _array_obj];

//Player Markers
private _player_markers = allMapMarkers select {(_x select [0, 15]) isEqualTo "_USER_DEFINED #"};
private _markers_properties = _player_markers apply {[markerText _x, markerPos _x, markerColor _x, markerType _x, markerSize _x, markerAlpha _x, markerBrush _x, markerDir _x, markerShape _x]};
profileNamespace setVariable [format ["btc_hm_%1_markers", _name], _markers_properties];

//End
profileNamespace setVariable [format ["btc_hm_%1_db", _name], true];
saveProfileNamespace;
if (btc_debug) then {hint "saving...3";};
[9] remoteExec ["btc_fnc_show_hint", 0];

btc_db_is_saving = false;
