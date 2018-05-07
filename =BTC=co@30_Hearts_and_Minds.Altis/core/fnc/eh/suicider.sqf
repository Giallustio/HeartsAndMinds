params ["_id"];

if (btc_debug) then {
    systemChat format ["btc_eh_suicider: Suicider killed in city %1", _id];
};
if (btc_debug_log) then {
    [format ["Suicider killed in city %1", _id], __FILE__, [false]] call btc_fnc_debug_message;
};

private _city = btc_city_all select _id;
_city setVariable ["has_suicider", false];
