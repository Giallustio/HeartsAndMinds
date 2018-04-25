params ["_obj_type", "_veh"];

private _obj = objNull;
private _cargo = _veh getVariable ["cargo", []];
private _found = false;

{
    if (!_found) then {
        if (typeOf _x isEqualTo _obj_type) then {
            _obj = _x;
            _found = true;
        };
    };
} forEach _cargo;

if (isNull _obj) exitWith {hint "null";};

_cargo = _cargo - [_obj];
_veh setVariable ["cargo", _cargo];
_obj setVariable ["loaded", nil];


_obj hideObjectGlobal false;

private _height = getPos _veh select 2;

deTach _obj;
_obj attachTo [_veh, [0, - (sizeOf typeOf _veh + sizeOf _obj_type)/2, -0.2]];
sleep 0.1;
deTach _obj;
_obj allowDamage false;

switch (true) do {
    case (_height >= 20): {
        [_veh, _obj, "B_Parachute_02_F"] spawn btc_fnc_log_paradrop;
    };
    case ((_height < 20) && (_height >= 2)): {
        (getPos _veh) params ["_x", "_y", "_z"];
        _obj setPos [_x, _y, _z -1];
        sleep 0.1;
        [_obj] spawn btc_fnc_log_obj_fall;
    };
    case (_height < 2):    {
        [_obj] call btc_fnc_log_obj_fall;
    };
};

_obj allowDamage true;

_cargo = _veh getVariable "cargo";
_cargo = _cargo - [_obj];
_veh setVariable ["cargo", _cargo];
