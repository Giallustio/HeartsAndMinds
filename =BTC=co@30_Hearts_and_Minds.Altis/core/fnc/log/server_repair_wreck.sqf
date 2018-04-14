params ["_veh"];

private _type = typeOf _veh;
(getPosASL _veh) params ["_x", "_y", "_z"];
private _dir = getDir _veh;
private _customization = [_veh] call BIS_fnc_getVehicleCustomization;
private _marker = _veh getVariable ["marker", ""];

btc_vehicles = btc_vehicles - [_veh];

if (_marker != "") then {
    deleteMarker _marker;
    remoteExec ["", _marker];
};
deleteVehicle _veh;
sleep 1;
_veh = [_type, [_x, _y, 0.5 + _z], _dir, _customization] call btc_fnc_log_createVehicle;

_veh
