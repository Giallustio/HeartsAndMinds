
/* ----------------------------------------------------------------------------
Function: btc_veh_fnc_inventoryRestore

Description:
    Fill me when you edit me !

Parameters:
    _object - Object to restore inventory. [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_veh_fnc_inventoryRestore;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_object", objNull, [objNull]]
];

private _inventory = _object getVariable ["btc_EDENinventory", []];
if (_inventory isEqualTo []) then {
    private _cfgs = "true" configClasses (configOf _object >> "TransportMagazines");
    private _magazine = _cfgs apply {
        getText (_x >> "magazine")
    };
    private _numberOfItems = _cfgs apply {
        getNumber (_x >> "count")
    };
    _inventory pushBack [_magazine, _numberOfItems];

    private _cfgs = "true" configClasses (configOf _object >> "TransportWeapons");
    private _weapons = _cfgs apply {
        getText (_x >> "weapon")
    };
    private _numberOfItems = _cfgs apply {
        getNumber (_x >> "count")
    };
    private _itemCargo = [];
    {
        for "_i" from 0 to (_x -1) do {
            _itemCargo pushBack [_weapons select _forEachindex,"","","",[],[],""];
        };
    } forEach _numberOfItems;
    _inventory pushBack _itemCargo;

    private _cfgs = "true" configClasses (configOf _object >> "TransportItems");
    private _items = _cfgs apply {
        getText (_x >> "name")
    };
    private _numberOfItems = _cfgs apply {
        getNumber (_x >> "count")
    };
    private _itemCargo = [];
    {
        for "_i" from 0 to (_x -1) do {
            _itemCargo pushBack (_items select _forEachindex);
        };
    } forEach _numberOfItems;
    _inventory pushBack _itemCargo;

    private _cfgs = "true" configClasses (configOf _object >> "TransportBackpacks");
    private _backpacks = _cfgs apply {
        getText (_x >> "backpack")
    };
    private _numberOfItems = _cfgs apply {
        getNumber (_x >> "count")
    };
    {
        for "_i" from 0 to (_x -1) do {
            _itemCargo pushBack [_backpacks select _forEachindex];
        };
    } forEach _numberOfItems;
    _inventory pushBack _backpacks;

};

[
    _object,
    _inventory
] call btc_log_fnc_inventorySet;
