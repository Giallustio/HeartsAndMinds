/*
		{(_ui displayCtrl _x) ctrlShow false;} foreach [9995,9996];
		(_ui displayCtrl 9991) ctrlSetText "Stop";
		(_ui displayCtrl 9991) buttonSetAction "[1] spawn btc_fnc_int_orders";
		(_ui displayCtrl 9992) ctrlSetText "Get down";
		(_ui displayCtrl 9992) buttonSetAction "[2] spawn btc_fnc_int_orders";
		(_ui displayCtrl 9994) ctrlSetText "Go away";
		(_ui displayCtrl 9994) buttonSetAction "[3] spawn btc_fnc_int_orders";
		(_ui displayCtrl 9993) ctrlSetText "Hands up";
		(_ui displayCtrl 9993) buttonSetAction "[4] spawn btc_fnc_int_orders";
*/

_pos = _this select 0;
_order = _this select 1;

_units = [];

if (count _this > 2) then {_units = [_this select 2];} else {_units = _pos nearEntities ["Civilian_F", btc_int_radius_orders];};

if (count _units == 0) exitWith {};

{
	if (isNil {group _x getVariable "suicider"}) then {[_x,_order] spawn btc_fnc_int_orders_behaviour;};
} foreach _units;
