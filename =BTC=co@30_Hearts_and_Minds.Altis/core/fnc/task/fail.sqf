
if (isServer) exitWith {[str(_this), "FAILED",false] spawn BIS_fnc_taskSetState;};

private ["_description"];

switch _this do
{
	case 3 :
	{
		_description = ["Side mission failed!","Supplies were not delivered"];
	};
	case 4 :
	{
		_description = ["Side mission failed!","The minefield was not cleared"];
	};
	case 5 :
	{
		_description = ["Side mission failed!","The vehicle was not repaired"];
	};
	case 6 :
	{
		_description = ["Side mission failed!","The city was not conquered"];
	};
	case 7 :
	{
		_description = ["Side mission failed!","The tower was not destroyed"];
	};
	case 8 :
	{
		_description = ["Side mission failed!","The patient was not stabilized"];
	};
	case 9 :
	{
		_description = ["Side mission failed!","Checkpoints were not destroyed"];
	};
	case 10 :
	{
		_description = ["Side mission failed!","The patient was not stabilized"];
	};
	case 11 :
	{
		_description = ["Side mission failed!","The underwater generator was not destroyed"];
	};
	case 12 :
	{
		_description = ["Side mission failed!","The armed convoy was not destroyed"];
	};
	case 13 :
	{
		_description = ["Side mission failed!","The pilot was not rescued"];
	};
	case 14 :
	{
		_description = ["Side mission failed!","The officer was not captured"];
	};
	case 15 :
	{
		_description = ["Side mission failed!","The hostage was not liberated"];
	};
	case 16 :
	{
		_description = ["Side mission failed!","The missile was not hacked"];
	};
};
["task" + "FAILED" + "Icon",[[[str(_this)] call BIS_fnc_taskType] call bis_fnc_taskTypeIcon, _description select 1]] call bis_fnc_showNotification;