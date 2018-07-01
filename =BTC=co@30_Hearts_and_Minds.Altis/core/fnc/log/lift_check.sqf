if (!(vehicle player isKindOf "Helicopter" || (vehicle player isKindOf "Ship")) || !isNull ((vehicle player) getVariable ["cargo", objNull])) exitWith {false};

private _array = [vehicle player] call btc_fnc_log_get_liftable;
if (_array isEqualTo []) exitWith {false};

private _chopper  = vehicle player;
private _cargo_array = nearestObjects [_chopper, _array, 30];
_cargo_array = _cargo_array - [_chopper];
_cargo_array = _cargo_array select {!(
    _x isKindOf "ACE_friesGantry" ||
    (typeOf _x) isEqualTo "ACE_friesAnchorBar" ||
    _x isKindOf "ace_fastroping_helper"
)};

if (_cargo_array isEqualTo []) exitWith {false};
private _cargo = _cargo_array select 0;

private _can_lift = (_array findif {_cargo isKindOf _x} != -1) && speed _cargo < 5;

if !(_can_lift) exitWith {false};

private _cargo_pos = getPosATL _cargo;
(_chopper worldToModel _cargo_pos) params ["_cargo_x", "_cargo_y"];
private _cargo_z   = ((getPosATL _chopper) select 2) - (_cargo_pos select 2);

private _can_lift = ((abs _cargo_z) < btc_lift_max_h) && ((abs _cargo_z) > btc_lift_min_h) && ((abs _cargo_x) < btc_lift_radius) && ((abs _cargo_y) < btc_lift_radius);

_can_lift
