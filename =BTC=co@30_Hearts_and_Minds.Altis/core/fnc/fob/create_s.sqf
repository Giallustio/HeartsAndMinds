params [
    ["_pos", []],
    ["_FOB_name", "FOB "],
    ["_show_hint", true],
    ["_fob_structure", btc_fob_structure],
    ["_fob_flag", btc_fob_flag]
];

private _flag = createVehicle [_fob_flag, _pos, [], 0, "CAN_COLLIDE"];
private _struc = createVehicle [_fob_structure, _pos, [], 0, "CAN_COLLIDE"];

private _marker = createMarker [_FOB_name, _pos];
_FOB_name setMarkerSize [1, 1];
_FOB_name setMarkerType "b_hq";
_FOB_name setMarkerText _FOB_name;
_FOB_name setMarkerColor "ColorBlue";
_FOB_name setMarkerShape "ICON";

(btc_fobs select 0) pushBack _FOB_name;
(btc_fobs select 1) pushBack _struc;
_flag setVariable ["btc_fob", _FOB_name];

if (_show_hint) then {
    [7, _FOB_name] remoteExecCall ["btc_fnc_show_hint", [0, -2] select isDedicated];
};

[_FOB_name, _struc, _flag]
