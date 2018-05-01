params ["_player"];

_player addEventHandler ["Respawn", btc_fnc_eh_player_respawn];
_player addEventHandler ["CuratorObjectPlaced", btc_fnc_eh_CuratorObjectPlaced];
["ace_treatmentSucceded", btc_fnc_eh_treatment] call CBA_fnc_addEventHandler;
_player addEventHandler ["WeaponAssembled", btc_fnc_civ_add_leaflets];
