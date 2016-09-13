if (isDedicated) exitWith {};

switch (_this select 0) do
{
	case 0 :
	{
		private "_task";
		_task = player createSimpleTask ["Defeat the Oplitas"];
		_task setSimpleTaskDescription ["Destroy all the hideouts of the Oplitas and defeat them once and for all","Defeat the Oplitas","Defeat the Oplitas"];
		_task setSimpleTaskType "kill";
		player setVariable ["task_0",_task];
		["TaskAssigned",["New task assigned!","Defeat the Oplitas"]] call bis_fnc_showNotification;
	};
	case 1 :
	{
		private "_task";
		_task = player createSimpleTask ["Destroy all the hideouts"];
		_task setSimpleTaskDescription ["Destroy all the hideouts of the Oplitas and defeat them once and for all","Destroy all the hideouts","Destroy all the hideouts"];
		_task setSimpleTaskType "destroy";
		player setVariable ["task_1",_task];
		["TaskAssigned",["New task assigned!","Destroy all the hideouts"]] call bis_fnc_showNotification;
	};
	case 3 :
	{
		private "_task";
		_task = player createSimpleTask [("Supply " + (_this select 2))];
		_task setSimpleTaskDescription [format ["The citizens of %1 are starving to death, bring them some supplies!",(_this select 2)],("Supply " + (_this select 2)),("Supply " + (_this select 2))];
		_task setSimpleTaskDestination (_this select 1);
		_task setSimpleTaskType "move";
		player setVariable ["task_3",_task];
		["TaskAssigned",["New task assigned!",("Supply " + (_this select 2))]] call bis_fnc_showNotification;
	};
	case 4 :
	{
		private "_task";
		_task = player createSimpleTask [("Minefield near " + (_this select 2))];
		_task setSimpleTaskDescription [format ["There is a minefield near %1, clear it!",(_this select 2)],("Minefield near " + (_this select 2)),("Minefield near " + (_this select 2))];
		_task setSimpleTaskDestination (_this select 1);
		_task setSimpleTaskType "search";
		player setVariable ["task_4",_task];
		["TaskAssigned",["New task assigned!",("Clear the minefield near " + (_this select 2))]] call bis_fnc_showNotification;
	};
	case 5 :
	{
		private "_task";
		_task = player createSimpleTask [("Vehicle needs assistance near " + (_this select 2))];
		_task setSimpleTaskDescription [format ["A vehicle damaged by an IED needs assistance near %1!",(_this select 2)],("Vehicle needs assistance near " + (_this select 2)),("Vehicle needs assistance near " + (_this select 2))];
		_task setSimpleTaskDestination (_this select 1);
		_task setSimpleTaskType "repair";
		player setVariable ["task_5",_task];
		["TaskAssigned",["New task assigned!",("Vehicle needs assistance near " + (_this select 2))]] call bis_fnc_showNotification;
	};
	case 6 :
	{
		private "_task";
		_task = player createSimpleTask [("Free " + (_this select 2))];
		_task setSimpleTaskDescription [format ["%1 has been conquered by the Oplitas! Local population is terrorised and is asking for your help!",(_this select 2)],("Free " + (_this select 2)),("Free " + (_this select 2))];
		_task setSimpleTaskDestination (_this select 1);
		_task setSimpleTaskType "attack";
		player setVariable ["task_6",_task];
		["TaskAssigned",["New task assigned!",("Free " + (_this select 2))]] call bis_fnc_showNotification;
	};
	case 7 :
	{
		private "_task";
		_task = player createSimpleTask [("Destroy tower in " + (_this select 2))];
		_task setSimpleTaskDescription [format ["A Oplitas radio tower has been located in %1. Local population is asking for your help to destroy it! (Use one M183 explosive satchel)",(_this select 2)],("Destroy tower in " + (_this select 2)),("Destroy tower in " + (_this select 2))];
		_task setSimpleTaskDestination (_this select 1);
		_task setSimpleTaskType "destroy";
		player setVariable ["task_7",_task];
		["TaskAssigned",["New task assigned!",("Destroy tower in " + (_this select 2))]] call bis_fnc_showNotification;
	};
	case 8 :
	{
		private "_task";
		_task = player createSimpleTask [("Medical emergency call in " + (_this select 2))];
		_task setSimpleTaskDescription [format ["A civilian is calling for a medic in %1, treat and wait for patient stabilization ",(_this select 2)],("Medical emergency call in " + (_this select 2)),("Medical emergency call in " + (_this select 2))];
		_task setSimpleTaskDestination (_this select 1);
		_task setSimpleTaskType "heal";
		player setVariable ["task_8",_task];
		["TaskAssigned",["New task assigned!",("Medical emergency call in " + (_this select 2))]] call bis_fnc_showNotification;
	};
	case 9 :
	{
		private "_task";
		_task = player createSimpleTask [("Destroy checkpoints in " + (_this select 2))];
		_task setSimpleTaskDescription [format ["Checkpoints has been located in %1. Local population is asking for your help to destroy ammo box in checkpoint!",(_this select 2)],("Destroy checkpoints in " + (_this select 2)),("Destroy checkpoints in " + (_this select 2))];
		_task setSimpleTaskDestination (_this select 1);
		_task setSimpleTaskType "destroy";
		player setVariable ["task_9",_task];
		["TaskAssigned",["New task assigned!",("Destroy checkpoints in " + (_this select 2))]] call bis_fnc_showNotification;
	};
	case 10 :
	{
		private "_task";
		_task = player createSimpleTask [("Medical emergency call in " + (_this select 2))];
		_task setSimpleTaskDescription [format ["A civilian is calling for a medic in %1, treat and wait for patient stabilization ",(_this select 2)],("Medical emergency call in " + (_this select 2)),("Medical emergency call in " + (_this select 2))];
		_task setSimpleTaskDestination (_this select 1);
		_task setSimpleTaskType "heal";
		player setVariable ["task_10",_task];
		["TaskAssigned",["New task assigned!",("Medical emergency call in " + (_this select 2))]] call bis_fnc_showNotification;
	};
	case 11 :
	{
		private "_task";
		_task = player createSimpleTask [("Destroy underwater generator in " + (_this select 2))];
		_task setSimpleTaskDescription [format ["Underwater generator has been located in %1. Local population is asking for your help to destroy it!",(_this select 2)],("Destroy underwater generator in " + (_this select 2)),("Destroy underwater generator in " + (_this select 2))];
		_task setSimpleTaskDestination (_this select 1);
		_task setSimpleTaskType "destroy";
		player setVariable ["task_11",_task];
		["TaskAssigned",["New task assigned!",("Destroy underwater generator in " + (_this select 2))]] call bis_fnc_showNotification;
	};
	case 12 :
	{
		private "_task";
		_task = player createSimpleTask [("Destroy a convoy attacking " + (_this select 2))];
		_task setSimpleTaskDescription [format ["An armed convoy is going to attack %1. Local population is asking for your help to destroy it before!",(_this select 2)],("Destroy a convoy attacking " + (_this select 2)),("Destroy a convoy attacking " + (_this select 2))];
		_task setSimpleTaskDestination (_this select 1);
		_task setSimpleTaskType "attack";
		player setVariable ["task_12",_task];
		["TaskAssigned",["New task assigned!",("Destroy a convoy attacking " + (_this select 2))]] call bis_fnc_showNotification;
	};
	case 13 :
	{
		private "_task";
		_task = player createSimpleTask [("Rescue a pilot near " + (_this select 2))];
		_task setSimpleTaskDescription [format ["A pilot crashed his helicopter near %1. He is asking for your help to rescue him back to base!",(_this select 2)],("Rescue a pilot near " + (_this select 2)),("Rescue a pilot near " + (_this select 2))];
		_task setSimpleTaskDestination (_this select 1);
		_task setSimpleTaskType "navigate";
		player setVariable ["task_13",_task];
		["TaskAssigned",["New task assigned!",("Rescue a pilot near " + (_this select 2))]] call bis_fnc_showNotification;
	};
	case 14 :
	{
		private "_task";
		_task = player createSimpleTask [("Capture officer in secret convoy")];
		_task setSimpleTaskDescription [format ["Capture an officer travelling in a secret convoy and bring him at base. He is terrorising local population!",(_this select 2)],("Capture officer in secret convoy"),("Capture officer in secret convoy")];
		_task setSimpleTaskDestination (_this select 1);
		_task setSimpleTaskType "run";
		player setVariable ["task_14",_task];
		["TaskAssigned",["New task assigned!",("Capture officer in secret convoy")]] call bis_fnc_showNotification;
	};
	case 15 :
	{
		private "_task";
		_task = player createSimpleTask [("Liberate hostage near " + (_this select 2))];
		_task setSimpleTaskDescription [format ["Liberate a civilian hostage in %1. Local population is asking for your help!",(_this select 2)],("Liberate hostage near " + (_this select 2)),("Liberate hostage near " + (_this select 2))];
		_task setSimpleTaskDestination (_this select 1);
		_task setSimpleTaskType "exit";
		player setVariable ["task_15",_task];
		["TaskAssigned",["New task assigned!",("Liberate hostage near " + (_this select 2))]] call bis_fnc_showNotification;
	};
};