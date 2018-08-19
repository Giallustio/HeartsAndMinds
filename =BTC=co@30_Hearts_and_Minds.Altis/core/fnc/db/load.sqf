
private _name = worldName;

setDate (profileNamespace getVariable [format ["btc_hm_%1_date", _name], date]);

//CITIES
private _cities_status = profileNamespace getVariable [format ["btc_hm_%1_cities", _name], []];

{
    _x params ["_id", "_initialized", "_spawn_more", "_occupied", "_data_units", "_has_ho", "_ho_units_spawned", "_ieds", "_has_suicider"];

    private _city = btc_city_all select _id;

    _city setVariable ["initialized", _initialized];
    _city setVariable ["spawn_more", _spawn_more];
    _city setVariable ["occupied", _occupied];
    _city setVariable ["data_units", _data_units];
    _city setVariable ["has_ho", _has_ho];
    _city setVariable ["ho_units_spawned", _ho_units_spawned];
    _city setVariable ["ieds", _ieds];
    _city setVariable ["has_suicider", _has_suicider];

    if (btc_debug) then    {//_debug

        if (_city getVariable ["occupied",false]) then {(_city getVariable ["marker", ""]) setmarkercolor "colorRed";} else {(_city getVariable ["marker", ""]) setmarkercolor "colorGreen";};
        (_city getVariable ["marker", ""]) setmarkertext format ["loc_%3 %1 %2 - [%4]", _city getVariable "name", _city getVariable "type", _id, _occupied];

        diag_log format ["ID: %1", _id];
        diag_log format ["data_city: %1", _x];
        diag_log format ["LOAD: %1 - %2", _id, _occupied];
    };
} foreach _cities_status;

//HIDEOUT
private _array_ho = profileNamespace getVariable [format ["btc_hm_%1_ho", _name], []];

{
    _x params ["_pos", "_id_hideout","_rinf_time", "_cap_time", "_id", "_markers_saved"];

    private _city = btc_city_all select _id;

    private _hideout = [_pos] call btc_fnc_mil_create_hideout_composition;
    clearWeaponCargoGlobal _hideout;clearItemCargoGlobal _hideout;clearMagazineCargoGlobal _hideout;

    _city setpos _pos;
    if (btc_debug) then    {deleteMarker format ["loc_%1", _id];};
    deleteVehicle (_city getVariable ["trigger_player_side",objNull]);
    private _radius_x = btc_hideouts_radius;
    private _radius_y = btc_hideouts_radius;

    [_pos, _radius_x, _radius_y, _city, _city getVariable "occupied", _city getVariable "name", _city getVariable "type", _id] call btc_fnc_city_trigger_player_side;

    _city setVariable ["RadiusX", _radius_x];
    _city setVariable ["RadiusY", _radius_y];

    _hideout setVariable ["id", _id_hideout];
    _hideout setVariable ["rinf_time", _rinf_time];
    _hideout setVariable ["cap_time", _cap_time];
    _hideout setVariable ["assigned_to", _city];

    _hideout addEventHandler ["HandleDamage", btc_fnc_mil_hd_hideout];

    private _markers = [];
    {
        _x params ["_pos", "_marker_name"];

        private _marker = createmarker [format ["%1", _pos], _pos];
        _marker setmarkertype "hd_warning";
        _marker setMarkerText _marker_name;
        _marker setMarkerSize [0.5, 0.5];
        _marker setMarkerColor "ColorRed";
        _markers pushBack _marker;
    } foreach _markers_saved;

    _hideout setVariable ["markers", _markers];

    if (btc_debug) then {
        //Marker
        createmarker [format ["btc_hideout_%1", _pos], _pos];
        format ["btc_hideout_%1", _pos] setmarkertype "mil_unknown";
        format ["btc_hideout_%1", _pos] setMarkerText format ["Hideout %1", btc_hideouts_id];
        format ["btc_hideout_%1", _pos] setMarkerSize [0.8, 0.8];
    };

    if (btc_debug_log) then {diag_log format ["btc_fnc_mil_create_hideout: _this = %1 ; POS %2 ID %3", _x, _pos, btc_hideouts_id];};

    btc_hideouts_id = btc_hideouts_id + 1;
    btc_hideouts pushBack _hideout;
} foreach _array_ho;

private _ho = profileNamespace getVariable [format ["btc_hm_%1_ho_sel", _name], 0];
btc_hq = btc_hideouts select _ho;

if (count btc_hideouts == 0) then {[] spawn btc_fnc_final_phase;};

//CACHE

btc_cache_cities = + btc_city_all;
btc_cache_markers = [];

private _array_cache = profileNamespace getVariable [format ["btc_hm_%1_cache", _name], []];

btc_cache_pos = _array_cache select 0;
btc_cache_n = _array_cache select 1;
btc_cache_info = _array_cache select 2;

call btc_fnc_cache_create;

{
    _x params ["_pos", "_marker_name"];

    private _marker = createmarker [format ["%1", _pos], _pos];
    _marker setmarkertype "hd_unknown";
    _marker setMarkerText _marker_name;
    _marker setMarkerSize [0.5, 0.5];
    _marker setMarkerColor "ColorRed";
    btc_cache_markers pushBack _marker;
} foreach (_array_cache select 3);

//FOB
private _fobs = profileNamespace getVariable [format ["btc_hm_%1_fobs", _name], []];
private _fobs_loaded = [[], []];

{
    _x params ["_fob_name", "_pos"];

    createmarker [_fob_name, _pos];
    _fob_name setMarkerSize [1, 1];
    _fob_name setMarkerType "b_hq";
    _fob_name setMarkerText _fob_name;
    _fob_name setMarkerColor "ColorBlue";
    _fob_name setMarkerShape "ICON";
    private _fob_structure = createVehicle [btc_fob_structure, _pos, [], 0, "NONE"];
    private _flag = createVehicle [btc_fob_flag, _pos, [], 0, "NONE"];
    _flag setVariable ["btc_fob", _fob_name];
    (_fobs_loaded select 0) pushBack _fob_name;
    (_fobs_loaded select 1) pushBack _fob_structure;
} foreach (_fobs select 0);
btc_fobs = _fobs_loaded;

//REP
private _global_reputation = profileNamespace getVariable [format ["btc_hm_%1_rep", _name], 0];

//VEHICLES
{deleteVehicle _x} foreach btc_vehicles;
btc_vehicles = [];

private _vehs = profileNamespace getVariable [format ["btc_hm_%1_vehs", _name], []];
[{
    params ["_vehs", "_global_reputation"];

    {
        _x params ["_veh_type", "_veh_pos", "_veh_dir", "_veh_fuel", "_veh_AllHitPointsDamage", "_veh_cargo", "_veh_cont", "_customization"];

        if (btc_debug_log) then {diag_log format ["btc_fnc_db_load: _veh = %1;", _x];};

        private _veh = [_veh_type, _veh_pos, _veh_dir, _customization] call btc_fnc_log_createVehicle;
        if ((getPos _veh) select 2 < 0) then {_veh setVectorUp surfaceNormal position _veh;};
        _veh setFuel _veh_fuel;
        {
            _x params ["_type", "_rearm_magazineClass", "_cargo_obj"];

            private _obj = _type createVehicle [0, 0, 0];
            if (_rearm_magazineClass != "") then {_obj setVariable ["ace_rearm_magazineClass", _rearm_magazineClass, true]};
            btc_log_obj_created pushBack _obj;
            btc_curator addCuratorEditableObjects [[_obj], false];

            clearWeaponCargoGlobal _obj;clearItemCargoGlobal _obj;clearMagazineCargoGlobal _obj;
            _cargo_obj params ["_weap_obj", "_mags_obj", "_items_obj"];
            if (count _weap_obj > 0) then {
                for "_i" from 0 to ((count (_weap_obj select 0)) - 1) do {
                    _obj addWeaponCargoGlobal [(_weap_obj select 0) select _i, (_weap_obj select 1) select _i];
                };
            };
            if (count _mags_obj > 0) then {
                for "_i" from 0 to ((count (_mags_obj select 0)) - 1) do {
                    _obj addMagazineCargoGlobal [(_mags_obj select 0) select _i, (_mags_obj select 1) select _i];
                };
            };
            if (count _items_obj > 0) then {
                for "_i" from 0 to ((count (_items_obj select 0)) - 1) do {
                    _obj addItemCargoGlobal [(_items_obj select 0) select _i, (_items_obj select 1) select _i];
                };
            };
            [_obj, _veh] call btc_fnc_log_server_load;
        } foreach _veh_cargo;

        clearWeaponCargoGlobal _veh;clearItemCargoGlobal _veh;clearMagazineCargoGlobal _veh;
        _veh_cont params ["_weap", "_mags", "_items"];
        if (count _weap > 0) then {
            for "_i" from 0 to ((count (_weap select 0)) - 1) do {
                _veh addWeaponCargoGlobal[(_weap select 0) select _i, (_weap select 1) select _i];
            };
        };
        if (count _mags > 0) then {
            for "_i" from 0 to ((count (_mags select 0)) - 1) do {
                _veh addMagazineCargoGlobal[(_mags select 0) select _i, (_mags select 1) select _i];
            };
        };
        if (count _items > 0) then {
            for "_i" from 0 to ((count (_items select 0)) - 1) do {
                _veh addItemCargoGlobal[(_items select 0) select _i, (_items select 1) select _i];
            };
        };

        //Disable explosion effect during database loading
        {
            [_veh, _foreachindex, _x, false] call ace_repair_fnc_setHitPointDamage;
        } forEach (_veh_AllHitPointsDamage select 2);
        if ((_veh_AllHitPointsDamage select 2) select {_x < 1} isEqualTo []) then {
            _veh setVariable ["ace_cookoff_enable", false, true];
            _veh setVariable ["ace_cookoff_enableAmmoCookoff", false, true];
            _veh setDamage [1, false];
        };
    } foreach _vehs;
    [{
        btc_global_reputation = _this;
    }, _global_reputation, 0.5] call CBA_fnc_waitAndExecute;
}, [_vehs, _global_reputation], 0.5] call CBA_fnc_waitAndExecute;

//Objects
private _objs = profileNamespace getVariable [format ["btc_hm_%1_objs", _name], []];
{
    [_x] call btc_fnc_db_loadObjectStatus;
} foreach _objs;

//Player Markers
private _markers_properties = profileNamespace getVariable [format ["btc_hm_%1_markers", _name], []];
{
    _x params ["_markerText", "_markerPos", "_markerColor", "_markerType", "_markerSize", "_markerAlpha", "_markerBrush", "_markerDir", "_markerShape"];

    private _marker = createMarker [format ["_USER_DEFINED #0/%1/1", _foreachindex], _markerPos];
    _marker setMarkerText _markerText;
    _marker setMarkerColor _markerColor;
    _marker setMarkerType _markerType;
    _marker setMarkerSize _markerSize;
    _marker setmarkerAlpha _markerAlpha;
    _marker setmarkerBrush _markerBrush;
    _marker setmarkerDir _markerDir;
    _marker setmarkerShape _markerShape;
} forEach _markers_properties;
