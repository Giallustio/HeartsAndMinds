
private _toRemove = ((allMissionObjects "groundweaponholder") select {
    private _obj = _x;

    !(_x getVariable ["no_cache", false])}) select {({_x distance _obj < 150} count playableUnits) isEqualTo 0
};

_toRemove append (allDead select {
    private _dead = _x;

    ({_x distance _dead < 300} count playableUnits) isEqualTo 0 && _dead getVariable ["btc_dont_delete", false]
});

_toRemove append (allGroups select {{alive _x} count units _x isEqualTo 0});

[_toRemove] call CBA_fnc_deleteEntity;
