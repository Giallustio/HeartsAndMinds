
private ["_chopper","_array","_cargo_array","_cargo"];

_chopper = vehicle player;
_array = [vehicle player] call btc_fnc_log_get_liftable;
_cargo_array = nearestObjects [_chopper, _array, 30];
_cargo_array = _cargo_array - [_chopper];
if (count _cargo_array > 0 && (typeOf (_cargo_array select 0)) isEqualTo "ACE_friesAnchorBar") then {_cargo_array deleteAt 0;};
if (count _cargo_array > 0) then {_cargo = _cargo_array select 0;} else {_cargo = objNull;};
if (isNull _cargo) exitWith {};

if (!Alive _cargo) exitWith {_cargo spawn btc_fnc_log_lift_hook_fake;};

private ["_rope","_max_cargo","_mass"];

{ropeDestroy _x;} foreach ropes _chopper;

_bbr = boundingBoxReal _cargo;
if (btc_debug) then {hint str(_bbr);};

ropeCreate [vehicle player, "slingload0", _cargo, [((_bbr select 0) select 0), ((_bbr select 1) select 1), 0], 10];
ropeCreate [vehicle player, "slingload0", _cargo, [((_bbr select 0) select 0), ((_bbr select 0) select 1), 0], 10];
ropeCreate [vehicle player, "slingload0", _cargo, [((_bbr select 1) select 0), ((_bbr select 0) select 1), 0], 10];
ropeCreate [vehicle player, "slingload0", _cargo, [((_bbr select 1) select 0), ((_bbr select 1) select 1), 0], 10];

_max_cargo  = getNumber (configFile >> "cfgVehicles" >> typeof _chopper >> "slingLoadMaxCargoMass");
_mass = getMass _cargo;

waitUntil {local _cargo};

if (_mass > _max_cargo) then {
	private "_new_mass";
	_cargo setVariable ["mass",_mass];
	_new_mass = (_max_cargo - 1000);
	if (_new_mass < 0) then {_new_mass = 50;};
	_cargo setMass _new_mass;
	//if (local _cargo) then {_cargo setMass _new_mass;} else {[[_cargo,_new_mass],"btc_fnc_log_set_mass",_cargo] spawn BIS_fnc_MP;};
};

(vehicle player) setVariable ["cargo",_cargo];

btc_lifted = true;

waitUntil {sleep 5; (!Alive player || !Alive _cargo || !btc_lifted || vehicle player == player)};

//if (local _cargo) then {_cargo setMass _mass;} else {[[_cargo,_mass],"btc_fnc_log_set_mass",_cargo] spawn BIS_fnc_MP;};
_cargo setMass _mass;