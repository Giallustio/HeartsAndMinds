
private ["_chopper","_array","_cargo_array","_cargo","_bbr","_rope_length"];

_chopper = vehicle player;
_array = [_chopper] call btc_fnc_log_get_liftable;
_cargo_array = nearestObjects [_chopper, _array, 30];
_cargo_array = _cargo_array - [_chopper];
if (count _cargo_array > 0 && ((_cargo_array select 0) isKindOf "ACE_friesGantry") OR (typeof (_cargo_array select 0) isEqualTo "ACE_friesAnchorBar")) then {_cargo_array deleteAt 0;};
if (count _cargo_array > 0) then {_cargo = _cargo_array select 0;} else {_cargo = objNull;};
if (isNull _cargo) exitWith {};

private ["_rope","_max_cargo","_mass","_support","_bbr_z"];

{ropeDestroy _x;} foreach ropes _chopper;

_bbr = getArray (configfile >> "CfgVehicles" >> typeof _cargo >> "slingLoadCargoMemoryPoints");
if (_bbr isEqualTo [] OR !(_chopper canSlingLoad _cargo)) then {

	_bbr = boundingBoxReal _cargo;
	if (abs((_bbr select 0) select 0) < 5) then {
		_rope_length = 10;
	} else {
		_rope_length = 10 + abs((_bbr select 0) select 0);
	};

	if (!Alive _cargo) then {
		_support = [_cargo, _chopper] call btc_fnc_log_lift_hook_fake;
		_bbr = [(_bbr select 0) apply {_x/2}, (_bbr select 1) apply {_x/2}];
		_bbr_z = _support distance _cargo;
		sleep 0.3;
	} else {
		_support = _cargo;
		_bbr_z = 0;
	};

	ropeCreate [_chopper, "slingload0", _support, [((_bbr select 0) select 0), ((_bbr select 1) select 1), _bbr_z], _rope_length];
	ropeCreate [_chopper, "slingload0", _support, [((_bbr select 0) select 0), ((_bbr select 0) select 1), _bbr_z], _rope_length];
	ropeCreate [_chopper, "slingload0", _support, [((_bbr select 1) select 0), ((_bbr select 0) select 1), _bbr_z], _rope_length];
	ropeCreate [_chopper, "slingload0", _support, [((_bbr select 1) select 0), ((_bbr select 1) select 1), _bbr_z], _rope_length];
} else {
	{
		ropeCreate [_chopper, "slingload0", _cargo, _x, 11];
	} forEach _bbr;
	_rope_length = 10;
};

if (btc_debug) then {hint format ["boundingBoxReal : %1 rope length : %2", _bbr, _rope_length];};

_max_cargo  = getNumber (configFile >> "cfgVehicles" >> typeof _chopper >> "slingLoadMaxCargoMass");
_mass = getMass _cargo;

[_cargo, player] remoteExec ["btc_fnc_set_owner", 2];
if ((_mass + 400) > _max_cargo) then {
	_cargo setVariable ["mass",_mass];
	private _new_mass = (_max_cargo - 1000);
	if (_new_mass < 0) then {_new_mass = 50;};
	[_cargo,_new_mass] remoteExec ["btc_fnc_log_set_mass", _cargo];
};

_chopper setVariable ["cargo",_cargo];

btc_lifted = true;

waitUntil {sleep 5; (!Alive player || !Alive _cargo || !btc_lifted || vehicle player == player)};

[_cargo,_mass] remoteExec ["btc_fnc_log_set_mass", _cargo];