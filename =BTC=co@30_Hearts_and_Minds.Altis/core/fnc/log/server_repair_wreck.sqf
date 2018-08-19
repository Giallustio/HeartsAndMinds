
private ["_veh","_type","_pos","_dir","_marker","_customization"];

_veh = _this select 0;
_type = typeOf _veh;
_pos = getPosASL _veh;
_dir = getDir _veh;
_customization = [_veh] call BIS_fnc_getVehicleCustomization;
_marker = _veh getVariable ["marker",""];

btc_vehicles = btc_vehicles - [_veh];

if (_marker != "") then {deleteMarker _marker; remoteExec ["", _marker];};
deleteVehicle _veh;
sleep 1;
_veh = [_type,[_pos select 0, _pos select 1, 0.5 + (_pos select 2)],_dir,_customization] call btc_fnc_log_createVehicle;

_veh
