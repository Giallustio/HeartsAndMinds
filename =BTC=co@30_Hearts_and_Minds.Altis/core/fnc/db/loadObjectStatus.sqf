
/* ----------------------------------------------------------------------------
Function: btc_fnc_db_loadObjectStatus

Description:
    Fill me when you edit me !

Parameters:
    _object_data - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_db_loadObjectStatus;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_object_data", [], [[]]]
];
_object_data params ["_type", "_posWorld", "_dir", "_magClass", "_cargo", "_inventory", "_vectorPos"];

//create object
private _obj = _type createVehicle _posWorld;

_obj setDir _dir;
_obj setPosWorld _posWorld;
_obj setVectorDirAndUp _vectorPos;

if !(_magClass isEqualTo "") then {_obj setVariable ["ace_rearm_magazineClass", _magClass, true]};

[_obj] call btc_fnc_log_init;
[_obj, _cargo, _inventory] call btc_fnc_db_loadCargo;
