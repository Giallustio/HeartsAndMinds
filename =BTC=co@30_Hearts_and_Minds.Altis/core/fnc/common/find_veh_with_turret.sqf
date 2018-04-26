params ["_veh_array", "_black_list"];

if (_veh_array isEqualTypeAll objNull) then {
    _veh_array = _veh_array apply {typeOf _x};
};

private _veh_with_turret = [];
{
    private _wps = [];
    private _type = _x;
    {
        _wps append ([_type, _x] call btc_fnc_log_getconfigmagazines);
    } forEach [[-1], [0], [0, 0], [0, 1], [1], [2], [0, 2]];
    _wps = _wps - _black_list;

    if !(_wps isEqualTo []) then {
        _veh_with_turret pushBackUnique _x;
    };
} forEach _veh_array;

_veh_with_turret
