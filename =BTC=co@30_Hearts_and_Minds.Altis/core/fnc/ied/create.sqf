
private ["_type","_pos","_dir","_active","_wreck","_ied"];

_pos = _this select 0;
_type = _this select 1;
_dir = _this select 2;
_active = _this select 3;

if (btc_debug_log) then {diag_log format ["CREATE IED %1",_this];};
_wreck = createSimpleObject [_type, _pos];
_wreck setPosATL [ _pos select 0, _pos select 1, 0];
_wreck setDir _dir;
_wreck setVectorUp surfaceNormal _pos;

if (_active) then {
	_ied = createMine [selectRandom btc_type_ieds_ace,[_pos select 0, _pos select 1, -0.07],[],2];
	_ied setVectorUp surfaceNormal _pos;
	[_wreck,_ied] call btc_fnc_ied_fired_near;
} else {
	_ied = objNull;
};

[_wreck,_type,_ied]