
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_veh_respawn

Description:
    Fill me when you edit me !

Parameters:
    _vehicle - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_eh_veh_respawn;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_vehicle", objNull, [objNull]]
];

private _data = _vehicle getVariable ["data_respawn", []];

[{
    params ["_vehicle", "_data"];

    deleteVehicle _vehicle;
    [{
        params ["_type", "_pos", "_dir", "_time", "_has_marker", ["_customization", [false, false]], "_vectorPos"];

        private _veh = _type createVehicle _pos;
        [_veh, _customization select 0, _customization select 1] call BIS_fnc_initVehicle;
        _veh setDir _dir;
        _veh setPosASL _pos;
        _veh setVectorDirAndUp _vectorPos;
        [_veh, _time, _has_marker] call btc_fnc_eh_veh_add_respawn;
    }, _data, 1] call CBA_fnc_waitAndExecute;
}, [_vehicle, _data], _data select 3] call CBA_fnc_waitAndExecute;
