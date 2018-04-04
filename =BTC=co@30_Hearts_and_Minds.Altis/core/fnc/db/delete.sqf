private _name = worldName;

profileNamespace setVariable [format ["btc_hm_%1_version", _name], Nil];
profileNamespace setVariable [format ["btc_hm_%1_date", _name], Nil];
profileNamespace setVariable [format ["btc_hm_%1_cities", _name], Nil];
profileNamespace setVariable [format ["btc_hm_%1_ho", _name], Nil];
profileNamespace setVariable [format ["btc_hm_%1_ho_sel", _name], Nil];
profileNamespace setVariable [format ["btc_hm_%1_cache", _name], Nil];
profileNamespace setVariable [format ["btc_hm_%1_rep", _name], Nil];
profileNamespace setVariable [format ["btc_hm_%1_fobs", _name], Nil];
profileNamespace setVariable [format ["btc_hm_%1_vehs", _name], Nil];
profileNamespace setVariable [format ["btc_hm_%1_objs", _name], Nil];
profileNamespace setVariable [format ["btc_hm_%1_markers", _name], Nil];
profileNamespace setVariable [format ["btc_hm_%1_db", _name], Nil];

saveProfileNamespace;

[10] remoteExec ["btc_fnc_show_hint", 0];
