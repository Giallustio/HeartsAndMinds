if (isDedicated) exitWith {};

private ["_location","_destination"];

if (count _this > 1) then {
	_destination = _this select 1;
	_location = _this select 2;
} else {
	_destination = objNull;
	_location = "";
};

switch (_this select 0) do
{
	case 0 :
	{
		[player,["task_0"],["Destroy all the hideouts of the Oplitas and defeat them once and for all","Defeat the Oplitas","Defeat the Oplitas"],_destination,true,2,true,"kill",true] call BIS_fnc_taskCreate;
	};
	case 1 :
	{
		[player,["task_1"],["Destroy all the hideouts of the Oplitas and defeat them once and for all","Destroy all the hideouts","Destroy all the hideouts"],_destination,true,1,true,"destroy",true] call BIS_fnc_taskCreate;
	};
	case 3 :
	{
		[player,["task_3"],[format ["The citizens of %1 are starving to death, bring them some supplies present at the logisitic point!",_location],("Supply " + _location),("Supply " + _location)],_destination,true,3,true,"move",true] call BIS_fnc_taskCreate;
	};
	case 4 :
	{
		[player,["task_4"],[format ["There is a minefield near %1, clear it!",_location],("Minefield near " + _location),("Minefield near " + _location)],_destination,true,3,true,"search",true] call BIS_fnc_taskCreate;
	};
	case 5 :
	{
		[player,["task_5"],[format ["A vehicle damaged by an IED needs assistance near %1! Repair it!",_location],("Vehicle needs assistance near " + _location),("Vehicle needs assistance near " + _location)],_destination,true,3,true,"repair",true] call BIS_fnc_taskCreate;
	};
	case 6 :
	{
		[player,["task_6"],[format ["%1 has been conquered by the Oplitas! Local population is terrorised and is asking for your help!",_location],("Free " + _location),("Free " + _location)],_destination,true,3,true,"attack",true] call BIS_fnc_taskCreate;
	};
	case 7 :
	{
		[player,["task_7"],[format ["A Oplitas radio tower has been located in %1. Local population is asking for your help to destroy it! (Use one M183 explosive satchel)",_location],("Destroy tower in " + _location),("Destroy tower in " + _location)],_destination,true,3,true,"destroy",true] call BIS_fnc_taskCreate;
	};
	case 8 :
	{
		[player,["task_8"],[format ["A civilian is calling for a medic in %1, treat and wait for patient stabilization ",_location],("Medical emergency call in " + _location),("Medical emergency call in " + _location)],_destination,true,3,true,"heal",true] call BIS_fnc_taskCreate;
	};
	case 9 :
	{
		[player,["task_9"],[format ["Checkpoints has been located in %1. Local population is asking for your help to destroy ammo box in all checkpoints!",_location],("Destroy checkpoints in " + _location),("Destroy checkpoints in " + _location)],_destination,true,3,true,"destroy",true] call BIS_fnc_taskCreate;
	};
	case 10 :
	{
		[player,["task_10"],[format ["A civilian is calling for a medic in %1, treat and wait for patient stabilization ",_location],("Medical emergency call in " + _location),("Medical emergency call in " + _location)],_destination,true,3,true,"heal",true] call BIS_fnc_taskCreate;
	};
	case 11 :
	{
		[player,["task_11"],[format ["Underwater generator has been located in %1. Local population is asking for your help to destroy it!",_location],("Destroy underwater generator in " + _location),("Destroy underwater generator in " + _location)],_destination,true,3,true,"destroy",true] call BIS_fnc_taskCreate;
	};
	case 12 :
	{
		[player,["task_12"],[format ["An armed convoy is going to attack %1. Local population is asking for your help to destroy it before!",_location],("Destroy a convoy attacking " + _location),("Destroy a convoy attacking " + _location)],_destination,true,3,true,"attack",true] call BIS_fnc_taskCreate;
	};
	case 13 :
	{
		[player,["task_13"],[format ["A pilot crashed his helicopter near %1. He is asking for your help to rescue him back to base!",_location],("Rescue a pilot near " + _location),("Rescue a pilot near " + _location)],_destination,true,3,true,"navigate",true] call BIS_fnc_taskCreate;
	};
	case 14 :
	{
		[player,["task_14"],[format ["Capture an officer travelling in a secret and fast convoy, then bring him at base. He is terrorising local population!",_location],("Capture officer in secret fast convoy"),("Capture officer in secret fast convoy")],_destination,true,3,true,"run",true] call BIS_fnc_taskCreate;
	};
	case 15 :
	{
		[player,["task_15"],[format ["Liberate a civilian hostage in %1. Local population is asking for your help!",_location],("Liberate hostage near " + _location),("Liberate hostage near " + _location)],_destination,true,3,true,"exit",true] call BIS_fnc_taskCreate;
	};
};