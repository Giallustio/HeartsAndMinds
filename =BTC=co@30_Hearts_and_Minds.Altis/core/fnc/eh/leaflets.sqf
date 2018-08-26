params [
    ["_uav", objNull, [objNull]],
    ["_weapon", "", [""]]
];

if (btc_debug) then {
    [format ["%1 fired with %2", typeOf _uav, _weapon], __FILE__, [btc_debug, false]] call btc_fnc_debug_message;
};

if (_weapon isEqualTo "Bomb_Leaflets") then {
    [getPos _uav] remoteExec ["btc_fnc_civ_evacuate", 2];
};
