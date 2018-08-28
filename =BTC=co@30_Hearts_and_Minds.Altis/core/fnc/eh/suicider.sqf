params [
    ["_id", 0, [0]]
];

if (btc_debug || btc_debug_log) then {
    [format ["Suicider killed in city %1", _id], __FILE__, [btc_debug, btc_debug_log]] call btc_fnc_debug_message;
};

private _city = btc_city_all select _id;
_city setVariable ["has_suicider", false];
