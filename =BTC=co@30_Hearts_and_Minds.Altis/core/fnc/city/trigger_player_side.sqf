params ["_position", "_radius_x", "_radius_y", "_city", "_has_en", "_name", "_type", "_id"];

private _trigger = createTrigger["EmptyDetector", _position];
_trigger setTriggerArea[_radius_x + _radius_y + btc_city_radius, _radius_x + _radius_y + btc_city_radius, 0, false];
_trigger setTriggerActivation["ANYPLAYER", "PRESENT", true];
_trigger setTriggerStatements [btc_p_trigger, format ["[%1] spawn btc_fnc_city_activate", _id], format ["[%1] call btc_fnc_city_de_activate", _id]];
_city setVariable ["trigger_player_side", _trigger];

if (btc_debug) then {//_debug
    private _marker = createMarker [format ["loc_%1", _id], _position];
    _marker setMarkerShape "ELLIPSE";
    _marker setMarkerBrush "SolidBorder";
    _marker setMarkerSize [_radius_x + _radius_y + btc_city_radius, _radius_x + _radius_y + btc_city_radius];
    _marker setMarkerAlpha 0.3;
    if (_has_en) then {
        _marker setMarkerColor "colorRed";
    } else {
        _marker setMarkerColor "colorGreen";
    };
    _city setVariable ["marker", _marker];

    private _marke = createMarker [format ["locn_%1", _id], _position];
    _marke setMarkerType "mil_dot";
    _marke setMarkerText format ["loc_%3 %1 %2 - [%4] - [%5] ", _name, _type, _id, _has_en, _city getVariable ["hasbeach", "empty"]];
};
