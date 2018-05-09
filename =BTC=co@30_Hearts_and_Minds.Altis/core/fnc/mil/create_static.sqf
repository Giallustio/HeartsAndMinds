params ["_pos", "_type", ["_dir", 0]];

private _static = (selectRandom _type) createVehicle _pos;
_static setDir _dir;
_static setPos _pos;

private _group = createGroup btc_enemy_side;
private _unit_type = selectRandom btc_type_units;
private _gunner = _group createUnit [_unit_type, _pos, [], 0, "NONE"];
[_gunner] joinSilent _group;
_gunner moveInGunner _static;
_gunner setBehaviour "COMBAT";
_gunner setCombatMode "RED";

_gunner call btc_fnc_mil_unit_create;

if (btc_debug_log) then {
    [format ["_this = %1 ; POS %2 _type %3", _this, _pos, typeOf _static], __FILE__, [false]] call btc_fnc_debug_message;
};
