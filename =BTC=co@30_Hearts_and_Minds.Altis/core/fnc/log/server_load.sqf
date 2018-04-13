params ["_obj", "_veh"];

_obj hideObjectGlobal true;

private _cargo = _veh getVariable ["cargo", []];
_cargo pushBack _obj;
_veh setVariable ["cargo", _cargo];
_obj setVariable ["loaded", true];
_obj attachTo [btc_log_cargo_repo, [0, 0, btc_log_id_repo]];
btc_log_id_repo = btc_log_id_repo + 15;