
private ["_units","_color","_text","_typeof","_has_headless","_owners","_alpha"];

_has_headless = !((entities "HeadlessClient_F") isEqualTo []);

if (_has_headless) then {
	_units = btc_units_owners apply {_x select 0};
	_owners = btc_units_owners apply {_x select 1};
} else {
	_units = allunits select {Alive _x};
	_units append entities "Car";
	_units append entities "Tank";
	_units append entities "Ship";
	_units append entities "Air";
};

{
	_typeof = typeOf _x;

	_alpha = 1;
	if (_has_headless) then {
		if !((_owners select _foreachindex) isEqualTo 2) then	{
			_alpha = 0.3;
		};
	};

	switch (side _x) do {
		case (west) : {_color = [0,0,1,_alpha]};
		case (east) : {_color = [1,0,0,_alpha]};
		case (independent) : {_color = [0,1,0,_alpha]};
		default {_color = [1,1,1,_alpha]};
	};

	if (leader group _x isEqualTo _x) then {
		_text = format ["%1 (%2)", _typeof,group _x getVariable ["btc_patrol_id",group _x getVariable ["btc_traffic_id",""]]];
	} else {
		if ((_x isKindOf "car") OR (_x isKindOf "tank") OR (_x isKindOf "ship")  OR (_x isKindOf "air")) then {
			_text = "";
			_color = [1,0,0.5,_alpha];
		} else {
			_text = format ["%1", _typeof];
		};
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