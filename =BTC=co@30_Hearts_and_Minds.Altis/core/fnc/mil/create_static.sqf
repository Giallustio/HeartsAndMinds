params ["_pos", "_type", ["_dir", 0]];

private _static = (selectRandom _type) createVehicle _pos;
_static setDir _dir;
_static setPos _pos;

private _group = createGroup btc_enemy_side;
private _gunner = _group createUnit [selectRandom btc_type_units, _pos, [], 0, "NONE"];
[_gunner] joinSilent _group;
_gunner moveInGunner _static;
_gunner setBehaviour "COMBAT";
_gunner setCombatMode "RED";

_gunner call btc_fnc_mil_unit_create;

if (btc_debug_log) then {
    diag_log format ["btc_fnc_mil_create_static: _this = %1 ; POS %2 _type %3", _this, _pos, typeOf _static];
};
