
/* ----------------------------------------------------------------------------
Function: btc_fnc_db_autoRestart

Description:
    Restart server.

Parameters:
    _p_autoRestart - 0 no auto restart, 1 autorestart, 2 auto save and restart. [Number]
    _serverCommandPassword - Password defineed in server.cfg. [String]

Returns:

Examples:
    (begin example)
        [] call btc_fnc_db_autoRestart;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_p_autoRestart", btc_p_db_autoRestart, [0]],
    ["_serverCommandPassword", btc_db_serverCommandPassword, ""]
];

if (_p_autoRestart isEqualTo 2) then {
    if !(btc_db_is_saving) then {
        btc_db_is_saving = true;
        [] spawn btc_fnc_db_save;
    };
    [{!btc_db_is_saving}, {
        if !(_this serverCommand "#restartserver") then {
            ["STR_STEAM_RESULT_INVALID_PASSWORD", {systemChat localize _this}] remoteExecCall ["call", [0, -2] select isDedicated];
        };
    }, _serverCommandPassword] call CBA_fnc_waitUntilAndExecute;
} else {
    if !(_serverCommandPassword serverCommand "#restartserver") then {
        ["STR_STEAM_RESULT_INVALID_PASSWORD", {systemChat localize _this}] remoteExecCall ["call", [0, -2] select isDedicated];
    };
};
