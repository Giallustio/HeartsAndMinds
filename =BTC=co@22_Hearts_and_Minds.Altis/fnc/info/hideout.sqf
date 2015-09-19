
if (count btc_hideouts == 0) exitWith {};

_hd = btc_hq_red getVariable ["info_hideout",objNull];

if (isNull _hd) then
{
	_hd = btc_hideouts select (floor random count btc_hideouts);
	btc_hq_red setVariable ["info_hideout",_hd];
};

_pos = 
[
	(((getPos _hd) select 0) + (random btc_info_hideout_radius - random btc_info_hideout_radius)),
	(((getPos _hd) select 1) + (random btc_info_hideout_radius - random btc_info_hideout_radius))
];

_marker = createmarker [format ["%1", _pos], _pos];
_marker setmarkertype "hd_warning";
_marker setMarkerText format ["%1m", btc_info_hideout_radius];
_marker setMarkerSize [0.5, 0.5];
_marker setMarkerColor "ColorRed";

_array = _hd getVariable ["markers",[]];

_array pushBack _marker;

_hd setVariable ["markers",_array];