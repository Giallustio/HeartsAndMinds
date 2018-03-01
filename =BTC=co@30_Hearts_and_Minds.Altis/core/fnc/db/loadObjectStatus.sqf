params ["_object_data"];
_object_data params ["_type","_posWorld","_dir","_magClass","_cargo","_inventory","_vectorPos"];

//create object
private _obj = _type createVehicle _posWorld;
btc_log_obj_created pushBack _obj;

//give the curator controll of the object
btc_curator addCuratorEditableObjects [[_obj], false];

//set direction
_obj setDir _dir;

//set the position of the object
_obj setPosWorld _posWorld;

//set the vector postion
_obj setVectorDirAndUp _vectorPos;

//set ace magazine classes
if !(_magClass isEqualTo "") then {_obj setVariable ["ace_rearm_magazineClass",_magClass,true]};

//handle cargo
{
    /*private "_l";
    _l = _x createVehicle [0,0,0];
    btc_log_obj_created = btc_log_obj_created + [_l];
    btc_curator addCuratorEditableObjects [[_l], false];
    [_l,_obj] call btc_fnc_log_server_load;*/
    //NEW
    //{_cargo pushBack [(typeOf _x),[getWeaponCargo _x,getMagazineCargo _x,getItemCargo _x]]} foreach (_x getVariable ["cargo",[]]);
    private _type = _x select 0;
    private _cargo_obj = _x select 2;
    private _l = _type createVehicle [0,0,0];
    if ((_x select 1) != "") then {_l setVariable ["ace_rearm_magazineClass",(_x select 1),true]};
    btc_log_obj_created  pushBack _l;
    btc_curator addCuratorEditableObjects [[_l], false];
    clearWeaponCargoGlobal _l;clearItemCargoGlobal _l;clearMagazineCargoGlobal _l;
    private _weap_obj = _cargo_obj select 0;
    if (count _weap_obj > 0) then {
        for "_i" from 0 to ((count (_weap_obj select 0)) - 1) do {
            _l addWeaponCargoGlobal[((_weap_obj select 0) select _i),((_weap_obj select 1) select _i)];
        };
    };
    private _mags_obj = _cargo_obj select 1;
    if (count _mags_obj > 0) then {
        for "_i" from 0 to ((count (_mags_obj select 0)) - 1) do {
            _l addMagazineCargoGlobal[((_mags_obj select 0) select _i),((_mags_obj select 1) select _i)];
        };
    };
    private _items_obj = _cargo_obj select 2;
    if (count _items_obj > 0) then {
        for "_i" from 0 to ((count (_items_obj select 0)) - 1) do {
            _l addItemCargoGlobal[((_items_obj select 0) select _i),((_items_obj select 1) select _i)];
        };
    };
    [_l,_obj] call btc_fnc_log_server_load;
} foreach _cargo;

//set inventory content for weapons, magazines and items
_inventory params ["_weap","_mags","_items"];
clearWeaponCargoGlobal _obj;clearItemCargoGlobal _obj;clearMagazineCargoGlobal _obj;
if (count _weap > 0) then {
    for "_i" from 0 to ((count (_weap select 0)) - 1) do {
        _obj addWeaponCargoGlobal[((_weap select 0) select _i),((_weap select 1) select _i)];
    };
};
if (count _mags > 0) then {
    for "_i" from 0 to ((count (_mags select 0)) - 1) do {
        _obj addMagazineCargoGlobal[((_mags select 0) select _i),((_mags select 1) select _i)];
    };
};
if (count _items > 0) then {
    for "_i" from 0 to ((count (_items select 0)) - 1) do {
        _obj addItemCargoGlobal[((_items select 0) select _i),((_items select 1) select _i)];
    };
};

_obj
