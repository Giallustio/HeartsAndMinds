params ["_unit"];

//remove "get down" order
[(typeOf _unit), 0,["ACE_MainActions","ACE_GetDown"]] call ace_interact_menu_fnc_removeActionFromClass;

//remove "go away" order
[(typeOf _unit), 0,["ACE_MainActions","ACE_SendAway"]] call ace_interact_menu_fnc_removeActionFromClass;
