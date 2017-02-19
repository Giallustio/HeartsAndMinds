
if (!isServer) exitWith {["task" + ([_this select 0] call BIS_fnc_taskState) + "Icon",[[[_this select 0] call BIS_fnc_taskType] call bis_fnc_taskTypeIcon, ([_this select 0] call BIS_fnc_taskDescription) select 1 select 0]] call bis_fnc_showNotification;};

private ["_location","_destination","_description","_type"];

if ((typeName (_this select 0)) isEqualTo "STRING") exitWith {};

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
		_description = ["Defeat the Oplitas once and for all","Defeat the Oplitas","Defeat the Oplitas"];
		_type = "kill";
	};
	case 1 :
	{
		_description = ["Destroy all the hideouts of the Oplitas","Destroy all the hideouts","Destroy all the hideouts"];
		_type = "destroy";
	};
	case 2 :
	{
		_description = ["Seize the last positions held by the enemies","Seize the last enemies positions","Seize the last enemies positions"];
		_type = "move";
	};
	case 3 :
	{
		_description = [format ["The citizens of %1 are starving to death, bring them some supplies present at the logisitic point!",_location],("Supply " + _location),("Supply " + _location)];
		_type = "move";
	};
	case 4 :
	{
		_description = [format ["There is a minefield near %1, clear it!",_location],("Minefield near " + _location),("Minefield near " + _location)];
		_type = "search";
	};
	case 5 :
	{
		_description = [format ["A vehicle damaged by an IED needs assistance near %1! Repair it!",_location],("Vehicle needs assistance near " + _location),("Vehicle needs assistance near " + _location)];
		_type = "repair";
	};
	case 6 :
	{
		_description = [format ["%1 has been conquered by the Oplitas! Local population is terrorised and is asking for your help!",_location],("Free " + _location),("Free " + _location)];
		_type = "attack";
	};
	case 7 :
	{
		_description = [format ["A Oplitas radio tower has been located in %1. Local population is asking for your help to destroy it! (Use one M183 explosive satchel)",_location],("Destroy tower in " + _location),("Destroy tower in " + _location)];
		_type = "destroy";
	};
	case 8 :
	{
		_description = [format ["A civilian is calling for a medic in %1, treat and wait for patient stabilization ",_location],("Medical emergency call in " + _location),("Medical emergency call in " + _location)];
		_type = "heal";
	};
	case 9 :
	{
		_description = [format ["Checkpoints has been located in %1. Local population is asking for your help to destroy ammo box in all checkpoints!",_location],("Destroy checkpoints in " + _location),("Destroy checkpoints in " + _location)];
		_type = "destroy";
	};
	case 10 :
	{
		_description = [format ["A civilian is calling for a medic in %1, treat and wait for patient stabilization ",_location],("Medical emergency call in " + _location),("Medical emergency call in " + _location)];
		_type = "heal";
	};
	case 11 :
	{
		_description = [format ["Underwater generator has been located in %1. Local population is asking for your help to destroy it!",_location],("Destroy underwater generator in " + _location),("Destroy underwater generator in " + _location)];
		_type = "destroy";
	};
	case 12 :
	{
		_description = [format ["An armed convoy is going to attack %1. Local population is asking for your help to destroy it before!",_location],("Destroy a convoy attacking " + _location),("Destroy a convoy attacking " + _location)];
		_type = "attack";
	};
	case 13 :
	{
		_description = [format ["A pilot crashed his helicopter near %1. He is asking for your help to rescue him back to base!",_location],("Rescue a pilot near " + _location),("Rescue a pilot near " + _location)];
		_type = "navigate";
	};
	case 14 :
	{
		_description = [format ["Capture an officer travelling in a secret and fast convoy, then bring him at base. He is terrorising local population!",_location],("Capture officer in secret fast convoy"),("Capture officer in secret fast convoy")];
		_type = "run";
	};
	case 15 :
	{
		_description = [format ["Liberate a civilian hostage in %1. Local population is asking for your help!",_location],("Liberate hostage near " + _location),("Liberate hostage near " + _location)];
		_type = "exit";
	};
};

[btc_player_side,[str(_this select 0)],_description,_destination,true,2,true,_type,true] call BIS_fnc_taskCreate;