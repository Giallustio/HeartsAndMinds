private _toRemove = ((allMissionObjects "groundweaponholder") select {!(_x getVariable ["no_cache", false])}) select {
    private _obj = _x;

    playableUnits select {_x distance _obj < 150} isEqualTo []
};

_toRemove append (allDead select {
    private _dead = _x;

    (playableUnits select {_x distance _dead < 300}) isEqualTo [] && !(_dead getVariable ["btc_dont_delete", false])
});
_toRemove call CBA_fnc_deleteEntity;

{
    deleteGroup _x;
} forEach (allGroups select {units _x select {alive _x} isEqualTo []});
