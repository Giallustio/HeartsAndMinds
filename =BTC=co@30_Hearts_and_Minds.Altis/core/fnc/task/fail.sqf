
if (isServer) exitWith {[str(_this), "FAILED",false] spawn BIS_fnc_taskSetState;};

private ["_description"];

switch _this do
{
	case 3 :
	{
		_description = ["Side mission failed!","Supplies have not been delivered"];
	};
	case 4 :
	{
		_description = ["Side mission failed!","The minefield has not been cleared"];
	};
	case 5 :
	{
		_description = ["Side mission failed!","The vehicle has not been repaired"];
	};
	case 6 :
	{
		_description = ["Side mission failed!","The city has not been conquered"];
	};
	case 7 :
	{
		_description = ["Side mission failed!","The tower has not been destroyed"];
	};
	case 8 :
	{
		_description = ["Side mission failed!","The patient has not been stabilized"];
	};
	case 9 :
	{
		_description = ["Side mission failed!","Checkpoints have not been destroyed"];
	};
	case 10 :
	{
		_description = ["Side mission failed!","The patient has not been stabilized"];
	};
	case 11 :
	{
		_description = ["Side mission failed!","The underwater generator has not been destroyed"];
	};
	case 12 :
	{
		_description = ["Side mission failed!","The armed convoy has not been destroyed"];
	};
	case 13 :
	{
		_description = ["Side mission failed!","The pilot has not been rescued"];
	};
	case 14 :
	{
		_description = ["Side mission failed!","The officer has not been captured"];
	};
	case 15 :
	{
		_description = ["Side mission failed!","The hostage has not been liberated"];
	};
};
["task" + "FAILED" + "Icon",[[[str(_this)] call BIS_fnc_taskType] call bis_fnc_taskTypeIcon, _description select 1]] call bis_fnc_showNotification;