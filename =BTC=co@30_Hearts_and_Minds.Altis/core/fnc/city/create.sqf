
params ["_position","_type","_name","_radius_x","_radius_y","_has_en"];

private _id = count btc_city_all;

private _city = createSimpleObject ["a3\structures_f_epb\items\military\ammobox_rounds_f.p3d", [_position select 0, _position select 1, getTerrainHeightASL _position]];
hideObjectGlobal _city;
_city setVariable ["activating", false];
_city setVariable ["initialized", false];
_city setVariable ["id", _id];
_city setVariable ["name", _name];
_city setVariable ["RadiusX", _radius_x];
_city setVariable ["RadiusY", _radius_y];
_city setVariable ["active", false];
_city setVariable ["type", _type];
_city setVariable ["spawn_more", false];
_city setVariable ["data_units", []];
_city setVariable ["occupied", _has_en];
if (btc_p_sea) then {
    _city setVariable ["hasbeach", ((selectBestPlaces [_position, 0.8*(_radius_x+_radius_y), "sea", 10, 1]) select 0 select 1) isEqualTo 1];
};

btc_city_all set [_id,_city];
[_position,_radius_x,_radius_y,_city,_has_en,_name,_type,_id] call btc_fnc_city_trigger_player_side;

_city
