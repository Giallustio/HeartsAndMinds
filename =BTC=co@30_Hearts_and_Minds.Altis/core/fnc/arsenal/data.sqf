
/* ----------------------------------------------------------------------------
Function: btc_fnc_arsenal_data

Description:
    Fill me when you edit me !

Parameters:
    _box - [Object]
    _arsenalType - [Number]
    _arsenalRestrict - [Number]
    _arsenalData - [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_arsenal_data;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_box", objNull, [objNull]],
    ["_arsenalType", 0, [0]],
    ["_arsenalRestrict", 0, [0]],
    ["_arsenalData", [], [[]]]
];
_arsenalData params [["_weapons", [], [[]]], ["_magazines", [], [[]]], ["_items", [], [[]]], ["_backpacks", [], [[]]]];

//BIS Arsenal
if (_arsenalType < 3) then {
    if (_arsenalRestrict isEqualTo 1) then {
        //add
        [_box, _weapons, false, false] call BIS_fnc_addVirtualWeaponCargo;
        [_box, _magazines, false, false] call BIS_fnc_addVirtualMagazineCargo;
        [_box, _items, false, false] call BIS_fnc_addVirtualItemCargo;
        [_box, _backpacks, false, false] call BIS_fnc_addVirtualBackpackCargo;
    };

    // DO NOT WORK FOR BIS ARSENAL
    if (_arsenalRestrict in [2, 3]) then {
        //remove
        [_box, _weapons, false] call BIS_fnc_removeVirtualWeaponCargo;
        [_box, _magazines, false] call BIS_fnc_removeVirtualMagazineCargo;
        [_box, _items, false] call BIS_fnc_removeVirtualItemCargo;
        [_box, _backpacks, false] call BIS_fnc_removeVirtualBackpackCargo;
    };
};

//ACE Arsenal
if (_arsenalType > 0) then {
    //add
    if (_arsenalRestrict isEqualTo 1) then {
        private _aceAdd = [];
        {_aceAdd append _x;} forEach [_weapons, _magazines, _items, _backpacks];
        [_box, _aceAdd] call ace_arsenal_fnc_addVirtualItems;
    };

    //remove
    if (_arsenalRestrict in [2, 3]) then {
        private _aceRemove = [];
        {_aceRemove append _x;} forEach [_weapons, _magazines, _items, _backpacks];
        [_box, _aceRemove] call ace_arsenal_fnc_removeVirtualItems;
    };
};
