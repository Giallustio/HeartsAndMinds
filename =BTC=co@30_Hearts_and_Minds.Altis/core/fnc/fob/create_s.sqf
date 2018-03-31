params ["_mat", "_name"];

private _pos = getPos _mat;
deleteVehicle _mat;

private _struc = createVehicle [btc_fob_structure, [_pos select 0, _pos select 1, -10], [], 0, "NONE"];
private _flag  = createVehicle [btc_fob_flag, _pos, [], 0, "NONE"];

private _h = - 10;
while {_h < 0} do {
    _h = _h + 0.1;
    _struc setPos [_pos select 0, _pos select 1, _h];
    sleep 0.1;
};
{
    _x setPos _pos;
} foreach [_flag, _struc];

private _FOB_name = "FOB " + _name;
private _marker = createMarker [_FOB_name, getPos _flag];

_FOB_name setMarkerSize [1,1];
_FOB_name setMarkerType "b_hq";
_FOB_name setMarkerText _FOB_name;
_FOB_name setMarkerColor "ColorBlue";
_FOB_name setMarkerShape "ICON";

(btc_fobs select 0) pushBack _FOB_name;
(btc_fobs select 1) pushBack _struc;
_flag setVariable ["btc_fob", _FOB_name];
[7, _FOB_name] remoteExec ["btc_fnc_show_hint", 0];
