params ["_id", "_target", "_asker"];

private _data = switch (_id) do {
    case 0 : {_target getVariable ["active", false];};
    case 1 : {
        private _hd = objNull;
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

[_data] remoteExec ["btc_fnc_int_ans_var", _asker, false];
