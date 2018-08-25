params ["_vehicles"];

private _typeOf_vehicles = if ((_vehicles select 0) isEqualType objNull) then {
    _vehicles apply {typeOf _x}
} else {
    _vehicles
};

_typeOf_vehicles = _typeOf_vehicles arrayIntersect _typeOf_vehicles;

private _magazines = _typeOf_vehicles apply {
    private _vehicle = _x;
    [
        _vehicle,
        [_vehicle] call ace_rearm_fnc_getAllRearmTurrets apply {
                [_vehicle, _x] call ace_rearm_fnc_getTurretConfigMagazines;
            }
    ]
};

private _magazines_clean = _magazines select {!((_x select 1) isEqualTo [[]])};

private _vehicles_with_turrets = _magazines_clean apply {_x select 0};
_magazines_clean = _magazines_clean apply {_x select 1};

_magazines_clean = _magazines_clean apply {
    private _vehicle_magazines = _x;
    private _array = [];
    {
        _array append _x;
    } forEach _vehicle_magazines;
    _array
};

private _magazines_clean_array = [];
{
    _magazines_clean_array append _x;
} forEach _magazines_clean;


[_vehicles_with_turrets, _magazines_clean_array arrayIntersect _magazines_clean_array]
