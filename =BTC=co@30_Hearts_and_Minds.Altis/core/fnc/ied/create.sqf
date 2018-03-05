
params ["_pos", "_type", "_dir","_active"];

if (btc_debug_log) then {diag_log format ["CREATE IED %1",_this];};
private _wreck = createSimpleObject [_type, _pos];
_wreck setPosATL [ _pos select 0, _pos select 1, 0];
_wreck setDir _dir;
_wreck setVectorUp surfaceNormal _pos;

if !(_active) exitWith {[_wreck, _type, objNull]};

private _ied = createMine [selectRandom btc_type_ieds_ace,[_pos select 0, _pos select 1, btc_ied_offset], [], 2];
_ied setVectorUp surfaceNormal _pos;
[_wreck,_ied] call btc_fnc_ied_fired_near;

[_wreck, _type, _ied]