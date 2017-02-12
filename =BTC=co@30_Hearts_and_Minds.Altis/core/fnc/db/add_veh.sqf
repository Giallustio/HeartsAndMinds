
if !(isServer) exitWith {[_this,"btc_fnc_db_add_veh",false] spawn BIS_fnc_MP;};

btc_vehicles pushBackUnique _this;
_this addMPEventHandler ["MPKilled", {if (isServer) then {_this call btc_fnc_eh_veh_killed};}];