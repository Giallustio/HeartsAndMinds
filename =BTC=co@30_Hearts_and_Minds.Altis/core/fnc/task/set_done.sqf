if (isDedicated) exitWith {};

switch _this do
{
	case 0 : {
		private "_task";
		_task = player getVariable ("task_0" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Misison accomplished!","Oplitas has been finally defeated!    Misison accomplished!"]] call bis_fnc_showNotification;

		_task = player getVariable ("task_2" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
	};
	case 1 : {
		private "_task";
		_task = player getVariable ("task_1" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Misison accomplished!","All the hideouts have been destroyed!"]] call bis_fnc_showNotification;

		sleep 1;

		[player,["task_2"],["Size the last positions held by the enemies","Size the last enemies positions","Size the last enemies positions"],objNull,true,1,true,"move",true] call BIS_fnc_taskCreate;
	};
	case 3 : {
		private "_task";
		_task = player getVariable ("task_3" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Side mission Accomplished!","Supplies have been delivered"]] call bis_fnc_showNotification;
		player setVariable ["task_3" call bis_fnc_taskVar,nil];
	};
	case 4 : {
		private "_task";
		_task = player getVariable ("task_4" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Side mission Accomplished!","The minefield has been cleared"]] call bis_fnc_showNotification;
		player setVariable ["task_4" call bis_fnc_taskVar,nil];
	};
	case 5 : {
		private "_task";
		_task = player getVariable ("task_5" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Side mission Accomplished!","The vehicle has been repaired"]] call bis_fnc_showNotification;
		player setVariable ["task_5" call bis_fnc_taskVar,nil];
	};
	case 6 : {
		private "_task";
		_task = player getVariable ("task_6" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Side mission Accomplished!","The city has been cleared!"]] call bis_fnc_showNotification;
		player setVariable ["task_6" call bis_fnc_taskVar,nil];
	};
	case 7 : {
		private "_task";
		_task = player getVariable ("task_7" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Side mission Accomplished!","The tower has been destroyed!"]] call bis_fnc_showNotification;
		player setVariable ["task_7" call bis_fnc_taskVar,nil];
	};
	case 8 : {
		private "_task";
		_task = player getVariable ("task_8" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Side mission Accomplished!","The civilian has been stabilized!"]] call bis_fnc_showNotification;
		player setVariable ["task_8" call bis_fnc_taskVar,nil];
	};
	case 9 : {
		private "_task";
		_task = player getVariable ("task_9" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Side mission Accomplished!","Checkpoints have been destroyed!"]] call bis_fnc_showNotification;
		player setVariable ["task_9" call bis_fnc_taskVar,nil];
	};
	case 10 : {
		private "_task";
		_task = player getVariable ("task_10" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Side mission Accomplished!","The civilian has been stabilized!"]] call bis_fnc_showNotification;
		player setVariable ["task_10" call bis_fnc_taskVar,nil];
	};
	case 11 : {
		private "_task";
		_task = player getVariable ("task_11" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Side mission Accomplished!","The underwater generator has been destroyed!"]] call bis_fnc_showNotification;
		player setVariable ["task_11" call bis_fnc_taskVar,nil];
	};
	case 12 : {
		private "_task";
		_task = player getVariable ("task_12" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Side mission Accomplished!","The armed convoy has been destroyed!"]] call bis_fnc_showNotification;
		player setVariable ["task_12" call bis_fnc_taskVar,nil];
	};
	case 13 : {
		private "_task";
		_task = player getVariable ("task_13" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Side mission Accomplished!","The pilot has been rescued!"]] call bis_fnc_showNotification;
		player setVariable ["task_13" call bis_fnc_taskVar,nil];
	};
	case 14 : {
		private "_task";
		_task = player getVariable ("task_14" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Side mission Accomplished!","The officer has been captured!"]] call bis_fnc_showNotification;
		player setVariable ["task_14" call bis_fnc_taskVar,nil];
	};
	case 15 : {
		private "_task";
		_task = player getVariable ("task_15" call bis_fnc_taskVar);
		_task setTaskState "SUCCEEDED";
		["TaskSucceeded",["Side mission Accomplished!","The hostage has been liberated!"]] call bis_fnc_showNotification;
		player setVariable ["task_15" call bis_fnc_taskVar,nil];
	};
};