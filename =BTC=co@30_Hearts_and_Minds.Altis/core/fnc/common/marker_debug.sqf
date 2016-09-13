
private ["_units","_color","_text","_typeof"];

_units = allunits select {Alive _x};

{
	_typeof = typeOf _x;
	if (leader group _x == _x) then {
		_text = format ["%1 (%2) (%3)", _typeof,group _x getVariable "btc_patrol_id",group _x getVariable "btc_traffic_id"];
	} else {
		_text = format ["%1", _typeof];
	};
	switch (true) do {
		case (side _x == west) : {_color = [0,0,1,1]};
		case (side _x == east) : {_color = [1,0,0,1]};
		case (side _x == independent) : {_color = [0,1,0,1]};
		default {_color = [1,1,1,1]};
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