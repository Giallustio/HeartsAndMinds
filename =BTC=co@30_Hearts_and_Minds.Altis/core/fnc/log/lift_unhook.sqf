
private ["_chopper","_cargo","_rope"];

_chopper = (vehicle player);
_cargo = _chopper getVariable ["cargo",objNull];

if (isNull _cargo) exitWith {};

if !(isNil {_cargo getVariable "mass"}) then {_cargo setMass (_cargo getVariable "mass")};

btc_lifted = false;

_cargo ropeDetach _rope;

ropeUnwind [_rope, 3, 0];

waitUntil {ropeUnwound _rope};

ropeDestroy _rope;

_chopper setVariable ["cargo",nil];