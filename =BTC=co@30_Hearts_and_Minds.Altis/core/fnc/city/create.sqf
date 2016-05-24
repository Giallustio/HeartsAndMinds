
private ["_position","_type","_name","_radius_x","_radius_y","_has_en","_id","_city","_trigger"];

_position = _this select 0;
_type = _this select 1;
_name = _this select 2;
_radius_x = _this select 3;
_radius_y = _this select 4;
_has_en = _this select 5;//BOOL
_id = count btc_city_all;

_city = "Land_Ammobox_rounds_F" createVehicle _position;
_city hideObjectGlobal true;
_city allowDamage false;
_city enableSimulation false;
_city setVariable ["activating",false];
_city setVariable ["initialized",false];
_city setVariable ["id",_id];
_city setVariable ["name",_name];
_city setVariable ["RadiusX",_radius_x];
_city setVariable ["RadiusY",_radius_y];
_city setVariable ["active",false];
_city setVariable ["type",_type];
_city setVariable ["spawn_more",false];
_city setVariable ["data_units",[]];
_city setVariable ["occupied",_has_en];

btc_city_all set [_id,_city];
[_position,_radius_x,_radius_y,_city,_has_en,_name,_type,_id] call btc_fnc_city_trigger_player_side;

_city