
_this addMPEventHandler ["MPKilled", {
		_this = _this select 0;
		{
			deleteVehicle _x;
		} forEach (_this getVariable ["effects", []]);
		if (isServer) then {
			deleteVehicle _this;
		};
	}];
_this setDamage 1;