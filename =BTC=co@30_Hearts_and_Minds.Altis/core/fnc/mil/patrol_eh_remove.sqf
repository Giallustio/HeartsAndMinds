params ["_veh"];

if (_veh getVariable ["eh", []] isEqualTo []) exitWith {true};

(_veh getVariable "eh") params ["_index_fuel_EH"];
_veh removeEventHandler ["Fuel", _index_fuel_EH];
