
private ["_vehicle","_data"];

_vehicle = _this select 0;
_data = _vehicle getVariable ["data_respawn",[]];

[_vehicle,_data] spawn {
    params ["_vehicle","_data"];
    _data params ["_type", "_pos", "_dir", "_time", "_has_marker", ["_customization", [false, false]]];

    sleep _time;
    deleteVehicle _vehicle;
    sleep 1;
    private _veh = _type createVehicle _pos;
    [_veh, _customization select 0, _customization select 1] call BIS_fnc_initVehicle;
    _veh setDir _dir;
    _veh setPosASL _pos;
    [_veh,_time, _has_marker] spawn btc_fnc_eh_veh_add_respawn;
};
