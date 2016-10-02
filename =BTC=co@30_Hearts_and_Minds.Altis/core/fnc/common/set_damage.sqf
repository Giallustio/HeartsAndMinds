/*
Author: SENSEI
Last modified: 10/3/2015
Description: set unit in cardiac arrest
Note: needs delay if called directly after spawning unit
Return: nothing
__________________________________________________________________*/

private ["_unit","_unconsciousTime","_selection","_type"];

_unit = _this select 0;
_selection = [
	"head",
	"body",
	"hand_l",
	"hand_r",
	"leg_l",
	"leg_r"
];
_type = [
	"bullet",
	"grenade",
	"explosive",
	"shell"
];
if (ace_medical_level isEqualTo 1) then {
	_unconsciousTime = 120 + round (random 600);
	[_unit,true,_unconsciousTime,true] call ace_medical_fnc_setUnconscious;
	for "_i" from 0 to 1 do {
		[_unit, 0.1 + (random 0.6), selectRandom _selection, selectRandom _type] call ace_medical_fnc_addDamageToUnit;
	};
	[{
		params ["_args","_id"];
		_args params ["_unit","_time"];

		if (diag_tickTime > _time) exitWith {
			[_id] call CBA_fnc_removePerFrameHandler;
			if !([_unit] call ace_common_fnc_isAwake) then {
				_unit setDamage 1;
			};
		};
	}, 1, [_unit,diag_tickTime + _unconsciousTime]] call CBA_fnc_addPerFrameHandler;
} else {
	[_unit, 0.5] call ace_medical_fnc_adjustPainLevel;
	[_unit,true,10,true] call ace_medical_fnc_setUnconscious;
	[_unit] call ace_medical_fnc_setCardiacArrest;
	[_unit, 0.05 + (random 0.6), selectRandom _selection, selectRandom _type] call ace_medical_fnc_addDamageToUnit;
};