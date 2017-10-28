
params ["_order", ["_unit", objNull]];

private _gesture = switch (_order) do {
	case 1 : {"gestureFreeze"};
	case 2 : {"gestureCover"};
	case 3 : {"gestureGo"};
	case 4 : {"gestureGo"};
};

player playActionNow _gesture;

private _pos = getpos player;
private _dir = getDir player;
private _units = (_pos nearEntities [["Car","Civilian_F"], btc_int_radius_orders]) apply {driver _x};

if (_units isEqualTo []) exitWith {true};

if (isNull _unit) then {
	[_units, _dir, _order] remoteExec ["btc_fnc_int_orders_give", 2];
} else {
	if (_order isEqualTo 4) then {

		btc_int_ask_data = nil;
		[2,nil,player] remoteExec ["btc_fnc_int_ask_var", 2];
		waitUntil {!(isNil "btc_int_ask_data")};
		private _rep = btc_int_ask_data;

		if (_rep >= 500) then {
			hintSilent "Show me where you want to go with your map.";
			["1", "onMapSingleClick", {
				if (surfaceIsWater _pos) then {
					hintSilent 'Selected area must be on land.';
				} else {
					[[_this select 1], 0, 4, _pos] remoteExec ["btc_fnc_int_orders_give", _this select 1];
					["1", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
				};
			}, [_unit]] call BIS_fnc_addStackedEventHandler;
		} else {
			if (isNil {player getVariable "interpreter"}) exitWith {hint "I can't understand what is saying";};
			private _ran = round random 3;
			private _info_type = switch (true) do {
				case (_ran isEqualTo 0) : {"I hate you ! Get out !"};
				case (_ran isEqualTo 1) : {"Get Out of my car ! You are not welcome."};
				case (_ran isEqualTo 2) : {"I am not a taxi driver !"};
				case (_ran isEqualTo 3) : {"No ! I go where I want ! "};
			};
			_text = format ["%1", _info_type];
			hint _text;
		};
	} else {
		[[_unit], _dir, _order] remoteExec ["btc_fnc_int_orders_give", _unit];
	};
};