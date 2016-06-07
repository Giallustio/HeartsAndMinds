
private ["_useful","_city","_pos","_marker","_wrecks","_generator","_objects","_storagebladder","_area"];

//// Choose a Marine location occupied \\\\
_useful = btc_city_all select {((_x getVariable ["occupied",false]) && (_x getVariable ["type",""] == "NameMarine"))};
if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};

_city = selectRandom _useful;

//// Choose a random position \\\\
_objects = nearestobjects [getpos _city,[], 200];

_objects = _objects select {(!((str(_x) find "wreck") isEqualTo -1) || !((str(_x) find "broken") isEqualTo -1) || !((str(_x) find "rock") isEqualTo -1))};
_objects = _objects select {((getPos _x select 2 < -3) && (((str(_x) find "car") isEqualTo -1) || ((str(_x) find "uaz") isEqualTo -1)))};
_wrecks = _objects select {((str(_x) find "rock") isEqualTo -1)};

if (_wrecks isEqualTo []) then {
	if (_objects isEqualTo []) then {
		_pos = [getPos _city, 0, 100, 13, 2, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;
		_pos = [_pos select 0, _pos select 1, (getTerrainHeightASL [_pos select 0, _pos select 1])];
	} else {
		_pos = getpos (selectRandom _objects);
	};
} else {
	_pos = getpos (selectRandom _wrecks);
};

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;publicVariable "btc_side_assigned";

[[11,_pos,_city getVariable "name"],"btc_fnc_task_create",true] spawn BIS_fnc_MP;

btc_side_jip_data = [11,_pos,_city getVariable "name"];

_city setVariable ["spawn_more",true];

//// Create marker \\\\
_area = createmarker [format ["sm_%1",_pos],_pos];
_area setMarkerShape "ELLIPSE";
_area setMarkerBrush "SolidBorder";
_area setMarkerSize [30, 30];
_area setMarkerAlpha 0.3;
_area setmarkercolor "colorBlue";

_marker = createmarker [format ["sm_2_%1",_pos],_pos];
_marker setmarkertype "hd_flag";
_marker setmarkertext "Generator";
_marker setMarkerSize [0.6, 0.6];


//// Create underwater generator \\\\
_generator = (selectRandom btc_type_generator) createVehicle _pos;
_storagebladder = (selectRandom btc_type_storagebladder) createVehicle [(_pos select 0) + 5, (_pos select 1), _pos select 2];

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || !Alive _generator )};

{deletemarker _x} foreach [_area,_marker];

if (btc_side_aborted || btc_side_failed ) exitWith {
	[11,"btc_fnc_task_fail",true] spawn BIS_fnc_MP;
	btc_side_assigned = false;publicVariable "btc_side_assigned";
	{_x spawn {

		waitUntil {sleep 5; ({_x distance _this < 300} count playableUnits == 0)};

		deleteVehicle _this;
	};} forEach [_generator,_storagebladder];
};

80 call btc_fnc_rep_change;

[11,"btc_fnc_task_set_done",true] spawn BIS_fnc_MP;

{_x spawn {

	waitUntil {sleep 5; ({_x distance _this < 300} count playableUnits == 0)};

	deleteVehicle _this;
};} forEach [_generator,_storagebladder];

btc_side_assigned = false;publicVariable "btc_side_assigned";