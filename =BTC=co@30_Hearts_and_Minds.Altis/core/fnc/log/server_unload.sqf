
private ["_obj_type","_veh","_obj","_cargo","_found","_height","_obj_fall"];

_obj_type = _this select 0;
_veh = _this select 1;
_obj = objNull;

_cargo = _veh getVariable ["cargo",[]];

_found = false;

{
    if (!_found) then {
        if (typeOf _x == _obj_type) then {
            _obj = _x;
            _found = true;//diag_log format ["_found %1 - _x %2 - _obj %3",_found,_x,_obj];
        };
    };
} foreach _cargo;

if (isNull _obj) exitWith {hint "null";};

_cargo = _cargo - [_obj];
_veh setVariable ["cargo",_cargo];
_obj setVariable ["loaded",nil];


_obj hideObjectGlobal false;

_height = getPos _veh select 2;

deTach _obj;
_obj attachTo [_veh,[0, -(sizeOf typeOf _veh + sizeOf _obj_type)/2,-0.2]];sleep 0.1;deTach _obj;
_obj allowDamage false;

switch (true) do {
    case (_height >= 20): {
        [_veh,_obj,"B_Parachute_02_F"] spawn btc_fnc_log_paradrop;
    };
    case ((_height < 20) && (_height >= 2)): {
        _obj setPos [getpos _obj select 0,getpos _obj select 1,(getpos _obj select 2) -1];
        sleep 0.1;
        _obj_fall = [_obj] spawn btc_fnc_log_obj_fall;
    };
    case (_height < 2):    {
        _obj_fall = [_obj] call btc_fnc_log_obj_fall;
    };
};

_obj allowDamage true;

_cargo = _veh getVariable "cargo";
_cargo = _cargo - [_obj];
_veh setVariable ["cargo",_cargo];