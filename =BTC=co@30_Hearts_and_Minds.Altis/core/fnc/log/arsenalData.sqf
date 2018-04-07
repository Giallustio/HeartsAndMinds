btc_custom_arsenal params [["_weapons", []],["_magazines", []],["_items", []],["_backpacks", []]];
private _box = btc_gear_object;

//BIS Arsenal
if (btc_p_arsenal_Type < 3) then {
    if (btc_p_arsenal_Restrict isEqualTo 1) then {
        //add
        [_box, _weapons, false, false] call BIS_fnc_addVirtualWeaponCargo;
        [_box, _magazines, false, false] call BIS_fnc_addVirtualMagazineCargo;
        [_box, _items, false, false] call BIS_fnc_addVirtualItemCargo;
        [_box, _backpacks, false, false] call BIS_fnc_addVirtualBackpackCargo;
    };

    // DO NOT WORK FOR BIS ARSENAL
    if (btc_p_arsenal_Restrict isEqualTo 2) then {
        //remove
        [_box, _weapons, false] call BIS_fnc_removeVirtualWeaponCargo;
        [_box, _magazines, false] call BIS_fnc_removeVirtualMagazineCargo;
        [_box, _items, false] call BIS_fnc_removeVirtualItemCargo;
        [_box, _backpacks, false] call BIS_fnc_removeVirtualBackpackCargo;
    };
};

//ACE Arsenal
if (btc_p_arsenal_Type > 0) then {
    //add
    if (btc_p_arsenal_Restrict isEqualTo 1) then {
        private _aceAdd = [];
        {_aceAdd append _x;} count [_weapons, _magazines, _items, _backpacks];
        [_box, _aceAdd] call ace_arsenal_fnc_addVirtualItems;
    };

    //remove
    if (btc_p_arsenal_Restrict isEqualTo 2) then {
        private _aceRemove = [];
        {_aceRemove append _x;} count [_weapons, _magazines, _items, _backpacks];
        [_box, _aceRemove] call ace_arsenal_fnc_removeVirtualItems;
    };
};
