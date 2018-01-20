
params ["_unit"];

private _selection = [
	"head",
	"body",
	"hand_l",
	"hand_r",
	"leg_l",
	"leg_r"
];
private _type = [
	"bullet",
	"grenade",
	"explosive",
	"shell"
];

for "_i" from 0 to floor random 4 do {
	[_unit, random [0.2, 0.25, 0.3], selectRandom _selection, selectRandom _type] call ace_medical_fnc_addDamageToUnit;
	sleep 1;
};
