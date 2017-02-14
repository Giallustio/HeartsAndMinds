if (isDedicated) exitWith {};

switch _this do
{
	case 3 :
	{
		private "_task";
		_task = player getVariable ( "task_3" call bis_fnc_taskVar);
		_task setTaskState "FAILED";
		["TaskFailed",["Side mission failed!","Supplies have not been delivered"]] call bis_fnc_showNotification;
		player setVariable [("task_3" call bis_fnc_taskVar),nil];
	};
	case 4 :
	{
		private "_task";
		_task = player getVariable ( "task_4" call bis_fnc_taskVar);
		_task setTaskState "FAILED";
		["TaskFailed",["Side mission failed!","The minefield has not been cleared"]] call bis_fnc_showNotification;
		player setVariable [("task_4" call bis_fnc_taskVar),nil];
	};
	case 5 :
	{
		private "_task";
		_task = player getVariable ( "task_5" call bis_fnc_taskVar);
		_task setTaskState "FAILED";
		["TaskFailed",["Side mission failed!","The vehicle has not been repaired"]] call bis_fnc_showNotification;
		player setVariable [("task_5" call bis_fnc_taskVar),nil];
	};
	case 6 :
	{
		private "_task";
		_task = player getVariable ( "task_6" call bis_fnc_taskVar);
		_task setTaskState "FAILED";
		["TaskFailed",["Side mission failed!","The city has not been conquered"]] call bis_fnc_showNotification;
		player setVariable [("task_6" call bis_fnc_taskVar),nil];
	};
	case 7 :
	{
		private "_task";
		_task = player getVariable ( "task_7" call bis_fnc_taskVar);
		_task setTaskState "FAILED";
		["TaskFailed",["Side mission failed!","The tower has not been destroyed"]] call bis_fnc_showNotification;
		player setVariable [("task_7" call bis_fnc_taskVar),nil];
	};
	case 8 :
	{
		private "_task";
		_task = player getVariable ( "task_8" call bis_fnc_taskVar);
		_task setTaskState "FAILED";
		["TaskFailed",["Side mission failed!","The patient has not been stabilized"]] call bis_fnc_showNotification;
		player setVariable [("task_8" call bis_fnc_taskVar),nil];
	};
	case 9 :
	{
		private "_task";
		_task = player getVariable ( "task_9" call bis_fnc_taskVar);
		_task setTaskState "FAILED";
		["TaskFailed",["Side mission failed!","Checkpoints have not been destroyed"]] call bis_fnc_showNotification;
		player setVariable [("task_9" call bis_fnc_taskVar),nil];
	};
	case 10 :
	{
		private "_task";
		_task = player getVariable ("task_10" call bis_fnc_taskVar);
		_task setTaskState "FAILED";
		["TaskFailed",["Side mission failed!","The patient has not been stabilized"]] call bis_fnc_showNotification;
		player setVariable [("task_10" call bis_fnc_taskVar),nil];
	};
	case 11 :
	{
		private "_task";
		_task = player getVariable ("task_11" call bis_fnc_taskVar);
		_task setTaskState "FAILED";
		["TaskFailed",["Side mission failed!","The underwater generator has not been destroyed"]] call bis_fnc_showNotification;
		player setVariable [("task_11" call bis_fnc_taskVar),nil];
	};
	case 12 :
	{
		private "_task";
		_task = player getVariable ("task_12" call bis_fnc_taskVar);
		_task setTaskState "FAILED";
		["TaskFailed",["Side mission failed!","The armed convoy has not been destroyed"]] call bis_fnc_showNotification;
		player setVariable [("task_12" call bis_fnc_taskVar),nil];
	};
	case 13 :
	{
		private "_task";
		_task = player getVariable ("task_13" call bis_fnc_taskVar);
		_task setTaskState "FAILED";
		["TaskFailed",["Side mission failed!","The pilot has not been rescued"]] call bis_fnc_showNotification;
		player setVariable [("task_13" call bis_fnc_taskVar),nil];
	};
	case 14 :
	{
		private "_task";
		_task = player getVariable ("task_14" call bis_fnc_taskVar);
		_task setTaskState "FAILED";
		["TaskFailed",["Side mission failed!","The officer has not been captured"]] call bis_fnc_showNotification;
		player setVariable [("task_14" call bis_fnc_taskVar),nil];
	};
	case 15 :
	{
		private "_task";
		_task = player getVariable ("task_15" call bis_fnc_taskVar);
		_task setTaskState "FAILED";
		["TaskFailed",["Side mission failed!","The hostage has not been liberated"]] call bis_fnc_showNotification;
		player setVariable [("task_15" call bis_fnc_taskVar),nil];
	};
};