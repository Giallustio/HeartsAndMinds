params ["_id"];

private _city = btc_city_all select _id;

if !(_city getVariable ["active", false]) exitWith {};

waitUntil {!(_city getVariable ["activating", false])};

if (btc_debug) then {
    hint ("DE-Activate " + str _this);
};

//Save all and delete
private _radius_x = _city getVariable ["RadiusX", 0];
private _radius_y = _city getVariable ["RadiusY", 0];
private _radius = _radius_x + _radius_y;

private _has_en = _city getVariable ["occupied", false];

if (_has_en) then {
    private _trigger = _city getVariable ["trigger", objNull];
    deleteVehicle _trigger;
    _city setVariable ["trigger", objNull];
};

private _pos_city = getPosWorld _city;
private _data_units = [];
{
    if ((leader _x) inArea [_pos_city, _radius, _radius, 0, false] && {side _x != btc_player_side} && {!(_x getVariable ["no_cache", false])}) then {
        private _data_group = _x call btc_fnc_data_get_group;
        _data_units pushBack _data_group;

        if (btc_debug_log) then {
            [format ["data units = %1", _data_units], __FILE__, [false]] call btc_fnc_debug_message;
        };
    };
} forEach allGroups;

_city setVariable ["data_units", _data_units];
_city setVariable ["active", false];

if (!btc_hideout_cap_checking) then {
    [] spawn btc_fnc_mil_check_cap;
};

call btc_fnc_clean_up;
