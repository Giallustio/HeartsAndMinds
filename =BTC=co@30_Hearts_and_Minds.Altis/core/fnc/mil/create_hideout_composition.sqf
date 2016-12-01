
private ["_type_campfire","_type_bigbox","_type_camonet","_type_power","_type_box"];

_type_campfire = selectRandom btc_type_campfire;
_type_bigbox = selectRandom btc_type_bigbox;
_type_camonet = selectRandom btc_type_camonet;
_type_power = selectRandom btc_type_power;
_type_box = selectRandom btc_type_box;

_btc_composition_hideout = [
	[_type_campfire,0,[-2.30957,-1.02979,0]],
	[selectRandom btc_type_sleepingbag,135.477,[1.41211,-3.62939,0]],
	[selectRandom btc_type_sleepingbag,161.515,[-0.268066,-4.56396,0]],
	[selectRandom btc_type_seat,171.123,[-2.08203,-3.39795,0]],
	[_type_bigbox,121.331,[2.31885,-1.60156,0]],
	[_type_power,77.6499,[0.418945,3.51855,0]],
	[selectRandom btc_type_seat,279.689,[-4.52783,-0.76416,0]],
	["Land_SatelliteAntenna_01_F",304.749,[-3.71973,2.46143,0]],
	[selectRandom btc_type_seat,238.639,[-3.89014,-2.94873,0]],
	[_type_box,36.4913,[-2.65088,-4.5625,0]],
	[selectRandom btc_type_tent,86.984,[3.19922,-4.36133,0]],
	["Flag_Red_F",0,[0,0,0]],
	[selectRandom btc_type_tent,350.903,[-6.27148,-2.34814,0]]
];

if (random 1 > 0.5) then {
	_btc_composition_hideout pushBack [_type_camonet,0,[-0.84668,-2.16113,0]];
};

_btc_composition = [_this select 0,(random 360),_btc_composition_hideout] call btc_fnc_create_composition;

_btc_composition select ((_btc_composition apply {typeOf _x}) find _type_bigbox);
