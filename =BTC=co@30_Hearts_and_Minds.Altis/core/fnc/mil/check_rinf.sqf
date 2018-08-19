
private ["_city","_pos","_hideout"];

_city = objNull;

if (count _this > 0) then {_city = _this;} else {
    private ["_useful","_id"];
    //"NameVillage","NameCity","NameCityCapital","NameLocal","Hill","Airport"
    _useful = btc_city_all select {(
            !(_x getVariable ["active",false]) && {_x distance (getMarkerPos btc_respawn_marker) > btc_hideout_safezone} &&
            {!(_x getVariable ["has_ho",false])} &&
            (
                _x getVariable ["type",""] == "NameLocal" ||
                {_x getVariable ["type",""] == "Hill"} || {_x getVariable ["type",""] == "NameVillage" || {_x getVariable ["type",""] == "Airport"}
            )
        )
    };
    _city = selectRandom _useful;
};

_pos = [getPos _city, 300] call btc_fnc_randomize_pos;
_pos = [_pos, 0, 300, 13, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;

if (count _pos == 0) then {_pos = getPos _city;};

_hideout = [_pos] call btc_fnc_mil_create_hideout_composition;
clearWeaponCargoGlobal _hideout;clearItemCargoGlobal _hideout;clearMagazineCargoGlobal _hideout;
_hideout setVariable ["id",btc_hideouts_id];
_hideout setVariable ["rinf_time",time];
_hideout setVariable ["cap_time",time];
_hideout setVariable ["assigned_to",_city];

_hideout addEventHandler ["HandleDamage", btc_fnc_mil_hd_hideout];

_city setVariable ["has_ho",true];
_city setVariable ["ho_pos",_pos];
_city setVariable ["ho_units_spawned",false];

if (btc_debug) then {
    //Marker
    private ["_marker"];
    _marker = createmarker [format ["btc_hideout_%1", _pos], _pos];
    format ["btc_hideout_%1", _pos] setmarkertypelocal "mil_unknown";
    format ["btc_hideout_%1", _pos] setMarkerTextLocal format ["Hideout %1", btc_hideouts_id];
    format ["btc_hideout_%1", _pos] setMarkerSizeLocal [0.8, 0.8];

};

if (btc_debug_log) then {diag_log format ["btc_fnc_mil_create_hideout: _this = %1 ; POS %2 ID %3",_this,_pos,btc_hideouts_id];};

btc_hideouts_id = btc_hideouts_id + 1;
btc_hideouts pushBack _hideout;