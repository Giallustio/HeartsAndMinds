
private ["_city","_pos","_radius","_hideout","_random_pos","_radius_x","_radius_y","_id"];

_city = objNull;

if (count _this > 0) then {_city = _this;} else {
	private ["_useful","_id"];
	//"NameVillage","NameCity","NameCityCapital","NameLocal","Hill"
	_useful = btc_city_all select {(
			!(_x getVariable ["active",false]) &&
			{_x distance (getMarkerPos btc_respawn_marker) > btc_hideout_safezone} &&
			{!(_x getVariable ["has_ho",false])} &&
			(
				_x getVariable ["type",""] == "NameLocal" ||
				{_x getVariable ["type",""] == "Hill"} ||
				{_x getVariable ["type",""] == "NameVillage"}
			)
		)};
	_city = selectRandom _useful;
};

_radius = (((_city getVariable ["RadiusX",0]) + (_city getVariable ["RadiusY",0]))/2) - 100;

_random_pos = [getPos _city, _radius] call btc_fnc_randomize_pos;
_pos = [_random_pos, 0, 100, 2, 0, 0.5, 0] call BIS_fnc_findSafePos;//5????

if (count _pos == 0) then {_pos = getPos _city;};

_city setpos _pos;
_id = _city getVariable ["id",0];
deleteVehicle (_city getVariable ["trigger_player_side",objNull]);
_radius_x = 400;
_radius_y = _radius_x;
_trigger = createTrigger["EmptyDetector",_pos];
_trigger setTriggerArea[(_radius_x+_radius_y) + btc_city_radius,(_radius_x+_radius_y) + btc_city_radius,0,false];
_trigger setTriggerActivation[str(btc_player_side),"PRESENT",true];
_trigger setTriggerStatements ["this && !btc_db_is_saving", format ["[%1] spawn btc_fnc_city_activate",_id], format ["[%1] spawn btc_fnc_city_de_activate",_id]];
_city setVariable ["trigger_player_side",_trigger];

if (btc_debug) then	{//_debug
	private ["_marker"];
	deleteMarker format ["loc_%1",_id];
	_marker = createmarker [format ["loc_%1",_id],_pos];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerBrush "SolidBorder";
	_marker setMarkerSize [(_radius_x+_radius_y) + btc_city_radius, (_radius_x+_radius_y) + btc_city_radius];
	_marker setMarkerAlpha 0.3;
	if (_city getVariable ["occupied",false]) then {_marker setmarkercolor "colorRed";} else {_marker setmarkercolor "colorGreen";};
	_marker = createmarker [format ["locn_%1",_id],_pos];
	_marker setmarkertype "mil_dot";
	_marker setmarkertext format ["loc_%3 %1 %2 - [%4]", _city getVariable ["name",""],_city getVariable ["type",""],_id,_city getVariable ["occupied",false]];
};

[_pos,(random 360),btc_composition_hideout] call btc_fnc_create_composition;

_hideout = nearestObject [_pos, "C_supplyCrate_F"];
clearWeaponCargoGlobal _hideout;clearItemCargoGlobal _hideout;clearMagazineCargoGlobal _hideout;
_hideout setVariable ["id",btc_hideouts_id];
_hideout setVariable ["rinf_time",time];
_hideout setVariable ["cap_time",(time - btc_hideout_cap_time)];
_hideout setVariable ["assigned_to",_city];

_hideout addEventHandler ["HandleDamage", btc_fnc_mil_hd_hideout];

_city setVariable ["occupied",true];
_city setVariable ["has_ho",true];
_city setVariable ["ho",_hideout];
_city setVariable ["ho_pos",_pos];
_city setVariable ["ho_units_spawned",false];

if (btc_debug) then {
	//Marker _pos = getpos _x;
	createmarker [format ["btc_hideout_%1", _pos], _pos];
	format ["btc_hideout_%1", _pos] setmarkertype "mil_unknown";
	format ["btc_hideout_%1", _pos] setMarkerText format ["Hideout %1", btc_hideouts_id];
	format ["btc_hideout_%1", _pos] setMarkerSize [0.8, 0.8];
	(format ["loc_%1",_city getVariable "id"]) setMarkerColor "ColorRed";
};

if (btc_debug_log) then {diag_log format ["btc_fnc_mil_create_hideout: _this = %1 ; POS %2 ID %3",_this,_pos,btc_hideouts_id];};

btc_hideouts_id = btc_hideouts_id + 1;
btc_hideouts pushBack _hideout;

true