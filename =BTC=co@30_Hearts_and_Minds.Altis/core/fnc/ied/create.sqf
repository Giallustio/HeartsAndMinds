
private ["_type","_pos","_dir","_active","_wreck","_model_path"];

_pos = _this select 0;
_type = _this select 1;
_dir = _this select 2;
_active = _this select 3;

if (btc_debug_log) then {diag_log format ["CREATE IED %1",_this];};
_model_path = toLower gettext(configfile >> "CfgVehicles" >> _type >> "model");
_wreck = createSimpleObject [_model_path select [1,count _model_path], _pos];
_wreck setPos (_pos vectorAdd (getPosWorld _wreck vectorDiff (_wreck modelToWorld [0,0,0])));
_wreck setDir _dir;

if (_active) then {
	_ied = "ied_type" createVehicle [0,0,0];
	_ied attachTo [_wreck, [0, 0, 0]];
	_wreck spawn btc_fnc_ied_fired_near;
};

[_wreck,_type]