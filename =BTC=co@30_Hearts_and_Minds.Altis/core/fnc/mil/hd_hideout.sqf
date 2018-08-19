
private ["_hideout","_damage","_ammo","_explosive"];

_hideout = _this select 0;
_damage = _this select 2;
_ammo = _this select 4;

_explosive = (getNumber(configFile >> "cfgAmmo" >> _ammo >> "explosive") > 0);

if (_explosive && {_damage > 0.6}) then {
    private ["_id","_marker","_city","_array"];

    _id = _hideout getVariable "id";

    for "_i" from 0 to (count btc_hideouts - 1) do {
        if ((btc_hideouts select _i) getVariable "id" == _id) then {btc_hideouts set [_i,0];};
    };
    btc_hideouts = btc_hideouts - [0];

    btc_rep_bonus_hideout spawn btc_fnc_rep_change;

    _marker = createmarker [format ["btc_hideout_%1_destroyed", _id], getpos _hideout];
    _marker setmarkertype "hd_destroy";
    [_marker,"STR_BTC_HAM_O_EH_HDHIDEOUT_MRK",_id] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker]; //Cached %1 destroyed
    _marker setMarkerSize [1, 1];
    _marker setMarkerColor "ColorRed";

    _city = _hideout getVariable ["assigned_to",_hideout];
    _city setVariable ["has_ho",false];

    deleteVehicle (nearestObject [getpos _hideout, "Flag_Red_F"]);
    _hideout setDamage 1;

    _array = _hideout getVariable ["markers",[]];

    {deleteMarker _x} foreach _array;

    if (btc_hq isEqualTo _hideout) then {btc_hq = objNull};

    if (count btc_hideouts == 0) then {[] spawn btc_fnc_final_phase;};

    //Notification
    [2,count btc_hideouts] remoteExec ["btc_fnc_show_hint", 0];
    if (btc_debug_log) then    {diag_log format ["btc_fnc_mil_hd_hideout: _this = %1 ; POS %2 ID %3",_this,getpos _hideout,_id];};
} else {0};
