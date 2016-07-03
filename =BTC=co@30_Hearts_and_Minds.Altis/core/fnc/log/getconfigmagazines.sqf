/*
 * Author: GitHawk, Jonpas
 * Returns all magazines a turret can hold according to config.
 *
 * Arguments:
 * 0: Target <TYPEOF OBJECT>
 * 1: Turret Path <ARRAY>
 *
 * Return Value:
 * Magazine classes in TurretPath <ARRAY>
 *
 * Example:
 * [typeOf vehicle, [0]] call ace_rearm_fnc_getConfigMagazines
 *
 * Public: No
 */

private ["_target","_turretPath","_cfg"];

_target = _this select 0;
_turretPath = _this select 1;

_cfg = configFile >> "CfgVehicles" >> (_target) >> "Turrets";

if (count _turretPath == 1) then {
    _turretPath params ["_subPath"];

    if (_subPath == -1) exitWith {
        _cfg = configFile >> "CfgVehicles" >> (_target);
    };

    if (count _cfg > _subPath) then {
        _cfg = _cfg select _subPath;
    } else {
        _cfg = nil;
    };
} else {
    _turretPath params ["", "_subPath"];
    if (count _cfg > 0) then {
        _cfg = (_cfg select 0) >> "Turrets";
        if (count _cfg > _subPath) then {
            _cfg = _cfg select _subPath;
        } else {
            _cfg = nil;
        };
    } else {
        _cfg = nil;
    };
};

if (isNil {_cfg}) exitWith {[]};
if !(isClass _cfg) exitWith {[]};

getArray (_cfg  >> "magazines")