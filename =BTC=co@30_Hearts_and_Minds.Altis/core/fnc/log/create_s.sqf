
private ["_obj","_pos","_vector"];

if (count _this > 1) then {
	_pos = _this select 1;
	_vector = surfaceNormal _pos;
} else {
	_pos = getPosASL btc_create_object_point;
	_vector = vectorUp btc_create_object_point;
};

if (getText (configFile >> "cfgVehicles" >> (_this select 0) >> "displayName") isEqualTo "") then {
	_obj = [btc_create_object_point,(_this select 0)] call ace_rearm_fnc_createDummy;
} else {
	_obj = (_this select 0) createVehicle [0,0,0];
};
_obj setVectorUp _vector;
_obj setPosASL _pos;

if ((_this select 0) isEqualTo "Land_Pod_Heli_Transport_04_medevac_F") then {
	{
		_obj setObjectTextureGlobal [ _foreachindex, _x ];
	} forEach ["a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext01_black_co.paa","a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext02_black_co.paa"];
};
btc_log_obj_created pushBack _obj;
btc_curator addCuratorEditableObjects [[_obj], false];