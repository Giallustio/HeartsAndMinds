params ["_id", ["_target", objNull], ["_varName", "btc_int_ask_data"]];

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
    case 2 : {btc_global_reputation;};
    case 3 : {_target getVariable ["cargo", []];};
    case 4 : {_target getVariable ["tow", objNull];};
    case 5 : {btc_side_jip_data;};
    case 6 : {btc_fobs;};
    case 7 : {btc_construction_array;};
    case 8 : {count btc_hideouts;};
    case 9 : {[_target] call btc_fnc_db_saveObjectStatus;};
};

missionNamespace setVariable [_varName, _data, remoteExecutedOwner];
