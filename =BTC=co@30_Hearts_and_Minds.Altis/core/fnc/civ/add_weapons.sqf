params ["_unit"];

private _hgun = false;

{
    if (_unit distance _x < 50 && {[_x, _unit] call btc_fnc_check_los}) then {
        _hgun = true;
    };
} forEach playableUnits;

private _weapon = [(btc_w_civs select 1), (btc_w_civs select 3)] select _hgun;
private _magazine = [(btc_w_civs select 2), (btc_w_civs select 4)] select _hgun;

(uniformContainer _unit) addMagazineCargo [_magazine, 10];
_unit addWeapon _weapon;
_unit selectWeapon _weapon;
