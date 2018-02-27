
params ["_object"];

private _data = [];

if !(!isNil {_object getVariable "loaded"} || !Alive _object || isNull _object) then {
        //select 0: Type
        _data pushBack (typeOf _object);
        //select 1: World Pos
        _data pushBack (getPosWorld _object);
        //select 2: Dir
        _data pushBack (getDir _object);
        //select 3: ACE rearm
        _data pushBack (_object getVariable ["ace_rearm_magazineClass",""]);
        //select 4: Cargo
        private _cargo = [];
        {_cargo pushBack [(typeOf _x),(_x getVariable ["ace_rearm_magazineClass",""]),[getWeaponCargo _x,getMagazineCargo _x,getItemCargo _x]]} foreach (_object getVariable ["cargo",[]]);
        _data pushBack _cargo;
        //select 5: Inventory
        private _cont = [getWeaponCargo _object,getMagazineCargo _object,getItemCargo _object];
        _data pushBack _cont;
        //select 6: Vector Pos (Dir and Up)
        _data pushBack [vectorDir _object, vectorUp _object];
};

_data
