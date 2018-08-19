
private ["_radius_x","_radius_y","_marker"];

[6] remoteExec ["btc_fnc_show_hint", 0];

1 remoteExec ["btc_fnc_task_set_done", 0];

btc_final_phase = true;

btc_city_remaining = [];

{
    if (_x getVariable ["type",""] != "NameMarine") then {
        if (_x getVariable ["marker",""] != "") then {deleteMarker (_x getVariable ["marker",""]);};
        _radius_x = _x getVariable ["RadiusX",500];
        _radius_y = _x getVariable ["RadiusY",500];
        _marker = createmarker [format ["city_%1",position _x],position _x];
        _marker setMarkerShape "ELLIPSE";
        _marker setMarkerBrush "SolidBorder";
        _marker setMarkerSize [(_radius_x+_radius_y), (_radius_x+_radius_y)];
        _marker setMarkerAlpha 0.3;
        if (_x getVariable ["occupied",false]) then {_marker setmarkercolor "colorRed";btc_city_remaining pushBack _x;} else {_marker setmarkercolor "colorGreen";_marker setMarkerAlpha 0;};
        _x setVariable ["marker",_marker];
    };
} foreach btc_city_all;

waitUntil {sleep 15; (btc_city_remaining isEqualTo [])};

0 remoteExec ["btc_fnc_task_set_done", 0];
2 call btc_fnc_task_set_done;

//END
[] remoteExec ["btc_fnc_end_mission", 0, true];