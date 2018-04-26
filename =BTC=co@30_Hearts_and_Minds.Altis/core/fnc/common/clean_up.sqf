{
    private _obj = _x;
    if (({_x distance _obj < 150} count playableUnits) isEqualTo 0) then {
        deleteVehicle _obj
    };
} forEach ((allMissionObjects "groundweaponholder") select {!(_x getVariable ["no_cache", false])});
{
    private _dead = _x;
    if (({_x distance _dead < 300} count playableUnits) isEqualTo 0 && _dead getVariable ["btc_dont_delete", false]) then {
        deleteVehicle _dead
    };
} forEach allDead;
{
    if ({alive _x} count units _x isEqualTo 0) then {deleteGroup _x;};
} forEach allGroups;
