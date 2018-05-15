params [
    ["_id", 0],
    ["_target", objNull],
    ["_varName", "btc_int_ask_data"]
];

private _data = switch (_id) do {
    case 0 : {_target getVariable ["active", false];};
    case 1 : {
        private _hd = objNull;
        private _asker = allPlayers select {owner _x isEqualTo remoteExecutedOwner};
        {
            if (_x distance _asker < 3000) then {
                _hd = _x;
            };
        } forEach btc_hideouts;
        _hd;
    };
    case 3 : {_target getVariable ["cargo", []];};
    case 4 : {_target getVariable ["tow", objNull];};
    case 8 : {count btc_hideouts;};
    case 9 : {[_target] call btc_fnc_db_saveObjectStatus;};
    case 10 : {
        private _units = allUnits select {alive _x};
        _units append entities "Car";
        _units append entities "Tank";
        _units append entities "Ship";
        _units append entities "Air";
        _units apply {[_x, owner _x]};
    };
    case 11 : {floor diag_fps;};
    default {missionNamespace getVariable [_id, []];};
};

missionNamespace setVariable [_varName, _data, remoteExecutedOwner];
