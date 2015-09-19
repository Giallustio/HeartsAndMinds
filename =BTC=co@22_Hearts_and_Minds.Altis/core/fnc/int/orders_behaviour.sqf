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

_unit = _this select 0;
_order = _this select 1;
_group = group _unit;

if (_order == _unit getVariable ["order",0]) exitWith {};

_unit setVariable ["order",_order];

while {(count (waypoints _group)) > 0} do
{
	deleteWaypoint ((waypoints _group) select 0);
};

switch (_order) do
{
	case 1 : {doStop _unit;};
	case 2 : {doStop _unit;_unit setUnitPos "DOWN";};
	case 3 : 
	{
		private "_wp_pos";
		_wp_pos = [getPos _unit, 200] call btc_fnc_randomize_pos;
		_unit setUnitPos "UP";
		_unit doMove _wp_pos;
	};
};

waitUntil {sleep 3; (isNull _unit || !Alive _unit || (count (getpos _unit nearEntities ["SoldierWB", 50]) == 0))};

if (isNull _unit || !Alive _unit) exitWith {};

_unit setVariable ["order",nil];
_unit setUnitPos "AUTO";
_unit doMove getPos _unit;
_group spawn btc_fnc_civ_addWP;