
private _useful = btc_city_all select {((_x getVariable ["type",""] != "NameLocal") && {_x getVariable ["type",""] != "Hill"} && (_x getVariable ["type",""] != "NameMarine"))};

if (_useful isEqualTo []) then {_useful = + btc_city_all;};

private _city = selectRandom _useful;
private _pos = [getPos _city, 0, 500, 30, 0, 60 * (pi / 180), 0] call BIS_fnc_findSafePos;

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
btc_side_assigned = true;publicVariable "btc_side_assigned";

[4, _pos,_city getVariable "name"] remoteExec ["btc_fnc_task_create", 0];

btc_side_jip_data = [4,_pos,_city getVariable "name"];

private _area = createmarker [format ["sm_%1", _pos], _pos];
_area setMarkerShape "RECTANGLE";
_area setMarkerBrush "SolidBorder";
private _area_size = 60;
_area setMarkerSize [_area_size, _area_size];
_area setMarkerAlpha 0.3;
_area setmarkercolor "colorBlue";

private _marker = createmarker [format ["sm_2_%1",_pos],_pos];
_marker setmarkertype "hd_flag";
[_marker,"STR_BTC_HAM_SIDE_MINES_MRK"] remoteExec ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker]; //Mines
_marker setMarkerSize [0.6, 0.6];

//// Randomise composition \\\\
private _cone = selectRandom ["Land_RoadCone_01_F", "RoadCone_F"];
private _fences = ["Land_PlasticNetFence_01_long_F", "RoadBarrier_F", "TapeSign_F"];
_fences pushBack _cone;
private _fence = selectRandom _fences;
private _portable_light = ["Land_PortableLight_double_F", "Land_PortableLight_single_F"];
private _first_aid_kits = ["Land_FirstAidKit_01_open_F", "Land_FirstAidKit_01_closed_F"];

private _allclass = ("true" configClasses (configFile >> "CfgVehicles")) apply {configName _x};
_allclass = _allclass select {(getNumber(configfile >> "CfgVehicles" >> _x >> "scope") isEqualTo 2)};
private _body_bags = _allclass select {(
	(_x isKindOf "Land_Bodybag_01_base_F") ||
	(_x isKindOf "Land_Bodybag_01_empty_base_F") ||
	(_x isKindOf "Land_Bodybag_01_folded_base_F")
)};
private _signs = _allclass select {(_x isKindOf "Land_Sign_Mines_F")};
private _bloods = _allclass select {(_x isKindOf "Blood_01_Base_F")};
private _medicals = _allclass select {(_x isKindOf "MedicalGarbage_01_Base_F")};
//private _signs = ["Land_SignM_WarningMilAreaSmall_english_F", "Land_Sign_MinesTall_Greek_F", "Land_Sign_Mines_F", "Land_Sign_WarningUnexplodedAmmo_F", "Land_Sign_MinesTall_Greek_F", "Land_Sign_MinesTall_F", "TapeSign_F", "Land_Sign_MinesTall_English_F"];
private _composition_pattern = [
	[selectRandom _bloods,81,[56.0991,5.71729,0]],
	[_fence,180,[-0.100586,59.6567,0]],
	[_fence,89,[59.9312,0.149414,0]],
	[_fence,0,[0.0664063,-60.0156,0]],
	[_fence,89,[-60.0195,-0.0229492,0]],
	[_fence,180,[7.91162,59.6299,0]],
	[_fence,180,[-8.0874,59.7124,0]],
	[_fence,89,[59.9341,-7.6,0]],
	[_fence,89,[-60.0166,-8.01172,0]],
	[_fence,0,[8.05518,-60.0176,0]],
	[_fence,0,[-7.94678,-60.0425,0]],
	[_fence,89,[-60.0454,7.99023,0]],
	[_cone,0,[60.3545,5.86768,0]],
	[selectRandom _signs,270.59,[60.3721,7.92432,0]],
	[_cone,0,[60.3755,9.47217,0]],
	[selectRandom _signs,91,[-59.6802,-13.3745,0]],
	[selectRandom _portable_light,101,[61.1982,3.28906,-4.76837e-007]],
	[_fence,180,[15.9023,59.5737,0]],
	[selectRandom _portable_light,37,[60.7373,11.856,0]],
	[_fence,89,[59.9214,15.2153,0]],
	[_fence,180,[-16.1187,59.7456,0]],
	[_fence,89,[59.9521,-15.8672,0]],
	[_fence,89,[-59.9985,-16.0396,0]],
	[_fence,0,[-15.9355,-60.0405,0]],
	[_fence,0,[16.084,-60,0]],
	[_fence,89,[-60.0488,15.9761,0]],
	[selectRandom _bloods,131,[61.9722,5.49609,0]],
	[_fence,0,[62.1094,3.81641,0]],
	[selectRandom _body_bags,332,[62.4473,0.76416,0]],
	[selectRandom _signs,0,[-18.8491,-60.0767,0]],
	[selectRandom _bloods,94,[62.3799,8.66309,0]],
	[_fence,0,[62.2251,11.064,0]],
	[_fence,180,[23.9307,59.5342,0]],
	[_fence,89,[59.9019,23.2441,0]],
	[_fence,180,[-24.1079,59.8008,0]],
	[_fence,89,[59.9541,-23.8569,0]],
	[_fence,89,[-59.9966,-24.0293,0]],
	[_fence,0,[24.0728,-60.002,0]],
	[_fence,0,[-23.9644,-60.0581,0]],
	[_fence,89,[-60.0684,24.0049,0]],
	[selectRandom _signs,92,[-59.7461,24.9878,0]],
	[selectRandom _bloods,0,[65.3276,1.97803,0]],
	[selectRandom _medicals,0,[65.4448,1.52734,0]],
	[selectRandom _first_aid_kits,0,[65.6187,0.109863,0]],
	[selectRandom btc_type_power,223,[63.9292,14.8687,0]],
	[selectRandom (btc_type_barrel + btc_type_canister),0,[66.4707,0.0717773,0]],
	[_fence,180,[31.9204,59.4849,0]],
	[_fence,89,[59.9033,31.2363,0]],
	[_fence,89,[59.9731,-31.8613,0]],
	[_fence,180,[-32.1099,59.8413,0]],
	[_fence,89,[-59.9775,-32.0337,0]],
	[_fence,0,[-31.9531,-60.0562,0]],
	[_fence,0,[32.0781,-59.9858,0]],
	[_fence,89,[-60.0669,31.9971,0]],
	[_fence,89,[59.8833,39.2388,0]],
	[_fence,180,[39.9248,59.4414,0]],
	[selectRandom _signs,0,[39.7676,-59.7939,0]],
	[_fence,89,[59.9727,-39.8521,0]],
	[_fence,180,[-40.0981,59.8965,0]],
	[_fence,89,[-59.978,-40.0244,0]],
	[_fence,0,[40.0669,-59.9878,0]],
	[_fence,0,[-39.9585,-60.0723,0]],
	[_fence,89,[-60.0869,39.9995,0]],
	[selectRandom _signs,89.7217,[-59.5522,-43.2207,0]],
	[_fence,89,[59.8828,47.2271,0]],
	[_fence,180,[47.9146,59.3901,0]],
	[_fence,89,[59.9937,-47.8809,0]],
	[_fence,89,[-59.957,-48.0532,0]],
	[_fence,0,[-47.9473,-60.0703,0]],
	[_fence,180,[-48.1284,59.9307,0]],
	[_fence,0,[48.0957,-59.9702,0]],
	[_fence,89,[-60.0874,47.9878,0]],
	[_fence,89,[59.9077,55.2588,0]],
	[_fence,180,[55.9414,59.3506,0]],
	[_fence,89,[59.9932,-55.8696,0]],
	[_fence,89,[-59.9575,-56.042,0]],
	[_fence,0,[56.0845,-59.9722,0]],
	[_fence,0,[-55.9761,-60.0879,0]],
	[_fence,180,[-56.1167,59.9863,0]],
	[_fence,89,[-60.1089,56.0181,0]],
	[selectRandom _signs,353,[59.5278,-59.5898,0]]
];
private _composition_objects = [_pos, selectRandom [0, 90, 180, 270], _composition_pattern] call btc_fnc_create_composition;


private _mines = [];
for "_i" from 1 to (5 + round random 5) do {
	private _type = "ATMine";
	if (random 1 > 0.6) then {_type = selectRandom btc_type_mines;};
	private _m_pos = [_pos, _area_size - 10] call btc_fnc_randomize_pos;
	_mines pushBack createMine [_type, _m_pos, [], 0];

	if (selectRandom [true, false]) then {
		_m_pos = [_pos, _area_size - 10] call btc_fnc_randomize_pos;
		private _s = createVehicle [selectRandom _signs, _m_pos, [], 10, "CAN_COLLIDE"];
		_s setDir random 360;
		_composition_objects pushBack _s;
	};
};

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || ({_x distance _pos < 200} count playableUnits > 0))};

private _closest = [_city,btc_city_all select {!(_x getVariable ["active",false])}, false] call btc_fnc_find_closecity;
for "_i" from 1 to (round random 2) do {
	[_closest, _pos, 1, selectRandom btc_type_motorized] spawn btc_fnc_mil_send;
};

waitUntil {sleep 5; (btc_side_aborted || btc_side_failed || ({!isNull _x} count _mines == 0))};

btc_side_assigned = false;publicVariable "btc_side_assigned";
if (btc_side_aborted || btc_side_failed) exitWith {
	4 remoteExec ["btc_fnc_task_fail", 0];
	[[_area,_marker], _mines + _composition_objects, [], []] call btc_fnc_delete;
};

30 call btc_fnc_rep_change;

4 remoteExec ["btc_fnc_task_set_done", 0];

[[_area,_marker], _composition_objects, [], []] call btc_fnc_delete;
