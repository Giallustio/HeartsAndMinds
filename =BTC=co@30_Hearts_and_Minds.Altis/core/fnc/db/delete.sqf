
private ["_name"];

_name = worldName;

profileNamespace setVariable [format ["btc_hm_%1_version",_name],nil];
profileNamespace setVariable [format ["btc_hm_%1_date",_name],nil];
profileNamespace setVariable [format ["btc_hm_%1_cities",_name],nil];
profileNamespace setVariable [format ["btc_hm_%1_ho",_name],nil];
profileNamespace setVariable [format ["btc_hm_%1_ho_sel",_name],nil];
profileNamespace setVariable [format ["btc_hm_%1_cache",_name],nil];
profileNamespace setVariable [format ["btc_hm_%1_rep",_name],nil];
profileNamespace setVariable [format ["btc_hm_%1_fobs",_name],nil];
profileNamespace setVariable [format ["btc_hm_%1_vehs",_name],nil];
profileNamespace setVariable [format ["btc_hm_%1_objs",_name],nil];
profileNamespace setVariable [format ["btc_hm_%1_markers",_name],nil];
profileNamespace setVariable [format ["btc_hm_%1_db",_name],nil];

saveProfileNamespace;

[10] remoteExec ["btc_fnc_show_hint", 0];