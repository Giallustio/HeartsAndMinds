
private ["_city","_pos","_radius","_hideout","_random_pos","_radius_x","_radius_y","_id","_btc_composition_hideout"];

_city = objNull;

if (count _this > 0) then {_city = _this;} else {
    private ["_useful","_id"];
    //"NameVillage","NameCity","NameCityCapital","NameLocal","Hill"
    _useful = btc_city_all select {(
            !(_x getVariable ["active",false]) &&
            {_x distance (getMarkerPos btc_respawn_marker) > btc_hideout_safezone} &&
            {!(_x getVariable ["has_ho",false])} &&
            (
                _x getVariable ["type",""] == "NameLocal" ||
                {_x getVariable ["type",""] == "Hill"} ||
                {_x getVariable ["type",""] == "NameVillage"} ||
                {_x getVariable ["type",""] == "Airport"}
            )
        )};
    _city = selectRandom _useful;
};

_radius = (((_city getVariable ["RadiusX",0]) + (_city getVariable ["RadiusY",0]))/2);
_random_pos = [getPos _city, _radius] call btc_fnc_randomize_pos;
_pos = [_random_pos,0,100,2,false] call btc_fnc_findsafepos;

if (count _pos == 0) then {_pos = getPos _city;};

_city setpos _pos;
_id = _city getVariable ["id",0];
if (btc_debug) then    {deleteMarker format ["loc_%1",_id];};
deleteVehicle (_city getVariable ["trigger_player_side",objNull]);
_radius_x = btc_hideouts_radius;
_radius_y = btc_hideouts_radius;

[_pos,_radius_x,_radius_y,_city,_city getVariable "occupied",_city getVariable "name",_city getVariable "type",_city getVariable "id"] call btc_fnc_city_trigger_player_side;

_city setVariable ["RadiusX",_radius_x];
_city setVariable ["RadiusY",_radius_y];

_hideout = [_pos] call btc_fnc_mil_create_hideout_composition;
clearWeaponCargoGlobal _hideout;clearItemCargoGlobal _hideout;clearMagazineCargoGlobal _hideout;
_hideout setVariable ["id",btc_hideouts_id];
_hideout setVariable ["rinf_time",time];
_hideout setVariable ["cap_time",(time - btc_hideout_cap_time)];
_hideout setVariable ["assigned_to",_city];

_hideout addEventHandler ["HandleDamage", btc_fnc_mil_hd_hideout];

_city setVariable ["occupied",true];
_city setVariable ["has_ho",true];
_city setVariable ["ho",_hideout];
_city setVariable ["ho_pos",_pos];
_city setVariable ["ho_units_spawned",false];

if (btc_debug) then {
    //Marker _pos = getpos _x;
    createmarker [format ["btc_hideout_%1", _pos], _pos];
    format ["btc_hideout_%1", _pos] setmarkertype "mil_unknown";
    format ["btc_hideout_%1", _pos] setMarkerText format ["Hideout %1", btc_hideouts_id];
    format ["btc_hideout_%1", _pos] setMarkerSize [0.8, 0.8];
    (format ["loc_%1",_city getVariable "id"]) setMarkerColor "ColorRed";
};

if (btc_debug_log) then {diag_log format ["btc_fnc_mil_create_hideout: _this = %1 ; POS %2 ID %3",_this,_pos,btc_hideouts_id];};

btc_hideouts_id = btc_hideouts_id + 1;
btc_hideouts pushBack _hideout;

true