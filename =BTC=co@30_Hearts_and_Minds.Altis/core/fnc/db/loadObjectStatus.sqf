params ["_object_data"];
_object_data params ["_type", "_posWorld", "_dir", "_magClass", "_cargo", "_inventory", "_vectorPos"];

//create object
private _obj = _type createVehicle _posWorld;
btc_log_obj_created pushBack _obj;

btc_curator addCuratorEditableObjects [[_obj], false];

_obj setDir _dir;
_obj setPosWorld _posWorld;
_obj setVectorDirAndUp _vectorPos;

if !(_magClass isEqualTo "") then {_obj setVariable ["ace_rearm_magazineClass", _magClass, true]};

[_obj, _cargo, _inventory] call btc_fnc_db_loadCargo;
