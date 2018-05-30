params ["_player"];

_player addEventHandler ["Respawn", format ["[%1] call btc_fnc_eh_player_respawn", getPosASL player]];
_player addEventHandler ["CuratorObjectPlaced", btc_fnc_eh_CuratorObjectPlaced];
["ace_treatmentSucceded", btc_fnc_eh_treatment] call CBA_fnc_addEventHandler;
_player addEventHandler ["WeaponAssembled", btc_fnc_civ_add_leaflets];
["ace_unloadCargo", btc_fnc_eh_unLoad] call CBA_fnc_addEventHandler;
