
private ["_FOBname"];

_FOBname = _this getVariable "btc_fob";

hint format ["Dismantle %1",  _FOBname];
[[_this, _FOBname],"btc_fnc_fob_dismantle_s",false] spawn BIS_fnc_MP;