
params ["_unit", "_order", "_wp_pos"];

private _group = group _unit;

if (_order == _unit getVariable ["order",0]) exitWith {};

_unit setVariable ["order",_order];

while {(count (waypoints _group)) > 0} do {deleteWaypoint ((waypoints _group) select 0);};

switch (_order) do {
	case 1 : {doStop _unit;};
	case 2 : {
		doStop _unit;
		_unit setUnitPos "DOWN";
		[_unit, format ["AmovP%1MstpSnonWnonDnon_AmovPpneMstpSnonWnonDnon",((animationState _unit) select [5,3])], 1] call ace_common_fnc_doAnimation;
	};
	case 3 : {
		_unit setUnitPos "UP";
		_unit doMove _wp_pos;
	};
	case 4 : {
		_unit doMove _wp_pos;
	};
};

waitUntil {sleep 3; ((!(_order == 4) && (isNull _unit || !Alive _unit || (count (getpos _unit nearEntities ["SoldierWB", 50]) == 0))) || (((getpos _unit) distance _wp_pos < 10)) && (_order == 4)) };

if (isNull _unit || !Alive _unit) exitWith {};

if (_order == 4) then {
	doStop _unit;
	sleep (30 + random 10);
};

_unit setVariable ["order",nil];
_unit setUnitPos "AUTO";
_unit doMove getPos _unit;
_group spawn btc_fnc_civ_addWP;