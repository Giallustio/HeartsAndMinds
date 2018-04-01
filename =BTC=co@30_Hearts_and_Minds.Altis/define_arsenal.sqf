/*
    Here you can define w


*/
private _weapons = [
    "arifle_MX_F",
    "arifle_MX_SW_F",
    "arifle_MXC_F"
];
private _magazines = [];
private _items = [
    "H_HelmetB",
    "H_HelmetB_camo",
    "H_HelmetB_paint",
    "H_HelmetB_light",
    "H_HelmetSpecB",
    "H_Booniehat_mcamo",
    "H_Booniehat_khk_hs",
    "H_MilCap_mcamo",
    "G_Combat",
    "G_Lowprofile",
    "G_Shades_Black",
    "G_Shades_Blue",
    "G_Shades_Green",
    "G_Shades_Red",
    "G_Sport_Blackred",
    "G_Sport_Blackyellow",
    "G_Squares_Tinted",
    "G_Tactical_Black",
    "G_Tactical_Clear",
    "G_Bandanna_blk",
    "U_B_CombatUniform_mcam",
    "U_B_CombatUniform_mcam_tshirt",
    "U_B_CombatUniform_mcam_vest",
    "U_B_HeliPilotCoveralls",
    "U_B_CTRG_1",
    "U_B_CTRG_2",
    "U_B_CTRG_3",
    "V_BandollierB_khk",
    "V_BandollierB_blk",
    "V_PlateCarrier1_rgr",
    "V_PlateCarrier2_rgr",
    "V_PlateCarrierGL_rgr",
    "V_PlateCarrierSpec_rgr",
    "V_PlateCarrierL_CTRG",
    "V_PlateCarrierH_CTRG"
];
private _backpacks = [
    "B_AssaultPack_rgr",
	"B_AssaultPack_mcamo",
	"B_Kitbag_rgr",
	"B_Kitbag_mcamo",
	"B_TacticalPack_blk",
	"B_TacticalPack_mcamo"
];

// --- DO NOT EDIT BLOW ---
private _box = btc_gear_object;
//BIS Arsenal
if (btc_p_arsenalType < 3) then {
    if (btc_p_arsenalRestrict isEqualTo 1) then {
        //add
        [_box, _weapons, true, false] call BIS_fnc_addVirtualWeaponCargo;
        [_box, _magazines, true, false] call BIS_fnc_addVirtualMagazineCargo;
        [_box, _items, true, false] call BIS_fnc_addVirtualItemCargo;
        [_box, _addBackpacks, true, false] call BIS_fnc_addVirtualBackpackCargo;
    };

    /* DO NOT WORK FOR BIS ARSENAL
    if (btc_p_arsenalRestrict isEqualTo 2) then {
        //remove
        [_box, _weapons, true] call BIS_fnc_removeVirtualWeaponCargo;
        [_box, _magazines, true] call BIS_fnc_removeVirtualMagazineCargo;
        [_box, _items, true] call BIS_fnc_removeVirtualItemCargo;
        [_box, _removeBackpacks, true] call BIS_fnc_removeVirtualBackpackCargo;
    };
    */
};

//ACE Arsenal
if (btc_p_arsenalType in [2, 4]) then {
    //add
    if (btc_p_arsenalRestrict isEqualTo 1) then {
        private _aceAdd = [];
        {{_aceAdd pushback _x; false} count _x; false} count [_weapons,_magazines,_items,_backpacks];
        [_box, _aceAdd,true] call ace_arsenal_fnc_addVirtualItems;
    };

    //remove
    if (btc_p_arsenalRestrict isEqualTo 2) then {
        private _aceRemove = [];
        {{_aceRemove pushback _x; false} count _x; false} count [_weapons,_magazines,_items,_backpacks];
        [_box, _aceRemove,true] call ace_arsenal_fnc_removeVirtualItems;
    };
};
