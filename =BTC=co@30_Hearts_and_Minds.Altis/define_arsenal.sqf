/*
    Here you can specify which equipment should be added or removed from the arsenal.
    Please take care that there are different categories (weapons, magazines, items, backpacks) for different pieces of equipment into which you have to classify the classnames.
    In all cases, you need the classname of an object.

    Attention: The function of these lists depends on the setting in the mission parameter (Restrict arsenal).
        - "Full": here you have only the registered items in the arsenal available.
        - "Remove only": here all registered items are removed from the arsenal. This only works for the ACE3 arsenal!

    Example(s):
        private _weapons = [
            "arifle_MX_F",          //Classname for the rifle MX
            "arifle_MX_SW_F",       //Classname for the rifle MX LSW
            "arifle_MXC_F"          //Classname for the rifle MXC
        ];

        private _items = [
            "G_Shades_Black",
            "G_Shades_Blue",
            "G_Shades_Green"
        ];
*/
private _weapons = [];
private _magazines = [];
private _items = [];
private _backpacks = [];


// --- DO NOT EDIT BLOW ---
private _box = btc_gear_object;
//BIS Arsenal
if (btc_p_arsenalType < 3) then {
    if (btc_p_arsenalRestrict isEqualTo 1) then {
        //add
        [_box, _weapons, false, false] call BIS_fnc_addVirtualWeaponCargo;
        [_box, _magazines, false, false] call BIS_fnc_addVirtualMagazineCargo;
        [_box, _items, false, false] call BIS_fnc_addVirtualItemCargo;
        [_box, _backpacks, false, false] call BIS_fnc_addVirtualBackpackCargo;
    };

    /* DO NOT WORK FOR BIS ARSENAL
    if (btc_p_arsenalRestrict isEqualTo 2) then {
        //remove
        [_box, _weapons, false] call BIS_fnc_removeVirtualWeaponCargo;
        [_box, _magazines, false] call BIS_fnc_removeVirtualMagazineCargo;
        [_box, _items, false] call BIS_fnc_removeVirtualItemCargo;
        [_box, _backpacks, false] call BIS_fnc_removeVirtualBackpackCargo;
    };
    */
};

//ACE Arsenal
if (btc_p_arsenalType > 0) then {
    //add
    if (btc_p_arsenalRestrict isEqualTo 1) then {
        private _aceAdd = [];
        {{_aceAdd pushback _x; false} count _x; false} count [_weapons,_magazines,_items,_backpacks];
        [_box, _aceAdd] call ace_arsenal_fnc_addVirtualItems;
    };

    //remove
    if (btc_p_arsenalRestrict isEqualTo 2) then {
        private _aceRemove = [];
        {{_aceRemove pushback _x; false} count _x; false} count [_weapons,_magazines,_items,_backpacks];
        [_box, _aceRemove] call ace_arsenal_fnc_removeVirtualItems;
    };
};
