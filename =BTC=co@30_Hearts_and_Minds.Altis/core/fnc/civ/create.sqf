params ["_city", "_area"];

private _pos = [];

switch (typeName _city) do
{
    case "ARRAY": {_pos = _city;};
    case "STRING": {_pos = getMarkerPos _city;};
    case "OBJECT": {_pos = position _city;};
};

private _rpos = [_pos, _area] call btc_fnc_randomize_pos;

private _unit_type = selectRandom btc_civ_type_units;

private _group = createGroup civilian;
_group createUnit [_unit_type, _rpos, [], 0, "NONE"];
(leader _group) setPos _rpos;

[_group] spawn btc_fnc_civ_addWP;

_group setSpeedMode "LIMITED";

{_x call btc_fnc_civ_unit_create} forEach units _group;

if (BTC_debug_log) then {
    diag_log format ["BTC_fnc_civ_create: _this = %1 ; POS %2 UNITS N %3", _this, _pos, count units _group];
};

_group
