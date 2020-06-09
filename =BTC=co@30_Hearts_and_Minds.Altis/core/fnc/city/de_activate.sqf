
/* ----------------------------------------------------------------------------
Function: btc_fnc_city_de_activate

Description:
    Desactivate the city with the corresponding ID by storing all groups present inside and clean up dead bodies.

Parameters:
    _id - ID of the city to desactivate. [Number]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_city_de_activate;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_id", 0, [0]]
];

private _city = btc_city_all select _id;

if !(_city getVariable ["active", false]) exitWith {};

[{
    params ["_city"];

    !(_city getVariable ["activating", false])
}, {
    params ["_city", "_id"];

    if (btc_debug) then {
        [str _id, __FILE__, [btc_debug, btc_debug_log, true]] call btc_fnc_debug_message;
    };

    //Save all and delete
    private _radius = _city getVariable ["radius", 0];
    private _has_en = _city getVariable ["occupied", false];

    if (_has_en) then {
        private _trigger = _city getVariable ["trigger", objNull];
        deleteVehicle _trigger;
        _city setVariable ["trigger", objNull];
    };

    private _pos_city = getPosWorld _city;
    private _data_units = [];
    private _has_suicider = false;
    {
        if (
            (leader _x) inArea [_pos_city, _radius, _radius, 0, false] &&
            {side _x != btc_player_side} &&
            {!(_x getVariable ["no_cache", false])}
        ) then {
            private _data_group = _x call btc_fnc_data_get_group;
            _data_units pushBack _data_group;

            if ((_data_group select 0) in [5, 7]) then {_has_suicider = true;};

            if (btc_debug_log) then {
                [format ["data units = %1", _data_units], __FILE__, [false]] call btc_fnc_debug_message;
            };
        };
    } forEach allGroups;

    _city setVariable ["has_suicider", _has_suicider];
    _city setVariable ["data_units", _data_units];
    _city setVariable ["active", false];

    if (!btc_hideout_cap_checking) then {
        [] call btc_fnc_mil_check_cap;
    };

    [] call btc_fnc_city_cleanUp;

}, [_city, _id]] call CBA_fnc_waitUntilAndExecute;
