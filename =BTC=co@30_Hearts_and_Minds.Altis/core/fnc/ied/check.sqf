
private ["_city","_ieds","_ieds_check","_data"];

_city = _this select 0;
_ieds = _this select 1;

if (btc_debug) then {systemChat format ["START IED CHECK CITY ID %1",_city getVariable "id"];};
if (btc_debug_log) then {diag_log format ["START IED CHECK CITY ID %1",_city getVariable "id"];};

_ieds_check = (+ _ieds) select {!((_x select 2) isEqualTo objNull)};

while {_city getVariable ["active", false]} do {
	{
		private ["_ied","_wreck"];
		_wreck = _x select 0;
		_ied = _x select 2;
		if (!isNull _ied && {Alive _ied}) then	{
			_list = _ied nearEntities ["allvehicles", 10];
			{
				if (side _x == btc_player_side && {(speed _x > 5 || vehicle _x != _x)}) then {[_wreck,_ied] spawn btc_fnc_ied_boom;};
			} foreach _list;
		} else {
			_ieds_check = _ieds_check - [_ied];
		};
	} foreach _ieds_check;
	sleep 1;
};

_data = [];

{
	private "_wreck";
	_wreck = _x select 0;
	if (!isNull _wreck && {Alive _wreck}) then {
		_data pushBack [getPosATL _wreck,_x select 1,getDir _wreck,!((_x select 2) isEqualTo objNull)];
		deleteVehicle (_x select 2);deleteVehicle _wreck;};
} foreach _ieds;

_city setVariable ["ieds",_data];

if (btc_debug) then {systemChat format ["END IED CHECK CITY ID %1",_city getVariable "id"];};
if (btc_debug_log) then {diag_log format ["END IED CHECK CITY ID %1",_city getVariable "id"];};