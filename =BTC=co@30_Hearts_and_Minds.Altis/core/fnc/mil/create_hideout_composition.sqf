
private ["_type_bigbox","_btc_composition","_btc_composition_hideout"];

_type_bigbox = selectRandom ["Box_FIA_Ammo_F","C_supplyCrate_F","Box_East_AmmoVeh_F"];

_btc_composition_hideout = [
    [selectRandom btc_type_campfire,0,[-2.30957,-1.02979,0]],
    [_type_bigbox,121.331,[0.675781,-1.52539,0]],
    [selectRandom btc_type_bigbox,227.166,[2.66504,1.4126,0]],
    [selectRandom btc_type_sleepingbag,135.477,[0.758789,-3.91309,0]],
    [selectRandom btc_type_power,77.6499,[0.418945,3.51855,0]],
    [selectRandom btc_type_seat,171.123,[-2.08203,-3.39795,0]],
    ["Flag_Red_F",0,[0,0,0]],
    [selectRandom btc_type_sleepingbag,161.515,[-0.726563,-4.76953,0]],
    ["Land_SatelliteAntenna_01_F",304.749,[-3.71973,2.46143,0]],
    [selectRandom btc_type_seat,279.689,[-4.52783,-0.76416,0]],
    [selectRandom btc_type_seat,238.639,[-3.89014,-2.94873,0]],
    [selectRandom btc_type_bigbox,346.664,[3.66455,-1.72998,0]],
    [selectRandom btc_type_box,36.4913,[-2.65088,-4.5625,0]],
    [selectRandom btc_type_tent,86.984,[3.19922,-4.36133,0]],
    [selectRandom btc_type_tent,10,[-4.35303,-5.66309,0]],
    [selectRandom btc_type_tent,300,[-8.47949,-1.64063,0]]
];
if (random 1 > 0.5) then {
    _btc_composition_hideout pushBack [selectRandom btc_type_camonet,0,[-0.84668,-2.16113,0]];
};

_btc_composition = [_this select 0,(random 360),_btc_composition_hideout] call btc_fnc_create_composition;

_btc_composition select ((_btc_composition apply {typeOf _x}) find _type_bigbox);