
/* ----------------------------------------------------------------------------
Function: btc_db_fnc_load

Description:
    Load database from profileNamespace depends one worldname

Parameters:
    _name - Name of the saved game. [String]

Returns:

Examples:
    (begin example)
        ["Altis"] call btc_db_fnc_load;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_name", worldName, [""]]
];

setDate +(profileNamespace getVariable [format ["btc_hm_%1_date", _name], date]);

//CITIES
private _cities_status = +(profileNamespace getVariable [format ["btc_hm_%1_cities", _name], []]);

{
    _x params ["_id", "_initialized", "_spawn_more", "_occupied", "_data_units", "_has_ho", "_ho_units_spawned", "_ieds", "_has_suicider",
        ["_data_animals", [], [[]]],
        ["_data_tags", [], [[]]],
        ["_civKilled", [], [[]]]
    ];

    private _city = btc_city_all select _id;

    _city setVariable ["initialized", _initialized];
    _city setVariable ["spawn_more", _spawn_more];
    _city setVariable ["occupied", _occupied];
    _city setVariable ["data_units", _data_units];
    _city setVariable ["has_ho", _has_ho];
    _city setVariable ["ho_units_spawned", _ho_units_spawned];
    _city setVariable ["ieds", _ieds];
    _city setVariable ["has_suicider", _has_suicider];
    _city setVariable ["data_animals", _data_animals];
    _city setVariable ["data_tags", _data_tags];
    _city setVariable ["btc_rep_civKilled", _civKilled];

    if (btc_debug) then {
        private _marker = _city getVariable ["marker", ""];
        if (_city getVariable ["occupied", false]) then {
            _marker setMarkerColor "colorRed";
        } else {
            _marker setMarkerColor "colorGreen";
        };
    };
    if (btc_debug_log) then {
        [format ["ID: %1 - IsOccupied %2", _id, _occupied], __FILE__, [false]] call btc_debug_fnc_message;
        [format ["data_city: %1", _x], __FILE__, [false]] call btc_debug_fnc_message;
    };
} forEach _cities_status;

//HIDEOUT
private _array_ho = +(profileNamespace getVariable [format ["btc_hm_%1_ho", _name], []]);

{
    _x call btc_hideout_fnc_create;
} forEach _array_ho;

private _ho = profileNamespace getVariable [format ["btc_hm_%1_ho_sel", _name], 0];
private _select_ho = (btc_hideouts apply {_x getVariable "id"}) find _ho;
if (_select_ho isEqualTo - 1) then {
    btc_hq = objNull;
} else {
    btc_hq = btc_hideouts select _select_ho;
};

if (btc_hideouts isEqualTo []) then {[] spawn btc_fnc_final_phase;};

//CACHE
private _array_cache = +(profileNamespace getVariable [format ["btc_hm_%1_cache", _name], []]);
_array_cache params ["_cache_pos", "_cache_n", "_cache_info", "_cache_markers", "_cache_pictures",
    ["_isChem", false, [true]],
    ["_cache_unitsSpawned", false, [true]]
];

btc_cache_pos = _cache_pos;
btc_cache_n = _cache_n;
btc_cache_info = _cache_info;

[_cache_pos, btc_p_chem, [1, 0] select _isChem] call btc_cache_fnc_create;
btc_cache_obj setVariable ["btc_cache_unitsSpawned", _cache_unitsSpawned];

btc_cache_markers = [];
{
    _x params ["_pos", "_marker_name"];

    [_pos, 0, _marker_name] call btc_info_fnc_cacheMarker;
} forEach _cache_markers;

btc_cache_pictures = _cache_pictures;
{
    (btc_cache_pictures select 2) pushBack ([
        _x,
        btc_cache_n,
        btc_cache_pictures select 1 select _forEachindex
    ] remoteExecCall ["btc_info_fnc_cachePicture", [0, -2] select isDedicated, true]);
} forEach (btc_cache_pictures select 0);

//FOB
private _fobs = +(profileNamespace getVariable [format ["btc_hm_%1_fobs", _name], []]);

{
    _x params ["_fob_name", "_pos", ["_direction", 0, [0]]];

    [_pos, _direction, _fob_name] call btc_fob_fnc_create_s;
} forEach _fobs;

//REP
btc_global_reputation = profileNamespace getVariable [format ["btc_hm_%1_rep", _name], 0];

//Objects
{deleteVehicle _x} forEach (getMissionLayerEntities "btc_vehicles" select 0);
if !(isNil "btc_vehicles") then {
    {deleteVehicle _x} forEach btc_vehicles;
    btc_vehicles = [];
};

private _objs = +(profileNamespace getVariable [format ["btc_hm_%1_objs", _name], []]);
[{ // Can't use ace_cargo for objects created during first frame.
    {
        [_x] call btc_db_fnc_loadObjectStatus;
    } forEach _this;
}, _objs] call CBA_fnc_execNextFrame;

//VEHICLES
private _vehs = +(profileNamespace getVariable [format ["btc_hm_%1_vehs", _name], []]);
[{ // Can't be executed just after because we can't delete and spawn vehicle during the same frame.
    private _loadVehicle = {
        params [
            "_veh_type",
            "_veh_pos",
            "_veh_dir",
            "_veh_fuel",
            "_veh_AllHitPointsDamage",
            "_veh_cargo",
            "_veh_inventory",
            "_customization",
            ["_isMedicalVehicle", false, [false]],
            ["_isRepairVehicle", false, [false]],
            ["_fuelSource", [], [[]]],
            ["_pylons", [], [[]]],
            ["_isContaminated", false, [false]],
            ["_supplyVehicle", [], [[]]],
            ["_EDENinventory", [], [[]]],
            ["_vectorPos", [], [[]]],
            ["_ViV", [], [[]]],
            ["_flagTexture", "", [""]],
            ["_turretMagazines", [], [[]]]
        ];

        if (btc_debug_log) then {
            [format ["_veh = %1", _x], __FILE__, [false]] call btc_debug_fnc_message;
        };

        private _veh = [_veh_type, _veh_pos, _veh_dir, _customization, _isMedicalVehicle, _isRepairVehicle, _fuelSource, _pylons, _isContaminated, _supplyVehicle, _EDENinventory, _veh_AllHitPointsDamage, _flagTexture] call btc_log_fnc_createVehicle;
        _veh setVectorDirAndUp _vectorPos;
        _veh setFuel _veh_fuel;

        [_veh, _turretMagazines] call btc_db_fnc_setTurretMagazines;

        [_veh, _veh_cargo, _veh_inventory] call btc_db_fnc_loadCargo;

        if !(alive _veh) then {
            [_veh, objNull, objNull, nil, false] call btc_veh_fnc_killed;
        };
        if (_ViV isNotEqualTo []) then {
            {
                private _vehToLoad = _x call _loadVehicle;
                if !([_vehToLoad, _veh] call btc_tow_fnc_ViV) then {
                    _vehToLoad setVehiclePosition [_veh, [], 100, "NONE"];
                    private _marker = _vehToLoad getVariable ["marker", ""];
                    if (_marker isNotEqualTo "") then {
                        _marker setMarkerPos _vehToLoad;
                    };
                };
            } forEach _ViV;
        };

        _veh
    };
    {
        _x call _loadVehicle;
    } forEach _this;
}, _vehs] call CBA_fnc_execNextFrame;

//Player Tags
private _tags_properties = +(profileNamespace getVariable [format ["btc_hm_%1_tags", _name], []]);
private _id = ["ace_tagCreated", {
    params ["_tag", "_texture", "_object"];
    btc_tags_player pushBack [_tag, _texture, _object];
}] call CBA_fnc_addEventHandler;
{
    _x params ["_tagPosASL", "_vectorDirAndUp", "_texture", "_typeObject", "_tagModel"];
    private _object = objNull;
    if (_typeObject isNotEqualTo "") then {
        _object = nearestObject [ASLToATL _tagPosASL, _typeObject];
    };
    [_tagPosASL, _vectorDirAndUp, _texture, _object, objNull, "",_tagModel] call ace_tagging_fnc_createTag;
} forEach _tags_properties;
["ace_tagCreated", _id] call CBA_fnc_removeEventHandler;

//Player respawn tickets
if (btc_p_respawn_ticketsAtStart >= 0) then {
    btc_respawn_tickets = +(profileNamespace getVariable [format ["btc_hm_%1_respawnTickets", _name], btc_respawn_tickets]);
    if (btc_p_respawn_ticketsShare) then {
        btc_p_respawn_ticketsAtStart = btc_respawn_tickets getOrDefault [str btc_player_side, btc_p_respawn_ticketsAtStart];
    };

    private _deadBodyPlayers = +(profileNamespace getVariable [format ["btc_hm_%1_deadBodyPlayers", _name], []]);
    private _group = createGroup btc_player_side;
    btc_body_deadPlayers  = _deadBodyPlayers apply {
        _x params ["_type", "_pos", "_dir", "_loadout", "_dogtag", "_isContaminated",
            ["_flagTexture", "", [""]]
        ];
        private _body = _group createUnit [_type, ASLToAGL _pos, [], 0, "CAN_COLLIDE"];
        _body setUnitLoadout _loadout;
        [_body, _dogtag] call btc_body_fnc_dogtagSet;

        if (_isContaminated) then {
            if ((btc_chem_contaminated pushBackUnique _body) > -1) then {
                publicVariable "btc_chem_contaminated";
            };
        };
        _body setDamage 1;
        _body setVariable ["btc_dont_delete", true];
        _body forceFlagTexture _flagTexture;

        [{
            params ["_body", "_dir", "_pos"];
            _body setDir _dir;
            _body setPosASL _pos;
        }, [_body, _dir, _pos], 3] call CBA_fnc_waitAndExecute;

        _body call btc_body_fnc_createMarker;

        _body
    };
    deleteGroup _group;
};

//Player Markers
private _markers_properties = +(profileNamespace getVariable [format ["btc_hm_%1_markers", _name], []]);
{
    _x params ["_markerText", "_markerPos", "_markerColor", "_markerType", "_markerSize", "_markerAlpha", "_markerBrush", "_markerDir", "_markerShape",
        ["_markerPolyline", [], [[]]],
        ["_markerChannel", 0, [0]]
    ];

    private _marker = createMarker [format ["_USER_DEFINED #0/%1/%2", _forEachindex, _markerChannel], _markerPos, _markerChannel];
    _marker setMarkerText _markerText;
    _marker setMarkerColor _markerColor;
    _marker setMarkerType _markerType;
    _marker setMarkerSize _markerSize;
    _marker setMarkerAlpha _markerAlpha;
    _marker setMarkerBrush _markerBrush;
    _marker setMarkerDir _markerDir;
    _marker setMarkerShape _markerShape;
    if (_markerPolyline isNotEqualTo []) then {
        _marker setMarkerPolyline _markerPolyline;
    };
} forEach _markers_properties;
