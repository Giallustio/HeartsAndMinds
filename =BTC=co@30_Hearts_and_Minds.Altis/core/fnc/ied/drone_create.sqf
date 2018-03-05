
params ["_city", "_area", ["_rpos", []], ["_group", createGroup [btc_enemy_side, true]]];

if (btc_debug_log) then {
    diag_log format ["btc_fnc_ied_drone_create:  _name = %1 _area %2",_city getVariable ["name","name"],_area];
};

if (_rpos isEqualTo []) then {
    _rpos = [position _city, _area] call btc_fnc_randomize_pos;
};

private _drone = createVehicle ["C_IDAP_UAV_06_antimine_F", _rpos, [], 0, "FLY"];
createVehicleCrew _drone;
[driver _drone] joinSilent _group;
_group setVariable ["btc_ied_drone", true];
{_x call btc_fnc_mil_unit_create} foreach units _group;

[_group, _rpos, _area, 4] call CBA_fnc_taskPatrol;
_drone flyInHeight 10;

//Main check
[{
    params ["_args", "_id"];
    _args params ["_driver_drone", "_rpos", "_area", "_trigger"];

    private _group = group _driver_drone;
    if (Alive _driver_drone && !isNull _driver_drone) then {
        private _array = _driver_drone nearEntities ["SoldierWB", 200];
        if (_array isEqualTo []) then {
            if (waypoints _group isEqualTo []) then {
                [_group, _rpos, _area, 4] call CBA_fnc_taskPatrol;
                (vehicle _driver_drone) flyInHeight 10;
                deleteVehicle (_trigger deleteAt 0);
            };
        } else {
            if (_trigger isEqualTo []) then {
                _trigger pushBack ([_driver_drone] call btc_fnc_ied_drone_active);
            };
            if (btc_debug) then {
                hint format ["Distance with UAV IED : %1", (_array select 0) distance (vehicle _driver_drone)];
            };
            (vehicle _driver_drone) doMove (ASLtoAGL getPosASL (_array select 0));
        };
    } else {
        [_id] call CBA_fnc_removePerFrameHandler;
        deleteVehicle (_trigger deleteAt 0);
        _group setVariable ["btc_ied_drone",false];
        if (btc_debug_log) then {diag_log format ["btc_fnc_ied_drone_active: _driver_drone = %1; POS %2 END LOOP", _driver_drone, getpos _driver_drone];};
    };
}, 5, [driver _drone, _rpos, _area, []]] call CBA_fnc_addPerFrameHandler;

leader _group
