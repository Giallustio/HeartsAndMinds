private _toRemove = (((allMissionObjects "groundweaponholder") + (entities "WeaponHolderSimulated")) select {!(_x getVariable ["no_cache", false])}) select {
    private _obj = _x;

    playableUnits inAreaArray [getPosWorld _obj, 150, 150] isEqualTo []
};

_toRemove append (allDead select {
    private _dead = _x;

    (playableUnits inAreaArray [getPosWorld _dead, 300, 300]) isEqualTo [] && !(_dead getVariable ["btc_dont_delete", false])
});

_toRemove append (allGroups select {units _x select {alive _x} isEqualTo []});

_toRemove call CBA_fnc_deleteEntity;
