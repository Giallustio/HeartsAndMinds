//https://github.com/sethduda/AdvancedTowing/blob/master/addons/SA_AdvancedTowing/functions/fn_advancedTowingInit.sqf#L323

params ["_vehicle"];

private _cornerPoints = [_vehicle] call btc_fnc_log_get_corner_points;
private _rearCorner = _cornerPoints select 0;
private _rearCorner2 = _cornerPoints select 1;
private _frontCorner = _cornerPoints select 2;
private _frontCorner2 = _cornerPoints select 3;
private _rearHitchPoint = ((_rearCorner vectorDiff _rearCorner2) vectorMultiply 0.5) vectorAdd  _rearCorner2;
private _frontHitchPoint = ((_frontCorner vectorDiff _frontCorner2) vectorMultiply 0.5) vectorAdd  _frontCorner2;

[_frontHitchPoint,_rearHitchPoint];