params ["_city", "_area"];

if (btc_debug_log) then {
    [format ["_name = %1 _area %2", _city getVariable ["name", "name"], _area], __FILE__, [false]] call btc_fnc_debug_message;
};

_pos = position _city;

private _rpos = [_pos, _area] call btc_fnc_randomize_pos;

private _group = createGroup civilian;
private _suicider = _group createUnit [selectRandom btc_civ_type_units, _rpos, [], 0, "CAN_COLLIDE"];

[_group] spawn btc_fnc_civ_addWP;
_group setVariable ["suicider", true];

_suicider call btc_fnc_civ_unit_create;

//Main check
[{
    params ["_args", "_id"];
    _args params ["_suicider"];

    if (Alive _suicider && !isNull _suicider) then {
        if !((getPos _suicider nearEntities ["SoldierWB", 25]) isEqualTo []) then {
            [_id] call CBA_fnc_removePerFrameHandler;
            _suicider call btc_fnc_ied_suicider_active;
        };
    } else {
        [_id] call CBA_fnc_removePerFrameHandler;
    };
}, 5, [_suicider]] call CBA_fnc_addPerFrameHandler;

_suicider
