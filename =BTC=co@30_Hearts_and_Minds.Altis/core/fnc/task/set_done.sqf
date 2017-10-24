
if (isServer) exitWith {
	[str(_this), "SUCCEEDED",false] spawn BIS_fnc_taskSetState;
	if (_this isEqualTo 1) then {[2] call btc_fnc_task_create};
};

private ["_description"];

switch _this do
{
	case 0 : {
		_description = ["Mission accomplished!","Oplitas have been finally defeated!    Mission accomplished!"];
	};
	case 1 : {
		_description = ["Mission accomplished!","All the hideouts have been destroyed!"];
	};
	case 2 : {
		_description = ["Mission accomplished!","Oplitas have been finally defeated!    Mission accomplished!"];
	};
	case 3 : {
		_description = ["Side mission Accomplished!","Supplies have been delivered"];
	};
	case 4 : {
		_description = ["Side mission Accomplished!","The minefield has been cleared"];
	};
	case 5 : {
		_description = ["Side mission Accomplished!","The vehicle has been repaired"];
	};
	case 6 : {
		_description = ["Side mission Accomplished!","The city has been cleared!"];
	};
	case 7 : {
		_description = ["Side mission Accomplished!","The tower has been destroyed!"];
	};
	case 8 : {
		_description = ["Side mission Accomplished!","The civilian has been stabilized!"];
	};
	case 9 : {
		_description = ["Side mission Accomplished!","Checkpoints have been destroyed!"];
	};
	case 10 : {
		_description = ["Side mission Accomplished!","The civilian has been stabilized!"];
	};
	case 11 : {
		_description = ["Side mission Accomplished!","The underwater generator has been destroyed!"];
	};
	case 12 : {
		_description = ["Side mission Accomplished!","The armed convoy has been destroyed!"];
	};
	case 13 : {
		_description = ["Side mission Accomplished!","The pilot has been rescued!"];
	};
	case 14 : {
		_description = ["Side mission Accomplished!","The officer has been captured!"];
	};
	case 15 : {
		_description = ["Side mission Accomplished!","The hostage has been liberated!"];
	};
	case 16 : {
		_description = ["Side mission Accomplished!","The missile has been hacked!"];
	};
};
["task" + "SUCCEEDED" + "Icon",[[[str(_this)] call BIS_fnc_taskType] call bis_fnc_taskTypeIcon, _description select 1]] call bis_fnc_showNotification;