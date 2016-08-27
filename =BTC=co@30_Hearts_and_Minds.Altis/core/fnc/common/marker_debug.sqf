
private ["_units","_color","_text","_typeof","_has_headless","_units_owners","_alpha"];

_units = allunits select {Alive _x};

_has_headless = !((entities "HeadlessClient_F") isEqualTo []);

if (_has_headless) then {
	btc_int_ask_data_owner = nil;
	[8,_units,player] remoteExec ["btc_fnc_int_ask_var",2];
	waitUntil {(!(isNil "btc_int_ask_data_owner"))};
	_units_owners = btc_int_ask_data_owner;
};

{
	_typeof = typeOf _x;
	if (leader group _x == _x) then {
		_text = format ["%1 (%2) (%3)", _typeof,group _x getVariable ["btc_patrol_id",group _x getVariable "btc_traffic_id"]];
	} else {
		_text = format ["%1", _typeof];
	};

	if (_has_headless) then {
		if !((_units_owners select _foreachindex) isEqualTo 2) then	{
			_alpha = 0.3;
		};
	};

	switch (true) do {
		case (side _x == west) : {_color = [0,0,1,_alpha]};
		case (side _x == east) : {_color = [1,0,0,_alpha]};
		case (side _x == independent) : {_color = [0,1,0,_alpha]};
		default {_color = [1,1,1,_alpha]};
	};

	(_this select 0) drawIcon [
		getText (configFile/"CfgVehicles"/ _typeof /"Icon"),
		_color ,
		visiblePosition _x,
		20,
		20,
		direction _x,
		_text,
		0,
		0.05
	];
} foreach _units;